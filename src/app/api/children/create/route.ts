import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { createAdminClient } from '@/lib/supabase/admin'
import postgres from 'postgres'

// Connexion directe PostgreSQL — pour tables absentes du cache PostgREST
const sql = postgres(process.env.DATABASE_URL!, {
  ssl: 'require',
  max: 1,
  idle_timeout: 20,
  connect_timeout: 10,
})

export async function POST(request: Request) {
  try {
    // 1. Vérifier l'auth
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

    // 3. Upsert profil via admin client (profiles EST dans le cache PostgREST)
    const admin = createAdminClient()
    await admin.from('profiles').upsert(
      { id: user.id, plan: 'free' },
      { onConflict: 'id', ignoreDuplicates: true }
    )

    // 4. Insérer l'enfant via postgres direct (children absent du cache)
    const [child] = await sql`
      INSERT INTO children (display_name, birth_year, grade_level)
      VALUES (${display_name}, ${birth_year ?? null}, ${grade_level})
      RETURNING id
    `

    // 5. Créer le lien parent-enfant via postgres direct
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
