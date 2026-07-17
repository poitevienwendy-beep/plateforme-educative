import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { createAdminClient } from '@/lib/supabase/admin'

export async function POST(request: Request) {
  try {
    // 1. Vérifier que l'utilisateur est connecté
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()

    if (authError || !user) {
      return NextResponse.json({ error: 'Non authentifié' }, { status: 401 })
    }

    // 2. Lire les données du body
    const { display_name, birth_year, grade_level } = await request.json()

    if (!display_name || !grade_level) {
      return NextResponse.json({ error: 'Champs manquants' }, { status: 400 })
    }

    // 3. Utiliser l'admin client (bypass PostgREST schema cache + RLS)
    const admin = createAdminClient()

    // Insérer l'enfant
    const { data: child, error: childError } = await admin
      .from('children')
      .insert({
        display_name,
        birth_year: birth_year || null,
        grade_level,
      })
      .select('id')
      .single()

    if (childError) {
      console.error('Erreur insert children:', childError)
      return NextResponse.json({ error: childError.message }, { status: 500 })
    }

    // Créer le lien parent-enfant
    const { error: linkError } = await admin
      .from('parent_child_links')
      .insert({
        parent_id: user.id,
        child_id: child.id,
      })

    if (linkError) {
      console.error('Erreur insert parent_child_links:', linkError)
      // Rollback: supprimer l'enfant créé
      await admin.from('children').delete().eq('id', child.id)
      return NextResponse.json({ error: linkError.message }, { status: 500 })
    }

    return NextResponse.json({ success: true, child_id: child.id })
  } catch (err) {
    console.error('Erreur inattendue:', err)
    return NextResponse.json({ error: 'Erreur serveur' }, { status: 500 })
  }
}
