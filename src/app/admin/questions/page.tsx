'use client'

import { useState, useEffect } from 'react'

type Skill = {
  id: string
  name: string
  grade_level: string
  subject_name: string
  question_count: number
}

type Question = {
  id: string
  title: string
  difficulty_level: number
  skill_id: string
  is_active: boolean
  explanation: string
  content: {
    question: string
    options: string[]
    answer: string
  }
}

const GRADE_LABELS: Record<string, string> = {
  sec1: 'Sec. 1', sec2: 'Sec. 2', sec3: 'Sec. 3', sec4: 'Sec. 4', sec5: 'Sec. 5',
}

function countBadge(count: number) {
  if (count >= 100) return 'bg-emerald-100 text-emerald-700'
  if (count >= 50)  return 'bg-yellow-100 text-yellow-700'
  if (count > 0)    return 'bg-orange-100 text-orange-700'
  return 'bg-red-100 text-red-600'
}

export default function AdminQuestionsPage() {
  const [skills, setSkills] = useState<Skill[]>([])
  const [questions, setQuestions] = useState<Question[]>([])
  const [selectedSkill, setSelectedSkill] = useState<Skill | null>(null)
  const [loading, setLoading] = useState(true)
  const [loadingQ, setLoadingQ] = useState(false)

  useEffect(() => {
    fetch('/api/admin/questions?type=skills')
      .then((r) => r.json())
      .then(({ skills, error }) => {
        if (error) console.error('[admin/questions] API error:', error)
        setSkills(skills ?? [])
        setLoading(false)
      })
      .catch((err) => {
        console.error('[admin/questions] fetch failed:', err)
        setLoading(false)
      })
  }, [])

  async function selectSkill(skill: Skill) {
    setSelectedSkill(skill)
    setLoadingQ(true)
    const res = await fetch(`/api/admin/questions?type=questions&skill_id=${skill.id}`)
    const { questions } = await res.json()
    setQuestions(questions ?? [])
    setLoadingQ(false)
  }

  async function toggleQuestion(q: Question) {
    await fetch('/api/admin/questions', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        action: 'toggle',
        question_id: q.id,
        is_active: !q.is_active,
      }),
    })
    setQuestions((prev) =>
      prev.map((x) => (x.id === q.id ? { ...x, is_active: !x.is_active } : x))
    )
    setSkills((prev) =>
      prev.map((s) =>
        s.id === selectedSkill?.id
          ? { ...s, question_count: s.question_count + (q.is_active ? -1 : 1) }
          : s
      )
    )
  }

  const totalQuestions = skills.reduce((sum, s) => sum + s.question_count, 0)
  const skillsOk    = skills.filter((s) => s.question_count >= 100).length
  const skillsLow   = skills.filter((s) => s.question_count > 0 && s.question_count < 100).length
  const skillsEmpty = skills.filter((s) => s.question_count === 0).length

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <p className="text-gray-400">Chargement de la banque…</p>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white border-b border-gray-200 px-8 py-4 flex items-center justify-between">
        <h1 className="text-xl font-bold text-gray-900">Admin — Banque de questions</h1>
        <span className="text-xs text-gray-400">Service role · RLS bypassed</span>
      </header>

      {/* Stats globales */}
      <div className="max-w-6xl mx-auto px-8 pt-6 grid grid-cols-4 gap-4 mb-6">
        <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-4 text-center">
          <p className="text-2xl font-bold text-indigo-600">{totalQuestions}</p>
          <p className="text-xs text-gray-500 mt-1">Questions actives</p>
        </div>
        <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-4 text-center">
          <p className="text-2xl font-bold text-emerald-600">{skillsOk}</p>
          <p className="text-xs text-gray-500 mt-1">Compétences ≥ 100 q.</p>
        </div>
        <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-4 text-center">
          <p className="text-2xl font-bold text-yellow-500">{skillsLow}</p>
          <p className="text-xs text-gray-500 mt-1">Compétences incomplètes</p>
        </div>
        <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-4 text-center">
          <p className="text-2xl font-bold text-red-500">{skillsEmpty}</p>
          <p className="text-xs text-gray-500 mt-1">Compétences vides</p>
        </div>
      </div>

      <div className="max-w-6xl mx-auto px-8 pb-10 grid grid-cols-1 lg:grid-cols-2 gap-6">

        {/* Liste des compétences */}
        <div>
          <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-3">
            Compétences ({skills.length})
          </h2>
          <div className="bg-white rounded-xl border border-gray-100 shadow-sm divide-y divide-gray-50">
            {skills.map((skill) => (
              <button
                key={skill.id}
                onClick={() => selectSkill(skill)}
                className={`w-full flex items-center justify-between px-4 py-3 text-left hover:bg-gray-50 transition-colors ${
                  selectedSkill?.id === skill.id ? 'bg-indigo-50' : ''
                }`}
              >
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-gray-800 truncate">{skill.name}</p>
                  <p className="text-xs text-gray-400">
                    {GRADE_LABELS[skill.grade_level]} · {skill.subject_name}
                  </p>
                </div>
                <span className={`ml-3 text-xs font-bold px-2 py-1 rounded-full ${countBadge(skill.question_count)}`}>
                  {skill.question_count} q.
                </span>
              </button>
            ))}
          </div>
          <div className="mt-3 flex flex-wrap gap-3 text-xs text-gray-400">
            <span className="flex items-center gap-1">
              <span className="w-2 h-2 rounded-full bg-emerald-400 inline-block" /> ≥ 100 — complet
            </span>
            <span className="flex items-center gap-1">
              <span className="w-2 h-2 rounded-full bg-yellow-400 inline-block" /> 50–99 — partiel
            </span>
            <span className="flex items-center gap-1">
              <span className="w-2 h-2 rounded-full bg-orange-400 inline-block" /> 1–49 — insuffisant
            </span>
            <span className="flex items-center gap-1">
              <span className="w-2 h-2 rounded-full bg-red-400 inline-block" /> 0 — vide
            </span>
          </div>
        </div>

        {/* Questions de la compétence sélectionnée */}
        <div>
          {!selectedSkill ? (
            <div className="bg-white border border-dashed border-gray-200 rounded-xl p-12 text-center text-gray-400">
              Sélectionne une compétence pour voir ses questions
            </div>
          ) : (
            <>
              <div className="flex items-center justify-between mb-3">
                <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-wider truncate">
                  {selectedSkill.name}
                </h2>
                <span className="text-xs text-gray-400 flex-shrink-0 ml-2">
                  {questions.filter((q) => q.is_active).length} actives ·{' '}
                  {questions.filter((q) => !q.is_active).length} inactives
                </span>
              </div>

              {loadingQ ? (
                <div className="bg-white rounded-xl border border-gray-100 p-8 text-center text-gray-400">
                  Chargement…
                </div>
              ) : questions.length === 0 ? (
                <div className="bg-white border border-dashed border-gray-200 rounded-xl p-12 text-center text-gray-400">
                  Aucune question pour cette compétence
                </div>
              ) : (
                <div className="space-y-2 max-h-[600px] overflow-y-auto pr-1">
                  {questions.map((q, i) => (
                    <div
                      key={q.id}
                      className={`bg-white border rounded-xl p-4 transition-opacity ${
                        q.is_active ? 'border-gray-100' : 'border-gray-100 opacity-40'
                      }`}
                    >
                      <div className="flex items-start gap-3">
                        <div className="flex-1 min-w-0">
                          <div className="flex items-center gap-2 mb-1.5">
                            <span className="text-xs font-semibold text-indigo-500">Q{i + 1}</span>
                            <span className="text-xs text-amber-500">
                              {'★'.repeat(q.difficulty_level)}{'☆'.repeat(3 - q.difficulty_level)}
                            </span>
                          </div>
                          <p className="text-sm text-gray-800 mb-2 leading-snug">{q.content?.question}</p>
                          <div className="grid grid-cols-2 gap-1">
                            {q.content?.options?.map((opt, oi) => (
                              <p
                                key={oi}
                                className={`text-xs px-2 py-1 rounded truncate ${
                                  opt === q.content?.answer
                                    ? 'bg-emerald-100 text-emerald-700 font-semibold'
                                    : 'bg-gray-50 text-gray-500'
                                }`}
                              >
                                {String.fromCharCode(65 + oi)}. {opt}
                              </p>
                            ))}
                          </div>
                          {q.explanation && (
                            <p className="text-xs text-blue-600 mt-2 italic truncate">
                              💡 {q.explanation}
                            </p>
                          )}
                        </div>
                        <button
                          onClick={() => toggleQuestion(q)}
                          className={`flex-shrink-0 text-xs px-2 py-1 rounded-lg border transition-colors ${
                            q.is_active
                              ? 'border-red-200 text-red-500 hover:bg-red-50'
                              : 'border-emerald-200 text-emerald-600 hover:bg-emerald-50'
                          }`}
                        >
                          {q.is_active ? 'Désactiver' : 'Activer'}
                        </button>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </>
          )}
        </div>
      </div>
    </div>
  )
}
