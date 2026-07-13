import { NextRequest, NextResponse } from 'next/server'
import { createAdminClient } from '@/lib/supabase/admin'

// GET /api/admin/questions?type=skills
// GET /api/admin/questions?type=questions&skill_id=uuid
export async function GET(req: NextRequest) {
  const supabase = createAdminClient()
  const { searchParams } = new URL(req.url)
  const type = searchParams.get('type')

  if (type === 'skills') {
    // 1. Charger les matières
    const { data: subjectsData } = await supabase
      .from('subjects')
      .select('id, name')

    const subjectMap = new Map((subjectsData ?? []).map((s: any) => [s.id, s.name]))

    // 2. Charger les compétences
    const { data: skillsData, error } = await supabase
      .from('skills')
      .select('id, name, grade_level, subject_id')
      .eq('is_active', true)
      .order('grade_level')

    if (error) return NextResponse.json({ error: error.message }, { status: 500 })

    // 3. Compter par compétence avec COUNT exact (évite la limite 1000 lignes)
    const skills = await Promise.all(
      (skillsData ?? []).map(async (s: any) => {
        const { count } = await supabase
          .from('questions')
          .select('id', { count: 'exact', head: true })
          .eq('skill_id', s.id)
          .eq('is_active', true)

        return {
          id: s.id,
          name: s.name,
          grade_level: s.grade_level,
          subject_name: subjectMap.get(s.subject_id) ?? '',
          question_count: count ?? 0,
        }
      })
    )

    return NextResponse.json({ skills })
  }

  if (type === 'questions') {
    const skillId = searchParams.get('skill_id')
    if (!skillId) return NextResponse.json({ error: 'skill_id requis' }, { status: 400 })

    const { data, error } = await supabase
      .from('questions')
      .select('id, title, difficulty_level, skill_id, is_active, content, explanation')
      .eq('skill_id', skillId)
      .order('difficulty_level')
      .limit(500)

    if (error) return NextResponse.json({ error: error.message }, { status: 500 })
    return NextResponse.json({ questions: data ?? [] })
  }

  return NextResponse.json({ error: 'type invalide' }, { status: 400 })
}

// POST /api/admin/questions
// Body: { action: 'toggle', question_id: string, is_active: boolean }
export async function POST(req: NextRequest) {
  const supabase = createAdminClient()
  const body = await req.json()

  if (body.action === 'toggle') {
    const { error } = await supabase
      .from('questions')
      .update({ is_active: body.is_active })
      .eq('id', body.question_id)

    if (error) return NextResponse.json({ error: error.message }, { status: 500 })
    return NextResponse.json({ ok: true })
  }

  return NextResponse.json({ error: 'action invalide' }, { status: 400 })
}
