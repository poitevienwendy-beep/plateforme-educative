'use client'

import { useState, useEffect, use } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'

type ErrorItem = {
  question_id: string
  question_text: string
  options: string[]
  correct_answer: string
  answer_given: string | null
  explanation: string | null
  skill_name: string | null
}

export default function RevisionPage({
  params,
}: {
  params: Promise<{ childId: string }>
}) {
  const { childId } = use(params)
  const router = useRouter()
  const searchParams = useSearchParams()
  const sessionId = searchParams.get('session')

  const [errors, setErrors] = useState<ErrorItem[]>([])
  const [loading, setLoading] = useState(true)
  const [current, setCurrent] = useState(0)
  const [done, setDone] = useState(false)

  useEffect(() => {
    if (!sessionId) { setLoading(false); return }
    const supabase = createClient()
    supabase
      .rpc('get_session_errors', { p_session_id: sessionId, p_child_id: childId })
      .then(({ data, error }) => {
        if (error) console.error(error)
        setErrors(data ?? [])
        setLoading(false)
      })
  }, [childId, sessionId])

  if (!sessionId) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <p className="text-gray-500 mb-4">Session introuvable.</p>
          <button onClick={() => router.push(`/eleve/${childId}`)}
            className="bg-indigo-600 text-white px-6 py-2 rounded-lg text-sm">
            Retour au tableau de bord
          </button>
        </div>
      </div>
    )
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="text-4xl mb-4 animate-pulse">🔍</div>
          <p className="text-gray-500">Chargement de la revision...</p>
        </div>
      </div>
    )
  }

  if (errors.length === 0) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center max-w-sm">
          <div className="text-5xl mb-4">🎉</div>
          <h1 className="text-xl font-bold text-gray-900 mb-2">Parfait !</h1>
          <p className="text-gray-500 mb-6">Aucune erreur a revoir dans cette session.</p>
          <button onClick={() => router.push(`/eleve/${childId}`)}
            className="bg-indigo-600 text-white px-6 py-3 rounded-xl text-sm font-semibold">
            Retour au tableau de bord
          </button>
        </div>
      </div>
    )
  }

  if (done) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center p-6">
        <div className="bg-white rounded-2xl shadow-md border border-gray-100 p-8 max-w-md w-full text-center">
          <div className="text-5xl mb-3">✅</div>
          <h1 className="text-xl font-bold text-gray-900 mb-2">Revision terminee !</h1>
          <p className="text-gray-500 mb-2">Tu as revu {errors.length} erreur{errors.length > 1 ? 's' : ''}.</p>
          <p className="text-sm text-gray-400 mb-6">
            Reessaie ces competences dans une nouvelle session pour les consolider.
          </p>
          <button onClick={() => router.push(`/eleve/${childId}`)}
            className="w-full bg-indigo-600 text-white py-3 rounded-xl font-semibold">
            Retour au tableau de bord
          </button>
        </div>
      </div>
    )
  }

  const item = errors[current]

  return (
    <div className="min-h-screen" style={{ background: '#fafafa' }}>
      {/* Header */}
      <div className="bg-white border-b border-gray-100 px-5 py-3 sticky top-0 z-10">
        <div className="max-w-2xl mx-auto flex items-center gap-3">
          <button onClick={() => router.push(`/eleve/${childId}`)}
            className="text-gray-300 hover:text-gray-500 text-lg font-light">X</button>
          <div className="flex-1 bg-gray-100 rounded-full h-2.5 overflow-hidden">
            <div className="h-2.5 rounded-full transition-all duration-500"
              style={{ width: `${((current) / errors.length) * 100}%`, backgroundColor: '#f59e0b' }} />
          </div>
          <span className="text-xs text-gray-400 shrink-0">{current + 1}/{errors.length}</span>
        </div>
      </div>

      <main className="max-w-2xl mx-auto px-5 py-8">
        {/* Badge mode revision */}
        <div className="inline-flex items-center gap-1.5 bg-amber-100 text-amber-700 text-xs font-semibold px-3 py-1 rounded-full mb-4">
          🔍 Mode revision
        </div>

        {item.skill_name && (
          <span className="block text-xs font-semibold text-indigo-400 uppercase tracking-widest mb-2">
            {item.skill_name}
          </span>
        )}

        <h2 className="text-xl font-bold text-gray-900 leading-snug mb-6">
          {item.question_text}
        </h2>

        {/* Options — toutes visibles, correcte en vert, choisie en rouge */}
        <div className="space-y-3 mb-6">
          {item.options.map((option) => {
            const isCorrect  = option === item.correct_answer
            const wasChosen  = option === item.answer_given
            const isWrong    = wasChosen && !isCorrect

            let cls = 'w-full text-left px-5 py-4 rounded-2xl border-2 font-medium cursor-default '
            if (isCorrect)   cls += 'border-green-500 bg-green-50 text-green-800'
            else if (isWrong) cls += 'border-red-400 bg-red-50 text-red-700'
            else              cls += 'border-gray-100 bg-white text-gray-400'

            return (
              <div key={option} className={cls}>
                <span className="flex items-center gap-3">
                  {isCorrect && <span>✅</span>}
                  {isWrong && <span>❌</span>}
                  {option}
                </span>
              </div>
            )
          })}
        </div>

        {/* Explication */}
        {item.explanation && (
          <div className="bg-blue-50 border border-blue-200 rounded-2xl px-5 py-4 mb-6">
            <p className="text-sm font-semibold text-blue-700 mb-1">💡 Explication</p>
            <p className="text-sm text-blue-800">{item.explanation}</p>
          </div>
        )}

        {/* Navigation */}
        <button
          onClick={() => current < errors.length - 1 ? setCurrent((c) => c + 1) : setDone(true)}
          className="w-full text-white font-semibold py-4 rounded-2xl"
          style={{ background: 'linear-gradient(135deg,#f59e0b,#d97706)' }}
        >
          {current < errors.length - 1 ? 'Erreur suivante' : 'Terminer la revision'}
        </button>
      </main>
    </div>
  )
}
