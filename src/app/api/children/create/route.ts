import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import postgres from 'postgres'

// Connexion directe PostgreSQL — bypass total PostgREST
const sql = postgres(process.env.DATABASE_URL!, {
  ssl: 'require',
  max: 1, // Important pour serverless (Vercel)
  idle_timeout: 20,
  connect_timeout: 10,
})

export async function POST(request: Request) {
  try {
    // 1. Vérifier l'auth via Supabase (fonctionne même avec PostgREST cassé)
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()

    if (authError || !user) {
      return NextResponse.json({ error: 'Non authentifié' }, { status: 401 })
    }

    // 2. Lire les données
    const { display_name, birth_year, grade_level } = await request.json()

    if (!display_name || !grade_level) {
      return NextResponse.json({ error: 'Champs manquants' }, { status: 400 })
    }

    // 3. S'assurer que le profil parent existe (FK parent_child_links → profiles)
    await sql`
      INSERT INTO profiles (id, plan)
      VALUES (${user.id}::uuid, 'free')
      ON CONFLICT (id) DO NOTHING
    `

    // 4. Insertion directe SQL — aucun PostgREST impliqué
    const [child] = await sql`
      INSERT INTO children (display_name, birth_year, grade_level)
      VALUES (${display_name}, ${birth_year ?? null}, ${grade_level})
      RETURNING id
    `

    await sql`
      INSERT INTO parent_child_links (parent_id, child_id)
      VALUES (${user.id}::uuid, ${child.id}::uuid)
    `

    return NextResponse.json({ success: true, child_id: child.id })

  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : 'Erreur serveur'
    console.error('Erreur création enfant:', err)
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
