'use client'

import { useState, useEffect } from 'react'
import { useRouter, useParams } from 'next/navigation'
import Link from 'next/link'

const GRADE_OPTIONS = [
  { value: 'sec1', label: 'Secondaire 1 (~12-13 ans)' },
  { value: 'sec2', label: 'Secondaire 2 (~13-14 ans)' },
  { value: 'sec3', label: 'Secondaire 3 (~14-15 ans)' },
  { value: 'sec4', label: 'Secondaire 4 (~15-16 ans)' },
  { value: 'sec5', label: 'Secondaire 5 (~16-17 ans)' },
]

const BIRTH_YEARS = Array.from({ length: 21 }, (_, i) => 2020 - i)

export default function ModifierEnfantPage() {
  const router = useRouter()
  const params = useParams()
  const childId = params.id as string

  const [displayName, setDisplayName] = useState('')
  const [birthYear, setBirthYear] = useState('')
  const [gradeLevel, setGradeLevel] = useState('sec1')
  const [loading, setLoading] = useState(false)
  const [loadingData, setLoadingData] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [showDeleteConfirm, setShowDeleteConfirm] = useState(false)
  const [deleting, setDeleting] = useState(false)

  // Charger les données actuelles de l'enfant
  useEffect(() => {
    async function loadChild() {
      try {
        const res = await fetch(`/api/children/${childId}`)
        if (!res.ok) {
          router.push('/dashboard')
          return
        }
        const data = await res.json()
        setDisplayName(data.display_name ?? '')
        setBirthYear(data.birth_year ? String(data.birth_year) : '')
        setGradeLevel(data.grade_level ?? 'sec1')
      } catch {
        router.push('/dashboard')
      } finally {
        setLoadingData(false)
      }
    }
    loadChild()
  }, [childId, router])

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setLoading(true)
    setError(null)

    try {
      const res = await fetch('/api/children/update', {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          child_id: childId,
          display_name: displayName,
          birth_year: birthYear ? parseInt(birthYear) : null,
          grade_level: gradeLevel,
        }),
      })

      const data = await res.json()
      if (!res.ok) {
        setError('Erreur : ' + (data.error ?? res.statusText))
        setLoading(false)
        return
      }

      router.push(`/dashboard/enfants/${childId}`)
      router.refresh()
    } catch {
      setError('Erreur réseau. Vérifiez votre connexion et réessayez.')
      setLoading(false)
    }
  }

  async function handleDelete() {
    setDeleting(true)
    try {
      const res = await fetch('/api/children/delete', {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ child_id: childId }),
      })
      if (res.ok) {
        router.push('/dashboard')
        router.refresh()
      } else {
        const data = await res.json()
        setError('Erreur suppression : ' + (data.error ?? res.statusText))
        setShowDeleteConfirm(false)
        setDeleting(false)
      }
    } catch {
      setError('Erreur réseau.')
      setDeleting(false)
    }
  }

  if (loadingData) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <p className="text-gray-400 text-sm">Chargement…</p>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white border-b border-gray-200 px-8 py-4">
        <Link
          href={`/dashboard/enfants/${childId}`}
          className="text-sm text-indigo-600 hover:underline"
        >
          ← Retour au profil
        </Link>
      </header>

      <main className="max-w-lg mx-auto px-6 py-10">
        <h1 className="text-2xl font-bold text-gray-900 mb-2">Modifier le profil</h1>
        <p className="text-gray-500 mb-8">
          Les modifications s&apos;appliquent immédiatement. La progression de l&apos;enfant est préservée.
        </p>

        <form
          onSubmit={handleSubmit}
          className="bg-white rounded-xl shadow-sm border border-gray-100 p-6 space-y-5"
        >
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Prénom de l&apos;enfant <span className="text-red-500">*</span>
            </label>
            <input
              type="text"
              value={displayName}
              onChange={(e) => setDisplayName(e.target.value)}
              required
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Année de naissance
            </label>
            <select
              value={birthYear}
              onChange={(e) => setBirthYear(e.target.value)}
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
            >
              <option value="">— Sélectionner —</option>
              {BIRTH_YEARS.map((y) => (
                <option key={y} value={y}>{y}</option>
              ))}
            </select>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Niveau scolaire <span className="text-red-500">*</span>
            </label>
            <select
              value={gradeLevel}
              onChange={(e) => setGradeLevel(e.target.value)}
              required
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
            >
              {GRADE_OPTIONS.map((opt) => (
                <option key={opt.value} value={opt.value}>{opt.label}</option>
              ))}
            </select>
            <p className="text-xs text-gray-400 mt-1">
              Changer le niveau adaptera les exercices proposés dès la prochaine session.
            </p>
          </div>

          {error && (
            <div className="bg-red-50 text-red-700 text-sm px-4 py-3 rounded-lg">{error}</div>
          )}

          <button
            type="submit"
            disabled={loading}
            className="w-full bg-indigo-600 text-white font-medium py-2.5 px-4 rounded-lg hover:bg-indigo-700 disabled:opacity-50 transition-colors"
          >
            {loading ? 'Enregistrement…' : 'Enregistrer les modifications'}
          </button>
        </form>

        {/* Zone danger — suppression */}
        <div className="mt-8 bg-white rounded-xl border border-red-100 p-6">
          <h2 className="text-sm font-semibold text-red-700 mb-1">Zone de danger</h2>
          <p className="text-xs text-gray-500 mb-4">
            Supprimer ce profil effacera définitivement toute la progression, les sessions et les résultats de cet enfant. Cette action est irréversible.
          </p>

          {!showDeleteConfirm ? (
            <button
              onClick={() => setShowDeleteConfirm(true)}
              className="text-sm font-medium text-red-600 border border-red-200 px-4 py-2 rounded-lg hover:bg-red-50 transition-colors"
            >
              Supprimer ce profil
            </button>
          ) : (
            <div className="space-y-3">
              <p className="text-sm font-semibold text-red-700">
                Êtes-vous sûr(e) ? Cette action est irréversible.
              </p>
              <div className="flex gap-3">
                <button
                  onClick={handleDelete}
                  disabled={deleting}
                  className="bg-red-600 text-white text-sm font-medium px-4 py-2 rounded-lg hover:bg-red-700 disabled:opacity-50 transition-colors"
                >
                  {deleting ? 'Suppression…' : 'Oui, supprimer définitivement'}
                </button>
                <button
                  onClick={() => setShowDeleteConfirm(false)}
                  className="text-sm font-medium text-gray-500 border border-gray-200 px-4 py-2 rounded-lg hover:bg-gray-50 transition-colors"
                >
                  Annuler
                </button>
              </div>
            </div>
          )}
        </div>
      </main>
    </div>
  )
}
