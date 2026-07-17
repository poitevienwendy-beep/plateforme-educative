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
    const { data: { session } } = await supabase.auth.getSession()
    if (!session) { router.push('/auth/login'); return }

    const gqlUrl = `${process.env.NEXT_PUBLIC_SUPABASE_URL}/graphql/v1`
    const headers = {
      'Content-Type': 'application/json',
      'apikey': process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
      'Authorization': `Bearer ${session.access_token}`,
    }

    async function gql(query: string, variables: Record<string, unknown>) {
      const res = await fetch(gqlUrl, {
        method: 'POST',
        headers,
        body: JSON.stringify({ query, variables }),
      })
      return res.json()
    }

    // ── Étape 1 : créer l'enfant via GraphQL (bypass PostgREST) ──
    const r1 = await gql(`
      mutation AddChild($display_name: String!, $birth_year: Int, $grade_level: String!) {
        insertIntoChildrenCollection(objects: [{
          display_name: $display_name
          birth_year: $birth_year
          grade_level: $grade_level
        }]) {
          records { id }
        }
      }
    `, {
      display_name: displayName,
      birth_year: birthYear ? parseInt(birthYear) : null,
      grade_level: gradeLevel,
    })

    if (r1.errors?.length) {
      // Si snake_case échoue, essayer camelCase
      if (r1.errors[0].message.includes('display_name') || r1.errors[0].message.includes('Unknown')) {
        const r1b = await gql(`
          mutation AddChild($displayName: String!, $birthYear: Int, $gradeLevel: String!) {
            insertIntoChildrenCollection(objects: [{
              displayName: $displayName
              birthYear: $birthYear
              gradeLevel: $gradeLevel
            }]) {
              records { id }
            }
          }
        `, {
          displayName,
          birthYear: birthYear ? parseInt(birthYear) : null,
          gradeLevel,
        })
        if (r1b.errors?.length) {
          setError('Erreur : ' + r1b.errors[0].message)
          setLoading(false)
          return
        }
        const childIdB = r1b.data?.insertIntoChildrenCollection?.records?.[0]?.id
        if (!childIdB) { setError('Erreur : profil non créé'); setLoading(false); return }
        await finalizeLien(childIdB, session.user.id, gql)
        return
      }
      setError('Erreur : ' + r1.errors[0].message)
      setLoading(false)
      return
    }

    const childId = r1.data?.insertIntoChildrenCollection?.records?.[0]?.id
    if (!childId) {
      setError('Erreur : profil non créé')
      setLoading(false)
      return
    }

    await finalizeLien(childId, session.user.id, gql)

    async function finalizeLien(cId: string, pId: string, gqlFn: typeof gql) {
      // ── Étape 2 : lier au parent ──
      const r2 = await gqlFn(`
        mutation AddLink($parent_id: UUID!, $child_id: UUID!) {
          insertIntoParent_child_linksCollection(objects: [{
            parent_id: $parent_id
            child_id: $child_id
          }]) {
            records { parent_id }
          }
        }
      `, { parent_id: pId, child_id: cId })

      if (r2.errors?.length) {
        // Essayer camelCase si snake_case échoue
        if (r2.errors[0].message.includes('parent_id') || r2.errors[0].message.includes('Unknown')) {
          const r2b = await gqlFn(`
            mutation AddLink($parentId: UUID!, $childId: UUID!) {
              insertIntoParentChildLinksCollection(objects: [{
                parentId: $parentId
                childId: $childId
              }]) {
                records { parentId }
              }
            }
          `, { parentId: pId, childId: cId })
          if (r2b.errors?.length) {
            setError('Erreur liaison : ' + r2b.errors[0].message)
            setLoading(false)
            return
          }
        } else {
          setError('Erreur liaison : ' + r2.errors[0].message)
          setLoading(false)
          return
        }
      }

      router.push('/dashboard')
      router.refresh()
    }
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
