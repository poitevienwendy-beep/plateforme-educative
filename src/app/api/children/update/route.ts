import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { sql } from '@/lib/db'

export async function PATCH(request: Request) {
  try {
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      return NextResponse.json({ error: 'Non authentifié' }, { status: 401 })
    }

    const { child_id, display_name, birth_year, grade_level } = await request.json()
    if (!child_id || !display_name || !grade_level) {
      return NextResponse.json({ error: 'Champs manquants' }, { status: 400 })
    }

    // Vérifier que ce parent possède cet enfant
    const [link] = await sql`
      SELECT child_id FROM parent_child_links
      WHERE parent_id = ${user.id}::uuid AND child_id = ${child_id}::uuid
    `
    if (!link) {
      return NextResponse.json({ error: 'Accès refusé' }, { status: 403 })
    }

    // Mettre à jour l'enfant
    await sql`
      UPDATE children
      SET
        display_name = ${display_name},
        birth_year   = ${birth_year ?? null},
        grade_level  = ${grade_level}
      WHERE id = ${child_id}::uuid
    `

    return NextResponse.json({ success: true })
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : 'Erreur serveur'
    console.error('Erreur mise à jour enfant:', err)
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
