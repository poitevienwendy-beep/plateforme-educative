import { createClient } from '@/lib/supabase/server'
import { createAdminClient } from '@/lib/supabase/admin'
import { redirect, notFound } from 'next/navigation'
import Link from 'next/link'
import ConsentModal from '@/components/ConsentModal'
import OfflineBanner from '@/components/OfflineBanner'
import { BktLockedCard, PremiumLockedCard } from './LockedSkillCard'

const SUBJECT_EMOJIS: Record<string, string> = {
  mathematiques: '🔢',
  francais: '📖',
}

const LEVELS = [
  { name: 'Apprenti',    min: 0,     max: 499,   icon: '🌱', color: '#6b7280' },
  { name: 'Exploreur',  min: 500,   max: 1499,  icon: '🔭', color: '#3b82f6' },
  { name: 'Découvreur', min: 1500,  max: 2999,  icon: '🗺️', color: '#8b5cf6' },
  { name: 'Champion',   min: 3000,  max: 5999,  icon: '🏅', color: '#f59e0b' },
  { name: 'Expert',     min: 6000,  max: 9999,  icon: '⚡', color: '#ef4444' },
  { name: 'Maître PFEQ',min: 10000, max: 99999, icon: '🏆', color: '#10b981' },
]

function getLevel(xp: number) {
  for (let i = LEVELS.length - 1; i >= 0; i--) {
    if (xp >= LEVELS[i].min) return { ...LEVELS[i], index: i }
  }
  return { ...LEVELS[0], index: 0 }
}

function getLevelPct(xp: number) {
  const lvl = getLevel(xp)
  if (lvl.min === 10000) return 100
  return Math.min(100, Math.round(((xp - lvl.min) / (lvl.max - lvl.min + 1)) * 100))
}

function getStars(m: number | null) {
  if (!m) return ''
  if (m >= 0.90) return '⭐⭐⭐'
  if (m >= 0.65) return '⭐⭐'
  if (m >= 0.40) return '⭐'
  return ''
}

function getStarLabel(m: number | null) {
  if (m === null) return 'Nouveau'
  if (m >= 0.90) return 'Expert !'
  if (m >= 0.65) return 'Avancé'
  if (m >= 0.40) return 'En progrès'
  return 'Débutant'
}

function getBarColor(m: number | null) {
  if (!m) return '#e5e7eb'
  if (m >= 0.65) return '#10b981'
  if (m >= 0.40) return '#f59e0b'
  return '#4F46E5'
}

type BadgeRow = { slug: string; name: string; icon: string; description: string }

export default async function EleveDashboardPage({
  params,
}: {
  params: Promise<{ childId: string }>
}) {
  const { childId } = await params
  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/auth/login')

  const { data: link } = await supabase
    .from('parent_child_links').select('child_id')
    .eq('parent_id', user.id).eq('child_id', childId).single()
  if (!link) notFound()

  const { data: child } = await supabase
    .from('children').select('*').eq('id', childId).single()
  if (!child) notFound()

  const { count: masteryCount } = await supabase
    .from('knowledge_states').select('*', { count: 'exact', head: true }).eq('child_id', childId)
  if ((masteryCount ?? 0) === 0) redirect(`/eleve/${childId}/diagnostic`)

  // Utiliser l'admin client pour bypasser RLS et lire le plan correctement
  const admin = createAdminClient()
  const { data: profile } = await admin
    .from('profiles').select('plan').eq('id', user.id).single()
  const plan: 'free' | 'premium' = (profile?.plan as 'free' | 'premium') ?? 'free'

  // XP
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const totalXp: number = (child as any).total_xp ?? 0
  const level = getLevel(totalXp)
  const levelPct = getLevelPct(totalXp)
  const nextLevel = level.index < LEVELS.length - 1 ? LEVELS[level.index + 1] : null

  // Streak
  const { data: streakData } = await supabase
    .from('streaks').select('current_streak, longest_streak, last_session_date')
    .eq('child_id', childId).single()
  const currentStreak = streakData?.current_streak ?? 0
  const todayStr = new Date().toISOString().slice(0, 10)
  const didSessionToday = streakData?.last_session_date === todayStr
  const streakAtRisk = currentStreak > 0 && !didSessionToday

  // Jours pratiqués sur les 7 derniers jours
  const sevenDaysAgo = new Date()
  sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 6)
  sevenDaysAgo.setHours(0, 0, 0, 0)
  const { data: recentSessions } = await supabase
    .from('exercise_sessions')
    .select('started_at')
    .eq('child_id', childId)
    .gte('started_at', sevenDaysAgo.toISOString())
  const practicedDays = new Set(
    (recentSessions ?? []).map((s: { started_at: string }) => s.started_at.slice(0, 10))
  )
  const DAY_LABELS = ['D', 'L', 'M', 'M', 'J', 'V', 'S']
  const last7Days = Array.from({ length: 7 }, (_, i) => {
    const d = new Date()
    d.setDate(d.getDate() - (6 - i))
    const dateStr = d.toISOString().slice(0, 10)
    return { dateStr, label: DAY_LABELS[d.getDay()], done: practicedDays.has(dateStr) }
  })
  const streakMsg = currentStreak === 0
    ? 'Commence aujourd\'hui !'
    : currentStreak < 3 ? `${currentStreak} jour${currentStreak > 1 ? 's' : ''} de suite 💪`
    : currentStreak < 7 ? `${currentStreak} jours de suite 🔥`
    : `${currentStreak} jours — incroyable ! 🏆`

  // Badges
  const { data: childBadges } = await supabase
    .from('child_badges')
    .select('earned_at, badges(slug, name, icon, description)')
    .eq('child_id', childId).order('earned_at', { ascending: false })
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const earnedBadges = (childBadges ?? []).map((cb: any) =>
    (Array.isArray(cb.badges) ? cb.badges[0] : cb.badges) as BadgeRow | null
  ).filter((b): b is BadgeRow => b !== null)

  // Matières & compétences
  const { data: subjects } = await supabase
    .from('subjects').select('id, name, slug').eq('is_active', true).order('name')
  const { data: skills } = await supabase
    .from('skills').select('id, name, subject_id, sort_order')
    .eq('grade_level', child.grade_level).eq('is_active', true).order('sort_order')
  const { data: masteryData } = await supabase
    .from('knowledge_states').select('skill_id, p_mastery').eq('child_id', childId)

  const masteryMap = new Map((masteryData ?? []).map(m => [m.skill_id, m.p_mastery as number]))
  const allSkills = (skills ?? []).map(s => ({ ...s, mastery: masteryMap.get(s.id) ?? null }))

  const practiced = allSkills.filter(s => s.mastery !== null)
  const globalPct = practiced.length > 0
    ? Math.round(practiced.reduce((a, s) => a + (s.mastery ?? 0), 0) / practiced.length * 100)
    : null

  const recommended = allSkills.filter(s => s.mastery !== null)
    .sort((a, b) => (a.mastery ?? 1) - (b.mastery ?? 1))[0] ?? allSkills[0]

  const skillsBySubject: Record<string, typeof allSkills> = {}
  for (const s of allSkills) {
    if (!skillsBySubject[s.subject_id]) skillsBySubject[s.subject_id] = []
    skillsBySubject[s.subject_id].push(s)
  }

  const subjectsEnriched = (subjects ?? []).map(subject => {
    const sSkills = skillsBySubject[subject.id] ?? []
    const sSkillsWithLock = sSkills.map((skill, idx) => ({
      ...skill,
      bktLocked: idx > 0 && (sSkills[idx - 1].mastery ?? 0) < 0.65,
      premiumLocked: plan === 'free' && idx >= 3,
    }))
    const prac = sSkills.filter(s => s.mastery !== null)
    const avgMastery = prac.length > 0 ? prac.reduce((a, s) => a + (s.mastery ?? 0), 0) / prac.length : null
    return { ...subject, avgMastery, skills: sSkillsWithLock }
  })

  const firstName = child.display_name.split(' ')[0]

  return (
    <div className="min-h-screen" style={{ background: 'linear-gradient(145deg,#eef2ff 0%,#faf5ff 60%,#f0fdf4 100%)' }}>
      <ConsentModal userId={user.id} />
      <OfflineBanner />

      {/* Header */}
      <header className="bg-white/80 backdrop-blur border-b border-gray-100 px-5 py-3 flex items-center justify-between sticky top-0 z-10">
        <div className="flex items-center gap-2">
          <span className="text-base font-bold text-indigo-600">Savoila</span>
          <span className="text-xs bg-indigo-100 text-indigo-600 font-semibold px-2 py-0.5 rounded-full">Québec</span>
        </div>
        <Link href="/dashboard" className="text-xs text-gray-400 hover:text-gray-600">← Mode parent</Link>
      </header>

      <main className="max-w-3xl mx-auto px-5 py-8 space-y-5">

        {/* ── Bannière urgence streak (style Duolingo) ─────── */}
        {streakAtRisk && (
          <div className="rounded-2xl bg-gradient-to-r from-orange-500 to-red-500 text-white px-5 py-4 flex items-center gap-4 shadow-lg">
            <span className="text-3xl" style={{ animation: 'streak-pulse 0.8s ease-in-out infinite' }}>🔥</span>
            <div className="flex-1">
              <p className="font-bold text-sm">Ta série de {currentStreak} jour{currentStreak > 1 ? 's' : ''} est en danger !</p>
              <p className="text-orange-100 text-xs">Fais une session aujourd&apos;hui pour ne pas la perdre.</p>
            </div>
            {recommended && (
              <Link href={`/exercices/${childId}/session/${recommended.id}`}
                className="bg-white text-orange-600 font-bold text-xs px-4 py-2 rounded-xl hover:bg-orange-50 shrink-0">
                Jouer →
              </Link>
            )}
          </div>
        )}

        {/* ── Salutation ───────────────────────────────────── */}
        <div className="text-center pt-2">
          <div className="relative inline-block mb-3">
            <div className="w-24 h-24 rounded-full bg-gradient-to-br from-indigo-400 to-violet-500 flex items-center justify-center text-4xl font-bold text-white shadow-lg">
              {firstName[0].toUpperCase()}
            </div>
            {currentStreak >= 3 && (
              <span className="absolute -top-1 -right-1 text-xl"
                style={{ animation: 'streak-pulse 1.5s ease-in-out infinite' }}>🔥</span>
            )}
          </div>
          <h1 className="text-3xl font-extrabold text-gray-900">Bonjour, {firstName} !</h1>
          {globalPct !== null ? (
            <p className="text-gray-500 mt-1 text-base">
              Maîtrise globale :{' '}
              <span className="font-bold text-indigo-600">{globalPct}%</span>{' '}
              {globalPct >= 90 ? '🏆 Incroyable !' : globalPct >= 65 ? '🚀 Continue !' : '💪 Tu progresses !'}
            </p>
          ) : (
            <p className="text-gray-500 mt-1">Commence ta première session ! 🚀</p>
          )}
        </div>

        {/* ── Carte XP (style Duolingo : barre qui se voit) ── */}
        <div className="grid grid-cols-2 gap-3">
          <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-4">
            <div className="flex items-center gap-2 mb-3">
              <span className="text-2xl">{level.icon}</span>
              <div className="flex-1 min-w-0">
                <p className="text-xs text-gray-500 font-medium leading-none mb-0.5">Niveau</p>
                <p className="text-sm font-extrabold text-gray-800 truncate">{level.name}</p>
              </div>
              <span className="text-xs font-bold shrink-0" style={{ color: level.color }}>
                {totalXp.toLocaleString()} XP
              </span>
            </div>
            {/* Jauge XP façon Duolingo */}
            <div className="w-full bg-gray-100 rounded-full h-4 overflow-hidden">
              <div
                className="h-4 rounded-full flex items-center justify-end pr-1.5 transition-all duration-700"
                style={{ width: `${levelPct}%`, backgroundColor: level.color, minWidth: levelPct > 0 ? '1rem' : '0' }}>
                {levelPct > 15 && (
                  <span className="text-white text-[9px] font-bold">{levelPct}%</span>
                )}
              </div>
            </div>
            {nextLevel && (
              <p className="text-xs text-gray-400 mt-1.5 text-right">
                encore {nextLevel.min - totalXp} XP → {nextLevel.icon} {nextLevel.name}
              </p>
            )}
          </div>

          {/* Calendrier d'activité 7 jours */}
          <div className={`rounded-2xl border shadow-sm p-4 ${
            streakAtRisk ? 'bg-orange-50 border-orange-200' : 'bg-white border-gray-100'
          }`}>
            <p className="text-xs font-bold text-gray-500 uppercase tracking-wide mb-2">
              Activité cette semaine
            </p>
            {/* Cercles 7 jours */}
            <div className="flex justify-between gap-1 mb-3">
              {last7Days.map(({ dateStr, label, done }) => (
                <div key={dateStr} className="flex flex-col items-center gap-0.5">
                  <div className={`w-7 h-7 rounded-full flex items-center justify-center text-[10px] font-bold transition-all ${
                    done
                      ? 'bg-green-500 text-white shadow-sm shadow-green-200'
                      : dateStr === todayStr
                      ? 'bg-blue-100 text-blue-400 border-2 border-blue-300 border-dashed'
                      : 'bg-gray-100 text-gray-300'
                  }`}>
                    {done ? '✓' : '·'}
                  </div>
                  <span className="text-[9px] text-gray-400 font-medium">{label}</span>
                </div>
              ))}
            </div>
            {/* Série actuelle */}
            <div className="flex items-center gap-1.5">
              <span className="text-lg" style={{
                animation: currentStreak > 0 ? 'streak-pulse 1.5s ease-in-out infinite' : undefined
              }}>
                {currentStreak >= 7 ? '🏆' : currentStreak >= 3 ? '🔥' : '⭐'}
              </span>
              <p className={`text-sm font-extrabold ${
                streakAtRisk ? 'text-orange-600' : currentStreak >= 3 ? 'text-orange-500' : 'text-gray-700'
              }`}>
                {streakMsg}
              </p>
            </div>
            {streakAtRisk && (
              <p className="text-[10px] text-orange-500 font-semibold mt-1">
                ⚠️ Pratique aujourd'hui pour garder ta série !
              </p>
            )}
          </div>
        </div>

        {/* ── Badges ──────────────────────────────────────── */}
        {earnedBadges.length > 0 && (
          <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-4">
            <h2 className="text-sm font-bold text-gray-700 mb-3">Mes badges 🏅</h2>
            <div className="flex flex-wrap gap-2">
              {earnedBadges.map(b => (
                <div key={b.slug} title={b.description}
                  className="flex items-center gap-1.5 bg-amber-50 border border-amber-200 rounded-xl px-2.5 py-1.5">
                  <span className="text-lg">{b.icon}</span>
                  <span className="text-xs font-semibold text-gray-700">{b.name}</span>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* ── Mission du jour ──────────────────────────────── */}
        {recommended && (
          <div className="rounded-2xl p-6 text-white shadow-xl relative overflow-hidden"
            style={{ background: 'linear-gradient(135deg,#4f46e5,#7c3aed)' }}>
            <div className="absolute top-0 right-0 w-40 h-40 rounded-full opacity-10 bg-white"
              style={{ transform: 'translate(30%,-30%)' }} />
            <div className="relative">
              <p className="text-xs font-bold uppercase tracking-wider text-indigo-200 mb-2">✨ Ta mission du jour</p>
              <h2 className="text-xl font-bold mb-1">{recommended.name}</h2>
              <p className="text-indigo-200 text-sm mb-5">
                {recommended.mastery !== null
                  ? `${getStars(recommended.mastery)} ${getStarLabel(recommended.mastery)} — continue !`
                  : 'Nouvelle compétence — essaie-la !'}
              </p>
              <Link href={`/exercices/${childId}/session/${recommended.id}`}
                className="inline-block bg-white text-indigo-700 font-bold px-8 py-3 rounded-xl hover:bg-indigo-50 transition-colors shadow-md">
                Commencer 🎯
              </Link>
            </div>
          </div>
        )}

        {/* ── Progression par matière ──────────────────────── */}
        <div>
          <h2 className="text-base font-bold text-gray-700 mb-3 px-1">Ma progression 📊</h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 items-start">
            {subjectsEnriched.map(subject => {
              const emoji = SUBJECT_EMOJIS[subject.slug] ?? '📚'
              const pct = subject.avgMastery !== null ? Math.round(subject.avgMastery * 100) : null
              const barColor = getBarColor(subject.avgMastery)

              return (
                <div key={subject.id} className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
                  <div className="px-5 py-4 flex items-center gap-3">
                    <span className="text-2xl">{emoji}</span>
                    <div className="flex-1">
                      <div className="flex items-center justify-between mb-1.5">
                        <p className="font-bold text-gray-900">{subject.name}</p>
                        <span className="text-sm font-bold" style={{ color: barColor }}>
                          {pct !== null ? `${pct}%` : '—'}
                        </span>
                      </div>
                      <div className="w-full bg-gray-100 rounded-full h-3">
                        <div className="h-3 rounded-full transition-all duration-700"
                          style={{ width: pct !== null ? `${pct}%` : '0%', backgroundColor: barColor }} />
                      </div>
                    </div>
                  </div>

                  <div className="px-4 pb-4 grid grid-cols-2 gap-2">
                    {subject.skills.map((skill, idx) => {
                      const stars = getStars(skill.mastery)
                      const label = getStarLabel(skill.mastery)
                      const barC = getBarColor(skill.mastery)
                      const pctSkill = skill.mastery !== null ? Math.round(skill.mastery * 100) : null
                      const isRecommended = skill.id === recommended?.id
                      const previousSkillName = idx > 0 ? subject.skills[idx - 1].name : ''

                      if (skill.premiumLocked) return (
                        <PremiumLockedCard key={skill.id} skillName={skill.name} />
                      )

                      if (skill.bktLocked) return (
                        <BktLockedCard key={skill.id} skillName={skill.name} previousSkillName={previousSkillName} />
                      )

                      return (
                        <Link key={skill.id}
                          href={`/exercices/${childId}/session/${skill.id}`}
                          className={`flex flex-col p-3 rounded-xl transition-all ${
                            isRecommended
                              ? 'bg-indigo-50 border-2 border-indigo-300'
                              : 'bg-gray-50 border-2 border-transparent hover:border-gray-200 hover:bg-gray-100'
                          }`}>
                          <div className="flex items-center justify-between mb-1.5">
                            <span className="text-base leading-none">{stars || '🌱'}</span>
                            {isRecommended
                              ? <span className="text-xs bg-indigo-100 text-indigo-600 px-1.5 py-0.5 rounded-full font-semibold">✨</span>
                              : <span className="invisible text-xs px-1.5 py-0.5">·</span>
                            }
                          </div>
                          <p className="text-xs font-semibold text-gray-800 leading-tight line-clamp-2 flex-1 mb-2">{skill.name}</p>
                          <div className="w-full bg-gray-200 rounded-full h-1.5 mb-1">
                            <div className="h-1.5 rounded-full"
                              style={{ width: `${pctSkill ?? 0}%`, backgroundColor: barC }} />
                          </div>
                          {pctSkill !== null
                            ? <span className="text-xs font-bold" style={{ color: barC }}>{pctSkill}% · {label}</span>
                            : <span className="text-xs text-gray-400">Nouveau</span>
                          }
                        </Link>
                      )
                    })}
                  </div>
                </div>
              )
            })}
          </div>
        </div>

      </main>
    </div>
  )
}
