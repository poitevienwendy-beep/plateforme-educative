import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { createAdminClient } from '@/lib/supabase/admin'
import { sql } from '@/lib/db'

/**
 * POST /api/children/invite
 * Envoie une invitation par courriel à un enfant (mode autonomie secondaire).
 * Le courriel contient un lien Supabase qui crée un compte enfant lié au profil.
 * Body: { child_id: string, child_email: string }
 */
export async function POST(request: Request) {
  try {
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      return NextResponse.json({ error: 'Non authentifié' }, { status: 401 })
    }

    const { child_id, child_email } = await request.json()

    if (!child_id || !child_email || !child_email.includes('@')) {
      return NextResponse.json({ error: 'Données invalides' }, { status: 400 })
    }

    // Vérifier que ce parent possède cet enfant
    const [link] = await sql`
      SELECT child_id FROM parent_child_links
      WHERE parent_id = ${user.id}::uuid AND child_id = ${child_id}::uuid
    `
    if (!link) {
      return NextResponse.json({ error: 'Accès refusé' }, { status: 403 })
    }

    const [child] = await sql`
      SELECT id, display_name, grade_level FROM children WHERE id = ${child_id}::uuid
    `
    if (!child) {
      return NextResponse.json({ error: 'Enfant introuvable' }, { status: 404 })
    }

    const admin = createAdminClient()

    // Générer le lien d'invitation Supabase
    // Le redirect_to pointe vers /auth/callback?next=/acces-enfant/setup/[childId]
    const redirectTo = `${process.env.NEXT_PUBLIC_SITE_URL}/api/children/link-account?child_id=${child_id}`

    const { data: inviteData, error: inviteErr } = await admin.auth.admin.inviteUserByEmail(
      child_email,
      {
        redirectTo,
        data: {
          is_child: true,
          child_id: child_id,
          display_name: child.display_name,
          parent_id: user.id,
        },
      }
    )

    if (inviteErr) {
      // Si l'utilisateur existe déjà, on essaie de générer un magic link
      if (inviteErr.message?.includes('already been registered')) {
        const { data: ml, error: mlErr } = await admin.auth.admin.generateLink({
          type: 'magiclink',
          email: child_email,
          options: { redirectTo },
        })
        if (mlErr || !ml) {
          return NextResponse.json({ error: 'Ce courriel est déjà utilisé' }, { status: 409 })
        }
      } else {
        return NextResponse.json({ error: 'Erreur invitation: ' + inviteErr.message }, { status: 500 })
      }
    }

    // Sauvegarder le mode autonomie + courriel en attente
    await sql`
      UPDATE children
      SET
        autonomy_mode = TRUE,
        child_email   = ${child_email},
        child_pin_hash = NULL,
        child_system_password = NULL
      WHERE id = ${child_id}::uuid
    `

    return NextResponse.json({
      success: true,
      message: `Invitation envoyée à ${child_email}`,
    })
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : 'Erreur serveur'
    console.error('[invite]', err)
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
