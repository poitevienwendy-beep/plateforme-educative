'use client'

import { useState, useEffect, useRef, use } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import ConfettiCelebration from '@/components/ConfettiCelebration'
import { offlineQueue } from '@/lib/offlineQueue'

type Question = {
  id: string
  title: string
  content: {
    type: string
    question: string
    options: string[]
    answer: string
  }
  difficulty_level: number
  expected_time_ms: number
  explanation: string
}

type SessionResult = {
  sessionId: string
  correct: number
  total: number
  skillName: string
  xpEarned: number
  totalXp: number
  streak: number
  newBadges: BadgeInfo[]
}

type BadgeInfo = { slug: string; name: string; icon: string; description: string }

const LEVELS = [
  { name: 'Apprenti',   min: 0,     icon: '🌱', color: '#6b7280' },
  { name: 'Exploreur',  min: 500,   icon: '🔭', color: '#3b82f6' },
  { name: 'Decouvr.',  min: 1500,  icon: '🗺️', color: '#8b5cf6' },
  { name: 'Champion',  min: 3000,  icon: '🏅', color: '#f59e0b' },
  { name: 'Expert',    min: 6000,  icon: '⚡',     color: '#ef4444' },
  { name: 'Maitre',    min: 10000, icon: '🏆', color: '#10b981' },
]

function getLevel(xp: number) {
  for (let i = LEVELS.length - 1; i >= 0; i--) {
    if (xp >= LEVELS[i].min) return { ...LEVELS[i], index: i }
  }
  return { ...LEVELS[0], index: 0 }
}

function calcXp(correct: number, total: number): number {
  const wrong = total - correct
  const base = correct * 10 + wrong * 3 + 25
  const perfect = correct === total && total > 0 ? 50 : 0
  return base + perfect
}

const XP_PER_CORRECT = 10

function storageKey(childId: string, skillId: string) {
  return `educp_sess_${childId}_${skillId}`
}

const CONGRATS = ['Excellent ! 🎯', 'Parfait ! ✨', 'Bien joue ! 👏', 'Super ! 🌟', 'Bravo ! 🎉']

export default function SessionPage({
  params,
}: {
  params: Promise<{ childId: string; skillId: string }>
}) {
  const router = useRouter()
  const { childId, skillId } = use(params)

  const [questions, setQuestions] = useState<Question[]>([])
  const [skillName, setSkillName] = useState('')
  const [current, setCurrent] = useState(0)
  const [selected, setSelected] = useState<string | null>(null)
  const revealed = selected !== null
  const [sessionId, setSessionId] = useState<string | null>(null)
  const [results, setResults] = useState<SessionResult | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [congrats, setCongrats] = useState('')
  const [showXpPop, setShowXpPop] = useState(false)
  const [combo, setCombo] = useState(0)
  const [liveXp, setLiveXp] = useState(0)
  const [xpBarGlow, setXpBarGlow] = useState(false)
  // Anti-frustration : compteur d'échecs qualifiés + état indice
  const qualifiedFailures = useRef(0)
  const [showHint, setShowHint] = useState(false)
  // Remontée graduelle : géré côté SQL dans get_questions_for_skill (difficulty_level progressif)

  const startTimeRef = useRef<number>(Date.now())
  const correctCount = useRef(0)
  const initDone = useRef(false)

  useEffect(() => {
    if (initDone.current) return
    initDone.current = true
    async function init() {
      // Restaurer depuis sessionStorage si refresh accidentel
      const saved = sessionStorage.getItem(storageKey(childId, skillId))
      if (saved) {
        try {
          const s = JSON.parse(saved)
          setQuestions(s.questions)
          setSkillName(s.skillName)
          setSessionId(s.sessionId)
          setCurrent(s.current ?? 0)
          setLiveXp(s.liveXp ?? 0)
          setCombo(s.combo ?? 0)
          correctCount.current = s.correctCount ?? 0
          setLoading(false)
          startTimeRef.current = Date.now()
          return
        } catch { /* ignore */ }
      }

      const supabase = createClient()
      const { data: skill } = await supabase.from('skills').select('name').eq('id', skillId).single()
      const name = skill?.name ?? ''
      if (name) setSkillName(name)

      const { data: qs, error: qErr } = await supabase.rpc('get_questions_for_skill', {
        p_skill_id: skillId, p_limit: 25, p_child_id: childId,
      })
      if (qErr || !qs || qs.length === 0) {
        setError(qErr?.message ?? 'Aucune question disponible.')
        setLoading(false)
        return
      }
      setQuestions(qs)

      const { data: session, error: sessErr } = await supabase.rpc('start_exercise_session', {
        p_child_id: childId, p_skill_id: skillId,
      })
      if (sessErr || !session) {
        setError('Erreur demarrage : ' + (sessErr?.message ?? ''))
        setLoading(false)
        return
      }
      setSessionId(session)

      // Sauvegarder l etat initial
      sessionStorage.setItem(storageKey(childId, skillId), JSON.stringify({
        questions: qs, skillName: name, sessionId: session,
        current: 0, liveXp: 0, combo: 0, correctCount: 0,
      }))

      setLoading(false)
      startTimeRef.current = Date.now()
    }
    init()
  }, [childId, skillId])

  async function handleAnswer(option: string) {
    if (revealed) return
    setSelected(option)
    const q = questions[current]
    const isCorrect = option === q.content.answer
    if (isCorrect) {
      correctCount.current++
      setCombo((c) => c + 1)
      setCongrats(CONGRATS[Math.floor(Math.random() * CONGRATS.length)])
      setLiveXp((prev) => prev + XP_PER_CORRECT)
      setXpBarGlow(true)
      setTimeout(() => setXpBarGlow(false), 600)
      setShowXpPop(true)
      setTimeout(() => setShowXpPop(false), 1200)
      // Bonne réponse : réinitialiser les échecs qualifiés
      qualifiedFailures.current = 0
      setShowHint(false)
    } else {
      setCombo(0)
      // Échec qualifié = réponse après réflexion (≥ 4s) ou 2e erreur rapide
      const isQualified = responseMs >= 4000 || qualifiedFailures.current >= 1
      if (isQualified) {
        qualifiedFailures.current++
        // Au 2e échec qualifié : afficher un indice avant de continuer
        if (qualifiedFailures.current >= 2) {
          setShowHint(true)
        }
      } else {
        qualifiedFailures.current++
      }
    }

    // Persister l etat apres chaque reponse
    const newCorrect = isCorrect ? correctCount.current : correctCount.current
    const newLiveXp  = isCorrect ? liveXp + XP_PER_CORRECT : liveXp
    const newCombo   = isCorrect ? combo + 1 : 0
    const existing   = sessionStorage.getItem(storageKey(childId, skillId))
    if (existing) {
      const base = JSON.parse(existing)
      sessionStorage.setItem(storageKey(childId, skillId), JSON.stringify({
        ...base, correctCount: newCorrect, liveXp: newLiveXp, combo: newCombo,
      }))
    }

    const supabase = createClient()
    const responseMs = Date.now() - startTimeRef.current

    // record_attempt — mis en queue si hors-ligne
    const attemptParams = {
      p_session_id: sessionId, p_child_id: childId, p_question_id: q.id,
      p_is_correct: isCorrect, p_answer_given: option, p_response_time_ms: responseMs,
    }
    const { error: attemptErr } = await supabase.rpc('record_attempt', attemptParams)
    if (attemptErr) offlineQueue.push({ fn: 'record_attempt', params: attemptParams, ts: Date.now() })

    // update_bkt — mis en queue si hors-ligne
    const bktParams = { p_child_id: childId, p_question_id: q.id, p_is_correct: isCorrect, p_response_time_ms: responseMs }
    const { error: bktErr } = await supabase.rpc('update_bkt', bktParams)
    if (bktErr) offlineQueue.push({ fn: 'update_bkt', params: bktParams, ts: Date.now() + 1 })
  }

  async function handleNext() {
    const isLast = current === questions.length - 1
    if (isLast) {
      const supabase = createClient()
      await supabase.rpc('end_exercise_session', {
        p_session_id: sessionId, p_correct: correctCount.current, p_total: questions.length,
      })
      const xpEarned = calcXp(correctCount.current, questions.length)
      const { data: newTotalXp } = await supabase.rpc('award_xp', {
        p_child_id: childId, p_amount: xpEarned, p_reason: `session_${skillId}`,
      })
      const { data: streakData } = await supabase.rpc('update_streak', { p_child_id: childId })
      const { data: newBadgeSlugs } = await supabase.rpc('check_badges', { p_child_id: childId })
      let newBadges: BadgeInfo[] = []
      if (newBadgeSlugs && newBadgeSlugs.length > 0) {
        const { data: bd } = await supabase.from('badges').select('slug,name,icon,description').in('slug', newBadgeSlugs)
        newBadges = bd ?? []
      }
      // Session terminee : effacer le storage pour eviter la restauration
      sessionStorage.removeItem(storageKey(childId, skillId))
      setResults({
        sessionId: sessionId!, correct: correctCount.current, total: questions.length,
        skillName, xpEarned, totalXp: newTotalXp ?? 0,
        streak: streakData?.current_streak ?? 0, newBadges,
      })
    } else {
      const nextIdx = current + 1
      // Mettre a jour l index dans le storage
      const existing = sessionStorage.getItem(storageKey(childId, skillId))
      if (existing) {
        const base = JSON.parse(existing)
        sessionStorage.setItem(storageKey(childId, skillId), JSON.stringify({ ...base, current: nextIdx }))
      }
      setCurrent(nextIdx)
      setSelected(null)
      setCongrats('')
      setShowHint(false)
      startTimeRef.current = Date.now()
    }
  }

  if (loading) return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center">
      <div className="text-center">
        <div className="text-4xl mb-4 animate-pulse">📚</div>
        <p className="text-gray-500">Chargement des questions...</p>
      </div>
    </div>
  )

  if (error) return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center">
      <div className="text-center max-w-md">
        <div className="text-4xl mb-4">😕</div>
        <p className="text-red-600 mb-4">{error}</p>
        <button onClick={() => router.back()} className="bg-indigo-600 text-white px-6 py-2 rounded-lg">Retour</button>
      </div>
    </div>
  )

  if (results) {
    const pct = Math.round((results.correct / results.total) * 100)
    const isPerfect = results.correct === results.total
    const level = getLevel(results.totalXp)
    const prevLevel = getLevel(results.totalXp - results.xpEarned)
    const leveledUp = level.index > prevLevel.index
    return (
      <>
        <ConfettiCelebration active={isPerfect || results.correct / results.total >= 0.8} />
        <div className="min-h-screen bg-gray-50 flex items-center justify-center p-6">
          <div className="bg-white rounded-2xl shadow-md border border-gray-100 p-8 max-w-md w-full text-center">
            <div className="text-6xl mb-2">{isPerfect ? '🎉' : pct >= 80 ? '🌟' : pct >= 50 ? '👍' : '💪'}</div>
            <h1 className="text-2xl font-bold text-gray-900 mb-1">Session terminee !</h1>
            <p className="text-gray-500 text-sm mb-5">{results.skillName}</p>
            <div className="bg-indigo-50 rounded-xl p-5 mb-4">
              <p className="text-5xl font-bold text-indigo-600 mb-1">{pct}%</p>
              <p className="text-gray-600 text-sm">
                {results.correct} / {results.total} bonnes reponses
                {isPerfect && <span className="ml-1 text-amber-500 font-bold">Parfait ! 💎</span>}
              </p>
            </div>
            <div className="flex gap-3 mb-4">
              <div className="bg-amber-50 border border-amber-200 rounded-xl px-5 py-3 flex-1 text-center">
                <p className="text-xs text-amber-600 font-semibold mb-0.5">XP GAGNE</p>
                <p className="text-2xl font-bold text-amber-600">+{results.xpEarned} ✨</p>
              </div>
              <div className="bg-orange-50 border border-orange-200 rounded-xl px-5 py-3 flex-1 text-center">
                <p className="text-xs text-orange-600 font-semibold mb-0.5">STREAK</p>
                <p className="text-2xl font-bold text-orange-500">{results.streak} 🔥</p>
              </div>
            </div>
            {leveledUp && (
              <div className="bg-gradient-to-r from-indigo-500 to-violet-500 text-white rounded-xl p-4 mb-4">
                <p className="text-xs font-bold uppercase tracking-wider opacity-80 mb-1">Niveau superieur !</p>
                <p className="text-lg font-bold">{level.icon} {level.name}</p>
              </div>
            )}
            {results.newBadges.length > 0 && (
              <div className="mb-4">
                <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-2">Badges debloques !</p>
                <div className="flex flex-wrap gap-2 justify-center">
                  {results.newBadges.map((b) => (
                    <div key={b.slug}
                      className="flex items-center gap-2 bg-amber-50 border border-amber-200 rounded-xl px-3 py-2"
                      style={{ animation: 'badge-bounce 0.6s ease-in-out' }}>
                      <span className="text-xl">{b.icon}</span>
                      <div className="text-left">
                        <p className="text-xs font-bold text-gray-800">{b.name}</p>
                        <p className="text-xs text-gray-500">{b.description}</p>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            )}
            {/* Revoir les erreurs */}
            {results.correct < results.total && (
              <button
                onClick={() => router.push(`/exercices/${childId}/revision?session=${results.sessionId}`)}
                className="w-full mb-3 border-2 border-amber-400 text-amber-700 bg-amber-50 py-3 rounded-xl text-sm font-semibold hover:bg-amber-100 transition-colors flex items-center justify-center gap-2"
              >
                🔍 Revoir mes {results.total - results.correct} erreur{results.total - results.correct > 1 ? 's' : ''}
              </button>
            )}
            <div className="flex gap-3">
              <button onClick={() => router.push(`/exercices/${childId}/choisir`)}
                className="flex-1 border border-gray-300 text-gray-700 py-2.5 rounded-lg hover:bg-gray-50 text-sm font-medium">
                Autre matiere
              </button>
              <button onClick={() => { setResults(null); setCurrent(0); setSelected(null); setCombo(0); setLiveXp(0); correctCount.current = 0 }}
                className="flex-1 bg-indigo-600 text-white py-2.5 rounded-lg hover:bg-indigo-700 text-sm font-medium">
                Recommencer
              </button>
            </div>
            <button onClick={() => router.push(`/eleve/${childId}`)}
              className="mt-3 w-full text-sm text-indigo-600 hover:underline">
              Voir mon tableau de bord
            </button>
          </div>
        </div>
      </>
    )
  }

  const q = questions[current]
  const progressPct = ((current + 1) / questions.length) * 100
  const maxLiveXp = questions.length * XP_PER_CORRECT
  const xpBarPct = Math.min(100, Math.round((liveXp / maxLiveXp) * 100))

  return (
    <div className="min-h-screen" style={{ background: '#fafafa' }}>

      {showXpPop && (
        <div className="fixed top-24 left-1/2 -translate-x-1/2 z-40 font-bold text-lg pointer-events-none"
          style={{ color: '#f59e0b', animation: 'xp-pop 1.1s ease-out forwards' }}>
          +{XP_PER_CORRECT} XP ✨
        </div>
      )}

      <div className="bg-white border-b border-gray-100 px-5 py-3 sticky top-0 z-10">
        <div className="max-w-2xl mx-auto space-y-2">
          <div className="flex items-center gap-3">
            <button onClick={() => router.push(`/eleve/${childId}`)}
              className="text-gray-300 hover:text-gray-500 text-lg font-light shrink-0">X</button>
            <div className="flex-1 bg-gray-100 rounded-full h-2.5 overflow-hidden">
              <div className="h-2.5 rounded-full transition-all duration-500"
                style={{ width: `${progressPct}%`, backgroundColor: '#4f46e5' }} />
            </div>
            {combo >= 3 && (
              <span className="text-xs font-bold text-orange-500 shrink-0"
                style={{ animation: 'streak-pulse 0.7s ease-in-out infinite' }}>
                🔥 x{combo}
              </span>
            )}
            <span className="text-xs text-gray-400 shrink-0">{current + 1}/{questions.length}</span>
          </div>
          <div className="flex items-center gap-2">
            <span className="text-sm shrink-0">⭐</span>
            <div className="flex-1 relative bg-amber-100 rounded-full h-3 overflow-hidden">
              <div className="h-3 rounded-full"
                style={{
                  width: `${xpBarPct}%`,
                  background: 'linear-gradient(90deg,#f59e0b,#fbbf24)',
                  boxShadow: xpBarGlow ? '0 0 8px 2px rgba(251,191,36,0.7)' : 'none',
                  transition: 'width 0.5s ease-out, box-shadow 0.3s ease',
                }} />
              {xpBarPct > 0 && (
                <div className="absolute inset-0 rounded-full pointer-events-none"
                  style={{ background: 'linear-gradient(180deg,rgba(255,255,255,0.3) 0%,transparent 60%)' }} />
              )}
            </div>
            <span className="text-xs font-bold shrink-0" style={{ color: '#f59e0b' }}>{liveXp} XP</span>
          </div>
        </div>
      </div>

      <main className="max-w-2xl mx-auto px-5 py-8">
        <div className="mb-6">
          <span className="text-xs font-semibold text-indigo-400 uppercase tracking-widest">{skillName}</span>
          <h2 className="text-xl font-bold text-gray-900 mt-2 leading-snug">{q.content.question}</h2>
        </div>

        {revealed && selected === q.content.answer && congrats && (
          <div className="mb-4 text-center text-green-600 font-bold text-base animate-bounce">{congrats}</div>
        )}

        <div className="space-y-3 mb-8">
          {q.content.options.map((option) => {
            const isAnswer = option === q.content.answer
            const isSelected = option === selected
            let cls = 'w-full text-left px-5 py-4 rounded-2xl border-2 font-medium transition-all duration-150 '
            if (!revealed) cls += 'border-gray-200 bg-white hover:border-indigo-400 hover:bg-indigo-50 text-gray-800'
            else if (isAnswer) cls += 'border-green-500 bg-green-50 text-green-800'
            else if (isSelected && !isAnswer) cls += 'border-red-400 bg-red-50 text-red-700'
            else cls += 'border-gray-100 bg-white text-gray-400'
            return (
              <button key={option} onClick={() => handleAnswer(option)} disabled={revealed} className={cls}>
                <span className="flex items-center gap-3">
                  {revealed && isAnswer && <span>✅</span>}
                  {revealed && isSelected && !isAnswer && <span>❌</span>}
                  {option}
                </span>
              </button>
            )
          })}
        </div>


        {revealed && showHint && !selected?.startsWith('__correct') && (
          <div className="bg-amber-50 border border-amber-300 rounded-2xl px-5 py-4 mb-4">
            <p className="text-sm font-semibold text-amber-700 mb-1">
              🌱 On pratique ici un instant avant de continuer
            </p>
            <p className="text-sm text-amber-800">
              Pas de souci — regarde bien la bonne réponse, puis on continue ensemble.
            </p>
          </div>
        )}

        {revealed && q.explanation && (
          <div className="bg-blue-50 border border-blue-200 rounded-2xl px-5 py-4 mb-6">
            <p className="text-sm font-semibold text-blue-700 mb-1">💡 Explication</p>
            <p className="text-sm text-blue-800">{q.explanation}</p>
          </div>
        )}

        {revealed && (
          <button onClick={handleNext}
            className="w-full text-white font-semibold py-4 rounded-2xl"
            style={{ background: 'linear-gradient(135deg,#4f46e5,#7c3aed)' }}>
            {current === questions.length - 1 ? 'Voir mes resultats' : 'Question suivante'}
          </button>
        )}
      </main>
     </div>
)
}
