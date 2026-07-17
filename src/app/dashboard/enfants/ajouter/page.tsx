'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import Link from 'next/link'

const GRADE_OPTIONS = [
  { value: 'sec1', label: 'Secondaire 1 (~12-13 ans)' },
  { value: 'sec2', label: 'Secondaire 2 (~13-14 ans)' },
  { value: 'sec3', label: 'Secondaire 3 (~14-15 ans)' },
  { value: 'sec4', label: 'Secondaire 4 (~15-16 ans)' },
  { value: 'sec5', label: 'Secondaire 5 (~16-17 ans)' },
]

// Années de naissance valides selon le schéma (2000–2020)
const BIRTH_YEARS = Array.from({ length: 21 }, (_, i) => 2020 - i)

export default function AjouterEnfantPage() {
  const router = useRouter()
  const [displayName, setDisplayName] = useState('')
  const [birthYear, setBirthYear] = useState('')
  const [gradeLevel, setGradeLevel] = useState('sec1')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setLoading(true)
    setError(null)

    const supabase = createClient()

    // Récupérer l'utilisateur courant
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) { router.push('/auth/login'); return }

    // Créer l'enfant
    const { data: newChild, error: childError } = await supabase
      .from('children')
      .insert({
        display_name: displayName,
        birth_year: birthYear ? parseInt(birthYear) : null,
        grade_level: gradeLevel,
      })
      .select('id')
      .single()

    if (childError) {
      setError('Erreur lors de la création du profil : ' + childError.message)
      setLoading(false)
      return
    }

    // Lier l'enfant au parent
    const { error: linkError } = await supabase
      .from('parent_child_links')
      .insert({ parent_id: user.id, child_id: newChild.id })

    if (linkError) {
      setError('Erreur lors de la liaison : ' + linkError.message)
      setLoading(false)
      return
    }

    router.push('/dashboard')
    router.refresh()
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white border-b border-gray-200 px-8 py-4">
        <Link href="/dashboard" className="text-sm text-indigo-600 hover:underline">
          ← Retour au tableau de bord
        </Link>
      </header>

      <main className="max-w-lg mx-auto px-6 py-10">
        <h1 className="text-2xl font-bold text-gray-900 mb-2">Ajouter un enfant</h1>
        <p className="text-gray-500 mb-8">
          Crée le profil de ton enfant pour commencer à suivre ses apprentissages.
        </p>

        <form onSubmit={handleSubmit} className="bg-white rounded-xl shadow-sm border border-gray-100 p-6 space-y-5">
          {/* Prénom / nom affiché */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Prénom de l'enfant <span className="text-red-500">*</span>
            </label>
            <input
              type="text"
              value={displayName}
              onChange={(e) => setDisplayName(e.target.value)}
              placeholder="Ex : Emma"
              required
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
            />
            <p className="text-xs text-gray-400 mt-1">Seulement le prénom — visible par l'enfant.</p>
          </div>

          {/* Année de naissance */}
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

          {/* Niveau scolaire */}
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
              Détermine les exercices et compétences PFEQ proposés.
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
            {loading ? 'Création...' : 'Créer le profil'}
          </button>
        </form>
      </main>
    </div>
  )
}
