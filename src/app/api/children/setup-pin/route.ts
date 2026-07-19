import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { createAdminClient } from '@/lib/supabase/admin'
import { sql } from '@/lib/db'
import { createHash, randomBytes } from 'crypto'

/**
 * POST /api/children/setup-pin
 * Configure un PIN 4 chiffres pour l'accès enfant (mode primaire).
 * Crée un compte Supabase système pour l'enfant si inexistant.
 * Body: { child_id: string, pin: string (4 chiffres) }
 */
export async function POST(request: Request) {
  try {
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      return NextResponse.json({ error: 'Non authentifié' }, { status: 401 })
    }

    const { child_id, pin } = await request.json()

    if (!child_id || !pin || !/^\d{4}$/.test(pin)) {
      return NextResponse.json({ error: 'PIN invalide (4 chiffres requis)' }, { status: 400 })
    }

    // Vérifier que ce parent possède cet enfant
    const [link] = await sql`
      SELECT child_id FROM parent_child_links
      WHERE parent_id = ${user.id}::uuid AND child_id = ${child_id}::uuid
    `
    if (!link) {
      return NextResponse.json({ error: 'Accès refusé' }, { status: 403 })
    }

    // Lire le profil existant de l'enfant
    const [child] = await sql`
      SELECT id, display_name, child_user_id, child_system_password
      FROM children WHERE id = ${child_id}::uuid
    `
    if (!child) {
      return NextResponse.json({ error: 'Enfant introuvable' }, { status: 404 })
    }

    const admin = createAdminClient()

    let childUserId: string = child.child_user_id
    let systemPassword: string = child.child_system_password

    // Créer le compte système si inexistant
    if (!childUserId) {
      systemPassword = randomBytes(32).toString('hex')
      const systemEmail = `child_${child_id}@internal.savoila.app`

      const { data: newUser, error: createErr } = await admin.auth.admin.createUser({
        email: systemEmail,
        password: systemPassword,
        email_confirm: true,
        user_metadata: {
          is_child: true,
          child_id: child_id,
          display_name: child.display_name,
        },
      })
      if (createErr || !newUser?.user) {
        return NextResponse.json({ error: 'Erreur création compte enfant: ' + createErr?.message }, { status: 500 })
      }
      childUserId = newUser.user.id
    }

    // Hasher le PIN : sha256(pin + child_id) — suffisant pour 4 chiffres avec UUID salt
    const pinHash = createHash('sha256')
      .update(pin + child_id)
      .digest('hex')

    // Sauvegarder dans la base
    await sql`
      UPDATE children
      SET
        child_pin_hash        = ${pinHash},
        child_system_password = ${systemPassword},
        child_user_id         = ${childUserId}::uuid,
        autonomy_mode         = FALSE
      WHERE id = ${child_id}::uuid
    `

    return NextResponse.json({
      success: true,
      child_user_id: childUserId,
      access_url: `/acces-enfant/${child_id}`,
    })
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : 'Erreur serveur'
    console.error('[setup-pin]', err)
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
