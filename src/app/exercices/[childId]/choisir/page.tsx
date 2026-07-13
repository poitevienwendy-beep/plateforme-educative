import { createClient } from '@/lib/supabase/server'
import { redirect, notFound } from 'next/navigation'
import Link from 'next/link'

const SUBJECT_EMOJIS: Record<string, string> = {
  mathematiques: '🔢',
  francais: '📖',
}

export default async function ChoisirMatierePage({
  params,
}: {
  params: Promise<{ childId: string }>
}) {
  const { childId } = await params
  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/auth/login')

  // Vérifier accès parent → enfant
  const { data: link } = await supabase
    .from('parent_child_links')
    .select('child_id')
    .eq('parent_id', user.id)
    .eq('child_id', childId)
    .single()

  if (!link) notFound()

  const { data: child } = await supabase
    .from('children')
    .select('*')
    .eq('id', childId)
    .single()

  if (!child) notFound()

  // Matières et compétences du niveau de l'enfant
  const { data: subjects } = await supabase
    .from('subjects')
    .select('id, name, slug, color_hex')
    .eq('is_active', true)
    .order('name')

  const { data: skills } = await supabase
    .from('skills')
    .select('id, name, subject_id, sort_order, pfeq_reference')
    .eq('grade_level', child.grade_level)
    .eq('is_active', true)
    .order('sort_order')

  // Maîtrise BKT par compétence pour cet enfant
  const { data: masteryData } = await supabase
    .from('knowledge_states')
    .select('skill_id, p_mastery')
    .eq('child_id', childId)

  const masteryMap = new Map(
    (masteryData ?? []).map((m) => [m.skill_id, Math.round(m.p_mastery * 100)])
  )

  // Grouper les compétences par matière
  const skillsBySubject: Record<string, any[]> = {}
  for (const skill of skills ?? []) {
    if (!skillsBySubject[skill.subject_id]) skillsBySubject[skill.subject_id] = []
    skillsBySubject[skill.subject_id].push(skill)
  }

  // Compétence recommandée : maîtrise la plus basse (ou jamais pratiquée)
  const allSkillsWithMastery = (skills ?? []).map((s) => ({
    ...s,
    mastery: masteryMap.get(s.id) ?? null,
  }))
  const recommended =
    allSkillsWithMastery
      .filter((s) => s.mastery !== null)
      .sort((a, b) => (a.mastery ?? 100) - (b.mastery ?? 100))[0]
    ?? allSkillsWithMastery[0]

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between">
        <Link href="/dashboard" className="text-sm text-indigo-600 hover:underline">
          ← Retour
        </Link>
        <div className="flex items-center gap-2">
          <div className="w-8 h-8 rounded-full bg-indigo-100 flex items-center justify-center text-sm font-bold text-indigo-600">
            {child.display_name[0].toUpperCase()}
          </div>
          <span className="text-sm font-medium text-gray-700">{child.display_name}</span>
        </div>
      </header>

      <main className="max-w-2xl mx-auto px-6 py-10">

        {/* Titre */}
        <div className="mb-8">
          <h1 className="text-2xl font-bold text-gray-900">
            Que pratique-t-on aujourd&apos;hui ?
          </h1>
          <p className="text-gray-500 mt-1">
            Choisis une compétence pour {child.display_name}.
          </p>
        </div>

        {/* Recommandation BKT */}
        {recommended && (
          <div className="bg-indigo-50 border border-indigo-200 rounded-xl p-4 mb-8 flex items-center justify-between gap-4">
            <div>
              <p className="text-xs font-semibold text-indigo-500 uppercase tracking-wide mb-1">
                ✨ Recommandé
              </p>
              <p className="font-semibold text-gray-900">{recommended.name}</p>
              <p className="text-xs text-gray-500 mt-0.5">
                {recommended.mastery !== null
                  ? `Maîtrise actuelle : ${recommended.mastery}%`
                  : 'Jamais pratiqué — commençons par là !'}
              </p>
            </div>
            <Link
              href={`/exercices/${childId}/session/${recommended.id}`}
              className="shrink-0 bg-indigo-600 text-white font-semibold px-5 py-2.5 rounded-xl hover:bg-indigo-700 transition-colors text-sm"
            >
              Commencer →
            </Link>
          </div>
        )}

        {/* Compétences par matière */}
        <div className="space-y-5">
          {(subjects ?? []).map((subject: any) => {
            const subjectSkills = skillsBySubject[subject.id] ?? []
            if (subjectSkills.length === 0) return null
            const emoji = SUBJECT_EMOJIS[subject.slug] ?? '📚'
            const color = subject.color_hex ?? '#4F46E5'

            return (
              <div key={subject.id} className="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                {/* En-tête matière */}
                <div
                  className="px-6 py-4 flex items-center gap-3"
                  style={{ backgroundColor: color + '18' }}
                >
                  <span className="text-xl">{emoji}</span>
                  <h2 className="font-bold text-gray-800">{subject.name}</h2>
                  <span className="ml-auto text-xs text-gray-400">
                    {subjectSkills.length} compétence{subjectSkills.length > 1 ? 's' : ''}
                  </span>
                </div>

                {/* Liste compétences avec maîtrise */}
                <div className="divide-y divide-gray-50">
                  {subjectSkills.map((skill: any) => {
                    const pct = masteryMap.get(skill.id) ?? null
                    const isRecommended = skill.id === recommended?.id
                    const barColor = pct === null ? '#e5e7eb' : pct >= 80 ? '#10b981' : pct >= 50 ? '#f59e0b' : '#4F46E5'

                    return (
                      <Link
                        key={skill.id}
                        href={`/exercices/${childId}/session/${skill.id}`}
                        className={`flex items-center justify-between px-6 py-4 hover:bg-gray-50 transition-colors group ${isRecommended ? 'bg-indigo-50/40' : ''}`}
                      >
                        <div className="flex-1 min-w-0 pr-4">
                          <div className="flex items-center gap-2 mb-1.5">
                            <p className="font-medium text-gray-800 group-hover:text-indigo-700 truncate">
                              {skill.name}
                            </p>
                            {isRecommended && (
                              <span className="text-xs bg-indigo-100 text-indigo-600 px-2 py-0.5 rounded-full shrink-0">
                                recommandé
                              </span>
                            )}
                          </div>
                          {/* Barre de maîtrise */}
                          <div className="flex items-center gap-2">
                            <div className="w-24 bg-gray-100 rounded-full h-1.5">
                              <div
                                className="h-1.5 rounded-full transition-all duration-500"
                                style={{
                                  width: pct !== null ? `${pct}%` : '0%',
                                  backgroundColor: barColor,
                                }}
                              />
                            </div>
                            <span className="text-xs text-gray-400">
                              {pct !== null ? `${pct}%` : 'Nouveau'}
                            </span>
                          </div>
                        </div>
                        <span className="text-gray-300 group-hover:text-indigo-400 text-lg transition-colors">
                          →
                        </span>
                      </Link>
                    )
                  })}
                </div>
              </div>
            )
          })}
        </div>
      </main>
    </div>
  )
}
