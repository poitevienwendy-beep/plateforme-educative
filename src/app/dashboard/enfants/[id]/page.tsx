import { createClient } from '@/lib/supabase/server'
import { redirect, notFound } from 'next/navigation'
import Link from 'next/link'

const GRADE_LABELS: Record<string, string> = {
  sec1: 'Secondaire 1',
  sec2: 'Secondaire 2',
  sec3: 'Secondaire 3',
  sec4: 'Secondaire 4',
  sec5: 'Secondaire 5',
}

const SUBJECT_EMOJIS: Record<string, string> = {
  mathematiques: '🔢',
  francais: '📖',
}

function formatDate(dateStr: string) {
  return new Date(dateStr).toLocaleDateString('fr-CA', {
    day: 'numeric',
    month: 'short',
    hour: '2-digit',
    minute: '2-digit',
  })
}

export default async function EnfantProfilePage({
  params,
}: {
  params: Promise<{ id: string }>
}) {
  const { id } = await params
  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/auth/login')

  const { data: link } = await supabase
    .from('parent_child_links')
    .select('child_id')
    .eq('parent_id', user.id)
    .eq('child_id', id)
    .single()

  if (!link) notFound()

  const { data: child } = await supabase
    .from('children')
    .select('*')
    .eq('id', id)
    .single()

  if (!child) notFound()

  const { data: subjects } = await supabase
    .from('subjects')
    .select('*')
    .eq('is_active', true)
    .order('name')

  const { data: skills } = await supabase
    .from('skills')
    .select('id, name, subject_id, sort_order')
    .eq('grade_level', child.grade_level)
    .eq('is_active', true)
    .order('sort_order')

  const { data: masteryData } = await supabase
    .from('knowledge_states')
    .select('skill_id, p_mastery')
    .eq('child_id', id)

  const { data: recentSessions } = await supabase
    .from('exercise_sessions')
    .select('id, skill_id, correct_answers, total_questions, started_at')
    .eq('child_id', id)
    .order('started_at', { ascending: false })
    .limit(8)

  const masteryMap = new Map((masteryData ?? []).map((m) => [m.skill_id, m.p_mastery]))
  const skillsMap = new Map((skills ?? []).map((s) => [s.id, s]))

  // Maîtrise globale
  const allMasteries = (masteryData ?? []).map((m) => m.p_mastery)
  const globalMastery =
    allMasteries.length > 0
      ? Math.round((allMasteries.reduce((a, b) => a + b, 0) / allMasteries.length) * 100)
      : null

  // Matières avec compétences et maîtrise
  const subjectsWithData = (subjects ?? []).map((subject) => {
    const subjectSkills = (skills ?? [])
      .filter((s) => s.subject_id === subject.id)
      .sort((a, b) => a.sort_order - b.sort_order)
    const masteries = subjectSkills.map((s) => masteryMap.get(s.id) ?? 0)
    const avg =
      masteries.length > 0
        ? masteries.reduce((a, b) => a + b, 0) / masteries.length
        : 0
    return { ...subject, mastery: avg, skills: subjectSkills }
  })

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between">
        <Link href="/dashboard" className="text-sm text-indigo-600 hover:underline">
          ← Tableau de bord
        </Link>
        <span className="text-xs text-gray-400 uppercase tracking-wide">Profil enfant</span>
      </header>

      <main className="max-w-3xl mx-auto px-6 py-10 space-y-8">

        {/* Carte profil + CTAs */}
        <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6 flex flex-col sm:flex-row sm:items-center gap-6">
          <div className="flex items-center gap-4 flex-1">
            <div className="w-16 h-16 rounded-full bg-indigo-100 flex items-center justify-center text-2xl font-bold text-indigo-600 shrink-0">
              {child.display_name[0].toUpperCase()}
            </div>
            <div>
              <h1 className="text-xl font-bold text-gray-900">{child.display_name}</h1>
              <p className="text-sm text-gray-500">
                {GRADE_LABELS[child.grade_level] ?? child.grade_level}
                {child.birth_year && ` · Né(e) en ${child.birth_year}`}
              </p>
              {globalMastery !== null ? (
                <div className="flex items-center gap-2 mt-2">
                  <div className="w-28 bg-gray-100 rounded-full h-1.5">
                    <div
                      className="h-1.5 rounded-full bg-indigo-500"
                      style={{ width: `${globalMastery}%` }}
                    />
                  </div>
                  <span className="text-xs text-gray-400">{globalMastery}% maîtrise globale</span>
                </div>
              ) : (
                <p className="text-xs text-gray-400 mt-1">Aucune session encore</p>
              )}
            </div>
          </div>
          <div className="flex flex-col gap-2 sm:items-end shrink-0">
            <Link
              href={`/eleve/${child.id}`}
              className="inline-flex items-center justify-center gap-2 bg-indigo-600 text-white font-semibold px-5 py-2.5 rounded-xl hover:bg-indigo-700 transition-colors text-sm"
            >
              🎓 Interface élève
            </Link>
            <Link
              href={`/dashboard/enfants/${child.id}/rapport`}
              className="inline-flex items-center justify-center gap-2 border border-gray-200 text-gray-500 font-medium px-5 py-2 rounded-xl hover:bg-gray-50 transition-colors text-sm"
            >
              📊 Rapport complet
            </Link>
          </div>
        </div>

        {/* Maîtrise par matière avec compétences détaillées */}
        <div>
          <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-wide mb-3">
            Maîtrise par matière
          </h2>
          <div className="space-y-4">
            {subjectsWithData.map((subject) => {
              const pct = Math.round(subject.mastery * 100)
              const barColor = pct >= 80 ? '#10b981' : pct >= 50 ? '#f59e0b' : '#4F46E5'
              const emoji = SUBJECT_EMOJIS[subject.slug] ?? '📚'

              return (
                <div
                  key={subject.id}
                  className="bg-white rounded-xl border border-gray-100 shadow-sm overflow-hidden"
                >
                  {/* En-tête matière */}
                  <div className="px-5 py-4 flex items-center gap-3 border-b border-gray-50">
                    <span className="text-xl">{emoji}</span>
                    <div className="flex-1">
                      <div className="flex items-center justify-between mb-1.5">
                        <p className="font-semibold text-gray-900">{subject.name}</p>
                        <span className="font-bold text-sm" style={{ color: barColor }}>
                          {pct}%
                        </span>
                      </div>
                      <div className="w-full bg-gray-100 rounded-full h-1.5">
                        <div
                          className="h-1.5 rounded-full transition-all duration-500"
                          style={{ width: `${pct}%`, backgroundColor: barColor }}
                        />
                      </div>
                    </div>
                  </div>

                  {/* Compétences individuelles */}
                  <div className="px-5 py-3 space-y-2.5">
                    {subject.skills.map((skill: any) => {
                      const sPct = Math.round((masteryMap.get(skill.id) ?? 0) * 100)
                      const sColor =
                        sPct >= 80 ? '#10b981' : sPct >= 50 ? '#f59e0b' : '#4F46E5'
                      const isPracticed = masteryMap.has(skill.id)

                      return (
                        <div key={skill.id} className="flex items-center gap-3">
                          <span className="text-xs text-gray-600 w-40 truncate shrink-0">
                            {skill.name}
                          </span>
                          <div className="flex-1 bg-gray-100 rounded-full h-1">
                            <div
                              className="h-1 rounded-full transition-all duration-500"
                              style={{
                                width: `${sPct}%`,
                                backgroundColor: sColor,
                              }}
                            />
                          </div>
                          <span
                            className="text-xs w-10 text-right shrink-0"
                            style={{ color: isPracticed ? sColor : '#9ca3af' }}
                          >
                            {isPracticed ? `${sPct}%` : '—'}
                          </span>
                        </div>
                      )
                    })}
                  </div>
                </div>
              )
            })}
          </div>
        </div>

        {/* Sessions récentes */}
        <div>
          <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-wide mb-3">
            Sessions récentes
          </h2>

          {!recentSessions || recentSessions.length === 0 ? (
            <div className="bg-white border border-dashed border-gray-200 rounded-xl p-10 text-center">
              <p className="text-4xl mb-3">🎯</p>
              <p className="text-gray-400 text-sm">Aucune session pour l&apos;instant.</p>
              <Link
                href={`/exercices/${child.id}/choisir`}
                className="inline-block mt-4 text-indigo-600 text-sm font-medium hover:underline"
              >
                Commencer la première session →
              </Link>
            </div>
          ) : (
            <div className="bg-white rounded-xl border border-gray-100 shadow-sm divide-y divide-gray-50">
              {recentSessions.map((session) => {
                const skill = skillsMap.get(session.skill_id)
                const pct =
                  session.total_questions > 0
                    ? Math.round(
                        (session.correct_answers / session.total_questions) * 100
                      )
                    : 0
                const resultEmoji = pct >= 80 ? '🎉' : pct >= 50 ? '👍' : '💪'
                const scoreColor =
                  pct >= 80
                    ? 'text-emerald-600'
                    : pct >= 50
                    ? 'text-amber-500'
                    : 'text-indigo-500'

                return (
                  <div
                    key={session.id}
                    className="flex items-center justify-between px-5 py-4"
                  >
                    <div>
                      <p className="font-medium text-gray-800 text-sm">
                        {resultEmoji} {skill?.name ?? 'Compétence'}
                      </p>
                      <p className="text-xs text-gray-400 mt-0.5">
                        {formatDate(session.started_at)}
                      </p>
                    </div>
                    <div className="text-right">
                      <p className={`font-bold text-sm ${scoreColor}`}>{pct}%</p>
                      <p className="text-xs text-gray-400">
                        {session.correct_answers}/{session.total_questions} bonnes rép.
                      </p>
                    </div>
                  </div>
                )
              })}
            </div>
          )}
        </div>

      </main>
    </div>
  )
}
