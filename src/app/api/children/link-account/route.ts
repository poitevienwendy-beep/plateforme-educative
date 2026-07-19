import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { sql } from '@/lib/db'

/**
 * GET /api/children/link-account?child_id=[id]&code=[supabase_code]
 * Appelé automatiquement après que l'enfant a cliqué sur son lien d'invitation
 * et que Supabase a échangé le code contre une session.
 * Lie le child_user_id au profil enfant existant.
 */
export async function GET(request: NextRequest) {
  const { searchParams, origin } = new URL(request.url)
  const child_id = searchParams.get('child_id')
  const code = searchParams.get('code')

  if (!child_id || !code) {
    return NextResponse.redirect(`${origin}/auth/login?error=lien-invalide`)
  }

  try {
    const supabase = await createClient()

    // Échanger le code contre une session
    const { data: sessionData, error: exchErr } = await supabase.auth.exchangeCodeForSession(code)
    if (exchErr || !sessionData?.user) {
      return NextResponse.redirect(`${origin}/auth/login?error=lien-expire`)
    }

    const newUserId = sessionData.user.id
    const userMeta = sessionData.user.user_metadata

    // Vérifier que le lien d'invitation correspond bien à cet enfant
    if (userMeta?.child_id && userMeta.child_id !== child_id) {
      return NextResponse.redirect(`${origin}/auth/login?error=lien-invalide`)
    }

    // Lier le compte enfant au profil
    await sql`
      UPDATE children
      SET child_user_id = ${newUserId}::uuid
      WHERE id = ${child_id}::uuid
        AND (child_user_id IS NULL OR child_user_id = ${newUserId}::uuid)
    `

    // Rediriger vers le parcours de l'enfant
    return NextResponse.redirect(`${origin}/eleve/${child_id}`)
  } catch (err) {
    console.error('[link-account]', err)
    return NextResponse.redirect(`${origin}/auth/login?error=erreur-serveur`)
  }
}
