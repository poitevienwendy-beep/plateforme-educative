import { NextResponse } from 'next/server'
import { createAdminClient } from '@/lib/supabase/admin'
import { sql } from '@/lib/db'
import { createHash } from 'crypto'

/**
 * POST /api/children/validate-pin
 * Valide le PIN d'un enfant et retourne une session Supabase.
 * PUBLIC (pas de parent auth) — appelé depuis la page /acces-enfant/[childId]
 * Body: { child_id: string, pin: string }
 */
export async function POST(request: Request) {
  try {
    const { child_id, pin } = await request.json()

    if (!child_id || !pin || !/^\d{4}$/.test(pin)) {
      return NextResponse.json({ error: 'Données invalides' }, { status: 400 })
    }

    // Récupérer le hash PIN et les credentials système via admin (bypass RLS)
    const admin = createAdminClient()
    const [child] = await sql`
      SELECT
        id, display_name, grade_level,
        child_pin_hash, child_system_password, child_user_id
      FROM children
      WHERE id = ${child_id}::uuid
    `

    if (!child || !child.child_pin_hash || !child.child_system_password || !child.child_user_id) {
      // Délai anti-timing pour éviter l'énumération
      await new Promise(r => setTimeout(r, 300))
      return NextResponse.json({ error: 'PIN ou accès non configuré' }, { status: 401 })
    }

    // Valider le PIN
    const pinHash = createHash('sha256')
      .update(pin + child_id)
      .digest('hex')

    if (pinHash !== child.child_pin_hash) {
      await new Promise(r => setTimeout(r, 300))
      return NextResponse.json({ error: 'PIN incorrect' }, { status: 401 })
    }

    // PIN valide → créer une session pour l'enfant via admin
    const systemEmail = `child_${child_id}@internal.savoila.app`
    const { data: session, error: signInErr } = await admin.auth.admin.generateLink({
      type: 'magiclink',
      email: systemEmail,
    })

    if (signInErr || !session) {
      return NextResponse.json({ error: 'Erreur création session: ' + signInErr?.message }, { status: 500 })
    }

    // Extraire le token depuis le magic link généré
    const linkUrl = new URL(session.properties.action_link)
    const tokenHash = linkUrl.searchParams.get('token_hash')
    const emailOtpType = linkUrl.searchParams.get('type')

    return NextResponse.json({
      success: true,
      token_hash: tokenHash,
      type: emailOtpType,
      child_id: child.id,
      display_name: child.display_name,
      grade_level: child.grade_level,
    })
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : 'Erreur serveur'
    console.error('[validate-pin]', err)
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
