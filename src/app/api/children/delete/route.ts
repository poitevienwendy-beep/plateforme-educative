import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { sql } from '@/lib/db'

export async function DELETE(request: Request) {
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

    // Vérifier que ce parent possède cet enfant
    const [link] = await sql`
      SELECT child_id FROM parent_child_links
      WHERE parent_id = ${user.id}::uuid AND child_id = ${child_id}::uuid
    `
    if (!link) {
      return NextResponse.json({ error: 'Accès refusé' }, { status: 403 })
    }

    // Supprimer le lien parent-enfant
    await sql`
      DELETE FROM parent_child_links
      WHERE parent_id = ${user.id}::uuid AND child_id = ${child_id}::uuid
    `

    // Supprimer l'enfant (et toutes ses données en cascade)
    await sql`DELETE FROM children WHERE id = ${child_id}::uuid`

    return NextResponse.json({ success: true })
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : 'Erreur serveur'
    console.error('Erreur suppression enfant:', err)
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
