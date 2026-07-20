import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { sql } from '@/lib/db'

/**
 * POST /api/children/complete-invite
 * Lie le compte Supabase de l'enfant (connexion via lien invitation) au profil enfant.
 * Appelé côté client après que le SDK Supabase a traité le #access_token du fragment URL.
 * Body: { child_id: string }
 */
export async function POST(request: Request) {
  try {
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()

    if (authError || !user) {
      return NextResponse.json({ error: 'Non authentifié' }, { status: 401 })
    }

    const { child_id } = await request.json()
    if (!child_id) {
      return NextResponse.json({ error: 'child_id manquant' }, { status: 400 })
    }

    // Lier le compte utilisateur Supabase au profil enfant
    const result = await sql`
      UPDATE children
      SET child_user_id = ${user.id}::uuid
      WHERE id = ${child_id}::uuid
        AND (child_user_id IS NULL OR child_user_id = ${user.id}::uuid)
      RETURNING id
    `

    if (!result.length) {
      return NextResponse.json({ error: 'Profil enfant introuvable ou déjà lié.' }, { status: 404 })
    }

    return NextResponse.json({ success: true })
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : 'Erreur serveur'
    console.error('[complete-invite]', err)
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
