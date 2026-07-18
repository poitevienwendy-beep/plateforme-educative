import { createClient } from '@/lib/supabase/server'
import { redirect, notFound } from 'next/navigation'
import Link from 'next/link'
import ReportCharts from '@/components/charts/ReportCharts'
import { sql } from '@/lib/db'
import type { WeekData } from '@/components/charts/ProgressionChart'
import type { SkillData } from '@/components/charts/PrecisionBarChart'

const GRADE_LABELS: Record<string, string> = {
  sec1: 'Secondaire 1',
  sec2: 'Secondaire 2',
  sec3: 'Secondaire 3',
  sec4: 'Secondaire 4',
  sec5: 'Secondaire 5',
}

function formatDate(dateStr: string) {
  return new Date(dateStr).toLocaleDateString('fr-CA', {
    day: 'numeric', month: 'long', year: 'numeric',
  })
}

/** Regroupe les sessions + XP par semaine sur les N dernieres semaines */
function buildWeeklyData(
  sessions: { started_at: string; correct_answers: number; total_questions: number }[],
  xpLogs: { created_at: string; amount: number }[],
  weeks = 8
): WeekData[] {
  const now = new Date()
  const result: WeekData[] = []

  for (let i = weeks - 1; i >= 0; i--) {
    const wStart = new Date(now)
    wStart.setDate(now.getDate() - i * 7 - now.getDay())
    wStart.setHours(0, 0, 0, 0)
    const wEnd = new Date(wStart)
    wEnd.setDate(wStart.getDate() + 7)

    const weekSessions = sessions.filter((s) => {
      const d = new Date(s.started_at)
      return d >= wStart && d < wEnd
    })
    const weekXp = xpLogs
      .filter((x) => { const d = new Date(x.created_at); return d >= wStart && d < wEnd })
      .reduce((sum, x) => sum + x.amount, 0)
    const totalCorrect = weekSessions.reduce((s, w) => s + (w.correct_answers ?? 0), 0)
    const totalQ = weekSessions.reduce((s, w) => s + (w.total_questions ?? 0), 0)
    const avgPct = totalQ > 0 ? Math.round((totalCorrect / totalQ) * 100) : 0

    result.push({
      week: wStart.toLocaleDateString('fr-CA', { month: 'short', day: 'numeric' }),
      xp: weekXp,
      sessions: weekSessions.length,
      avgPct,
    })
  }
  return result
}

export default async function RapportPage({
  params,
}: {
  params: Promise<{ id: string }>
}) {
  const { id } = await params
  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/auth/login')

  // postgres direct — parent_child_links et children absents du cache PostgREST
  const [link] = await sql`
    SELECT child_id FROM parent_child_links
    WHERE parent_id = ${user.id}::uuid AND child_id = ${id}::uuid
  `
  if (!link) notFound()

  const [child] = await sql`SELECT * FROM children WHERE id = ${id}::uuid`
  if (!child) notFound()

  const [
    { data: subjects },
    { data: skills },
    { data: masteryData },
    { data: allSessions },
    { data: xpLogs },
    { data: streakData },
  ] = await Promise.all([
    supabase.from('subjects').select('*').eq('is_active', true).order('name'),
    supabase.from('skills').select('id, name, subject_id, sort_order').eq('grade_level', child.grade_level).eq('is_active', true),
    supabase.from('knowledge_states').select('skill_id, p_mastery').eq('child_id', id),
    supabase.from('exercise_sessions').select('id, skill_id, correct_answers, total_questions, started_at').eq('child_id', id).gt('total_questions', 0).order('started_at', { ascending: false }),
    supabase.from('xp_log').select('amount, created_at').eq('child_id', id),
    supabase.from('streaks').select('current_streak, longest_streak, last_session_date').eq('child_id', id).maybeSingle(),
  ])

  // ── Calculs globaux ────────────────────────────────────────
  const masteryMap = new Map((masteryData ?? []).map((m) => [m.skill_id, m.p_mastery]))
  const skillsMap  = new Map((skills ?? []).map((s) => [s.id, s]))

  const completedSessions = allSessions ?? []
  const totalSessions  = completedSessions.length
  const totalCorrect   = completedSessions.reduce((sum, s) => sum + (s.correct_answers ?? 0), 0)
  const totalQuestions = completedSessions.reduce((sum, s) => sum + (s.total_questions ?? 0), 0)
  const overallPct     = totalQuestions > 0 ? Math.round((totalCorrect / totalQuestions) * 100) : 0

  const skillsWithMastery = (skills ?? []).map((s) => ({
    ...s,
    pct: Math.round((masteryMap.get(s.id) ?? 0) * 100),
    practiced: masteryMap.has(s.id),
  })).sort((a, b) => b.pct - a.pct)

  const topSkills  = skillsWithMastery.filter((s) => s.practiced && s.pct >= 60)
  const weakSkills = skillsWithMastery.filter((s) => s.practiced && s.pct < 40)

  const subjectsWithSkills = (subjects ?? []).map((subject) => {
    const subjectSkills = skillsWithMastery.filter((s) => s.subject_id === subject.id)
    const practiced = subjectSkills.filter((s) => s.practiced)
    const avgPct = practiced.length > 0
      ? Math.round(practiced.reduce((sum, s) => sum + s.pct, 0) / practiced.length)
      : 0
    return { ...subject, skills: subjectSkills, avgPct }
  })

  // ── Donnees graphiques ─────────────────────────────────────
  const weeklyData: WeekData[] = buildWeeklyData(completedSessions, xpLogs ?? [])

  const skillBarData: SkillData[] = skillsWithMastery
    .filter((s) => s.practiced)
    .slice(0, 12)
    .map((s) => ({
      name: s.name.length > 16 ? s.name.slice(0, 15) + '...' : s.name,
      pct: s.pct,
      subject: '',
    }))

  // ── Streak ─────────────────────────────────────────────────
  const currentStreak = streakData?.current_streak ?? 0
  const longestStreak = streakData?.longest_streak ?? 0
  const todayStr      = new Date().toISOString().slice(0, 10)
  const streakActive  = streakData?.last_session_date === todayStr

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white border-b border-gray-200 px-8 py-4 flex items-center justify-between">
        <div className="flex items-center gap-3">
          <Link href={`/dashboard/enfants/${id}`} className="text-sm text-indigo-600 hover:underline">
            &larr; Retour au profil
          </Link>
          <span className="text-gray-300">|</span>
          <Link href="/dashboard" className="text-sm text-gray-400 hover:underline">
            Tableau de bord
          </Link>
        </div>
        {/* Bouton envoyer rapport email */}
        <form action={`/api/email/weekly-report?childId=${id}`} method="POST">
          <button
            type="submit"
            className="text-sm bg-indigo-600 text-white px-4 py-2 rounded-lg hover:bg-indigo-700 transition-colors"
          >
            Envoyer le rapport par email
          </button>
        </form>
      </header>

      <main className="max-w-4xl mx-auto px-8 py-10">
        {/* Titre */}
        <div className="mb-8">
          <h1 className="text-2xl font-bold text-gray-900">
            Rapport de progression &mdash; {child.display_name}
          </h1>
          <p className="text-gray-500 mt-1">
            {GRADE_LABELS[child.grade_level] ?? child.grade_level}
            {child.birth_year && ` · Ne(e) en ${child.birth_year}`}
          </p>
        </div>

        {/* Stats globales */}
        <div className="grid grid-cols-2 sm:grid-cols-4 gap-4 mb-10">
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-5">
            <p className="text-xs text-gray-500 mb-1">Sessions</p>
            <p className="text-3xl font-bold text-indigo-600">{totalSessions}</p>
          </div>
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-5">
            <p className="text-xs text-gray-500 mb-1">Score moyen</p>
            <p className="text-3xl font-bold text-indigo-600">{overallPct}%</p>
            <p className="text-xs text-gray-400 mt-1">{totalCorrect}/{totalQuestions}</p>
          </div>
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-5">
            <p className="text-xs text-gray-500 mb-1">XP total</p>
            <p className="text-3xl font-bold text-amber-500">{child.total_xp ?? 0}</p>
          </div>
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-5">
            <p className="text-xs text-gray-500 mb-1">Streak</p>
            <p className="text-3xl font-bold" style={{ color: streakActive ? '#f97316' : '#6b7280' }}>
              {currentStreak} {currentStreak > 0 ? '🔥' : ''}
            </p>
            <p className="text-xs text-gray-400 mt-1">Record : {longestStreak}</p>
          </div>
        </div>

        <ReportCharts weeklyData={weeklyData} skillBarData={skillBarData} />

        {/* Points forts */}
        {topSkills.length > 0 && (
          <div className="mb-8">
            <h2 className="text-lg font-semibold text-gray-800 mb-3">🌟 Points forts</h2>
            <div className="bg-white rounded-xl border border-gray-100 shadow-sm divide-y divide-gray-50">
              {topSkills.map((skill) => (
                <div key={skill.id} className="flex items-center justify-between px-5 py-3">
                  <span className="text-sm font-medium text-gray-800">{skill.name}</span>
                  <span className="text-sm font-bold text-emerald-600">{skill.pct}%</span>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* A renforcer */}
        {weakSkills.length > 0 && (
          <div className="mb-8">
            <h2 className="text-lg font-semibold text-gray-800 mb-3">💪 A renforcer</h2>
            <div className="bg-white rounded-xl border border-gray-100 shadow-sm divide-y divide-gray-50">
              {weakSkills.map((skill) => (
                <div key={skill.id} className="flex items-center justify-between px-5 py-3">
                  <span className="text-sm font-medium text-gray-800">{skill.name}</span>
                  <span className="text-sm font-bold text-amber-500">{skill.pct}%</span>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Toutes les competences */}
        <h2 className="text-lg font-semibold text-gray-800 mb-4">Detail par matiere</h2>
        <div className="space-y-5 mb-10">
          {subjectsWithSkills.map((subject) => (
            <div key={subject.id} className="bg-white rounded-xl border border-gray-100 shadow-sm p-5">
              <div className="flex items-center gap-3 mb-4">
                <div
                  className="w-8 h-8 rounded-lg flex items-center justify-center text-sm"
                  style={{ backgroundColor: subject.color_hex ?? '#4F46E5' }}
                >
                  {subject.slug === 'mathematiques' ? '🔢' : subject.slug === 'francais' ? '📖' : '📚'}
                </div>
                <div>
                  <p className="font-semibold text-gray-900">{subject.name}</p>
                  <p className="text-xs text-gray-400">
                    Moyenne : {subject.avgPct > 0 ? `${subject.avgPct}%` : 'Non evalue'}
                  </p>
                </div>
              </div>
              <div className="space-y-3">
                {/* eslint-disable-next-line @typescript-eslint/no-explicit-any */}
                {(subject.skills as any[]).map((skill) => {
                  const color = skill.pct >= 80 ? '#10b981' : skill.pct >= 50 ? '#f59e0b' : '#4F46E5'
                  return (
                    <div key={skill.id}>
                      <div className="flex justify-between text-xs mb-1">
                        <span className={skill.practiced ? 'text-gray-700' : 'text-gray-400'}>{skill.name}</span>
                        <span style={{ color: skill.practiced ? color : '#d1d5db' }}>
                          {skill.practiced ? `${skill.pct}%` : 'Non pratique'}
                        </span>
                      </div>
                      <div className="w-full bg-gray-100 rounded-full h-1.5">
                        <div
                          className="h-1.5 rounded-full transition-all duration-500"
                          style={{ width: `${skill.pct}%`, backgroundColor: skill.practiced ? color : '#e5e7eb' }}
                        />
                      </div>
                    </div>
                  )
                })}
              </div>
            </div>
          ))}
        </div>

        {/* Historique sessions */}
        <h2 className="text-lg font-semibold text-gray-800 mb-4">Historique des sessions</h2>
        {completedSessions.length === 0 ? (
          <div className="bg-white border border-dashed border-gray-200 rounded-xl p-8 text-center text-gray-400">
            Aucune session completee pour l&apos;instant.
          </div>
        ) : (
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm divide-y divide-gray-50">
            {completedSessions.slice(0, 30).map((session) => {
              const skill = skillsMap.get(session.skill_id)
              const pct = session.total_questions > 0
                ? Math.round((session.correct_answers / session.total_questions) * 100)
                : 0
              const emoji = pct >= 80 ? '🎉' : pct >= 50 ? '👍' : '💪'
              return (
                <div key={session.id} className="flex items-center justify-between px-5 py-3">
                  <div>
                    <p className="text-sm font-medium text-gray-800">{emoji} {skill?.name ?? 'Competence'}</p>
                    <p className="text-xs text-gray-400">{formatDate(session.started_at)}</p>
                  </div>
                  <div className="text-right">
                    <p className="text-sm font-bold text-gray-900">{pct}%</p>
                    <p className="text-xs text-gray-400">{session.correct_answers}/{session.total_questions}</p>
                  </div>
                </div>
              )
            })}
          </div>
        )}
      </main>
    </div>
  )
}
