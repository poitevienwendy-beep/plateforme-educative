'use client'

import { useState, useEffect } from 'react'
import { useRouter, useParams } from 'next/navigation'
import Link from 'next/link'

// ─── Types accès enfant ───────────────────────────────────────────────────
type ChildAccess = {
  child_user_id: string | null
  autonomy_mode: boolean
  child_email: string | null
  child_pin_hash: string | null
}

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

  // ── Accès enfant ───────────────────────────────────────────────────
  const [access, setAccess] = useState<ChildAccess | null>(null)
  // Mode PIN
  const [pinMode, setPinMode] = useState<'idle' | 'setup' | 'success'>('idle')
  const [newPin, setNewPin] = useState('')
  const [confirmPin, setConfirmPin] = useState('')
  const [pinLoading, setPinLoading] = useState(false)
  const [pinError, setPinError] = useState<string | null>(null)
  const [accessUrl, setAccessUrl] = useState<string | null>(null)
  const [copied, setCopied] = useState(false)
  // Mode autonomie
  const [autoMode, setAutoMode] = useState<'idle' | 'setup' | 'sent'>('idle')
  const [childEmail, setChildEmail] = useState('')
  const [autoLoading, setAutoLoading] = useState(false)
  const [autoError, setAutoError] = useState<string | null>(null)

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
        setAccess({
          child_user_id:  data.child_user_id  ?? null,
          autonomy_mode:  data.autonomy_mode  ?? false,
          child_email:    data.child_email    ?? null,
          child_pin_hash: data.child_pin_hash ?? null,
        })
        if (data.child_user_id && !data.autonomy_mode) {
          setAccessUrl(`${window.location.origin}/acces-enfant/${childId}`)
        }
        if (data.autonomy_mode && data.child_email) {
          setAutoMode('sent')
          setChildEmail(data.child_email)
        }
      } catch {
        router.push('/dashboard')
      } finally {
        setLoadingData(false)
      }
    }
    loadChild()
  }, [childId, router])

  // ── Handlers accès enfant ────────────────────────────────────────
  async function handleSetupPin(e: React.FormEvent) {
    e.preventDefault()
    setPinError(null)
    if (!/^\d{4}$/.test(newPin)) { setPinError('Le PIN doit être 4 chiffres.'); return }
    if (newPin !== confirmPin)    { setPinError('Les deux codes ne correspondent pas.'); return }
    setPinLoading(true)
    const res = await fetch('/api/children/setup-pin', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ child_id: childId, pin: newPin }),
    })
    const data = await res.json()
    setPinLoading(false)
    if (!res.ok) { setPinError(data.error ?? 'Erreur'); return }
    const url = `${window.location.origin}${data.access_url}`
    setAccessUrl(url)
    setPinMode('success')
    setNewPin('')
    setConfirmPin('')
  }

  function handleCopyLink() {
    if (!accessUrl) return
    navigator.clipboard.writeText(accessUrl)
    setCopied(true)
    setTimeout(() => setCopied(false), 2000)
  }

  async function handleSendInvite(e: React.FormEvent) {
    e.preventDefault()
    setAutoError(null)
    if (!childEmail.includes('@')) { setAutoError('Courriel invalide.'); return }
    setAutoLoading(true)
    const res = await fetch('/api/children/invite', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ child_id: childId, child_email: childEmail }),
    })
    const data = await res.json()
    setAutoLoading(false)
    if (!res.ok) { setAutoError(data.error ?? 'Erreur'); return }
    setAutoMode('sent')
  }

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

        {/* ── Section : Accès enfant ────────────────────────────── */}
        <div className="mt-8 bg-white rounded-xl border border-indigo-100 p-6 space-y-5">
          <div>
            <h2 className="text-sm font-semibold text-indigo-700 mb-0.5">🔐 Accès autonome pour l&apos;enfant</h2>
            <p className="text-xs text-gray-500">
              Choisis un mode selon l&apos;âge de l&apos;enfant.
              Les deux modes permettent au parent de continuer à voir la progression.
            </p>
          </div>

          {/* ── Option A : PIN (primaire) ── */}
          <div className="border border-gray-100 rounded-xl p-4">
            <div className="flex items-center justify-between mb-2">
              <div>
                <p className="text-sm font-semibold text-gray-800">📱 Code secret PIN <span className="text-xs font-normal text-gray-400">(primaire · 6-12 ans)</span></p>
                <p className="text-xs text-gray-500 mt-0.5">L&apos;enfant entre un code 4 chiffres sur son appareil.</p>
              </div>
              {access?.child_user_id && !access?.autonomy_mode && (
                <span className="text-xs bg-green-100 text-green-700 font-semibold px-2 py-1 rounded-full">Actif</span>
              )}
            </div>

            {/* Lien existant */}
            {accessUrl && !access?.autonomy_mode && (
              <div className="mb-3 bg-indigo-50 rounded-lg px-3 py-2 flex items-center justify-between gap-2">
                <span className="text-xs text-indigo-600 truncate font-mono">{accessUrl}</span>
                <button
                  onClick={handleCopyLink}
                  className="text-xs font-semibold text-indigo-700 shrink-0 hover:underline"
                >
                  {copied ? 'Copié ✓' : 'Copier'}
                </button>
              </div>
            )}

            {pinMode === 'idle' && (
              <button
                onClick={() => setPinMode('setup')}
                className="text-sm font-medium text-indigo-600 border border-indigo-200 px-4 py-2 rounded-lg hover:bg-indigo-50 transition-colors"
              >
                {access?.child_pin_hash ? 'Changer le code PIN' : 'Configurer un code PIN'}
              </button>
            )}

            {pinMode === 'setup' && (
              <form onSubmit={handleSetupPin} className="space-y-3 mt-3">
                <div className="flex gap-3">
                  <div className="flex-1">
                    <label className="block text-xs text-gray-600 mb-1">Nouveau code (4 chiffres)</label>
                    <input
                      type="password"
                      inputMode="numeric"
                      maxLength={4}
                      value={newPin}
                      onChange={e => setNewPin(e.target.value.replace(/\D/g,''))}
                      placeholder="••••"
                      className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 text-center tracking-widest"
                    />
                  </div>
                  <div className="flex-1">
                    <label className="block text-xs text-gray-600 mb-1">Confirmer le code</label>
                    <input
                      type="password"
                      inputMode="numeric"
                      maxLength={4}
                      value={confirmPin}
                      onChange={e => setConfirmPin(e.target.value.replace(/\D/g,''))}
                      placeholder="••••"
                      className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 text-center tracking-widest"
                    />
                  </div>
                </div>
                {pinError && <p className="text-xs text-red-600">{pinError}</p>}
                <div className="flex gap-2">
                  <button type="submit" disabled={pinLoading}
                    className="bg-indigo-600 text-white text-sm font-medium px-4 py-2 rounded-lg hover:bg-indigo-700 disabled:opacity-50 transition-colors">
                    {pinLoading ? 'Création…' : 'Créer le code'}
                  </button>
                  <button type="button" onClick={() => { setPinMode('idle'); setNewPin(''); setConfirmPin(''); setPinError(null) }}
                    className="text-sm text-gray-500 border border-gray-200 px-4 py-2 rounded-lg hover:bg-gray-50 transition-colors">
                    Annuler
                  </button>
                </div>
              </form>
            )}

            {pinMode === 'success' && accessUrl && (
              <div className="mt-3 bg-green-50 border border-green-200 rounded-xl p-4">
                <p className="text-sm font-semibold text-green-700 mb-2">✅ Code PIN créé !</p>
                <p className="text-xs text-gray-600 mb-2">Envoie ce lien à ton enfant. Il peut le mettre en favori.</p>
                <div className="flex items-center gap-2 bg-white border border-green-200 rounded-lg px-3 py-2">
                  <span className="text-xs font-mono text-indigo-600 flex-1 truncate">{accessUrl}</span>
                  <button onClick={handleCopyLink}
                    className="text-xs font-semibold text-indigo-700 shrink-0 hover:underline">
                    {copied ? 'Copié ✓' : 'Copier'}
                  </button>
                </div>
              </div>
            )}
          </div>

          {/* ── Option B : Mode autonomie (secondaire) ── */}
          <div className="border border-gray-100 rounded-xl p-4">
            <div className="flex items-center justify-between mb-2">
              <div>
                <p className="text-sm font-semibold text-gray-800">📧 Compte indépendant <span className="text-xs font-normal text-gray-400">(secondaire · 12+ ans)</span></p>
                <p className="text-xs text-gray-500 mt-0.5">L&apos;enfant reçoit un courriel et crée son propre accès.</p>
              </div>
              {access?.autonomy_mode && (
                <span className="text-xs bg-blue-100 text-blue-700 font-semibold px-2 py-1 rounded-full">
                  {access.child_user_id ? 'Activé' : 'En attente'}
                </span>
              )}
            </div>

            {autoMode === 'idle' && (
              <button
                onClick={() => setAutoMode('setup')}
                className="text-sm font-medium text-indigo-600 border border-indigo-200 px-4 py-2 rounded-lg hover:bg-indigo-50 transition-colors"
              >
                {access?.autonomy_mode ? 'Renvoyer l&apos;invitation' : 'Envoyer une invitation'}
              </button>
            )}

            {autoMode === 'setup' && (
              <form onSubmit={handleSendInvite} className="space-y-3 mt-3">
                <div>
                  <label className="block text-xs text-gray-600 mb-1">Courriel de l&apos;enfant</label>
                  <input
                    type="email"
                    value={childEmail}
                    onChange={e => setChildEmail(e.target.value)}
                    placeholder="prenom@exemple.com"
                    className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                  />
                </div>
                {autoError && <p className="text-xs text-red-600">{autoError}</p>}
                <div className="flex gap-2">
                  <button type="submit" disabled={autoLoading}
                    className="bg-indigo-600 text-white text-sm font-medium px-4 py-2 rounded-lg hover:bg-indigo-700 disabled:opacity-50 transition-colors">
                    {autoLoading ? 'Envoi…' : 'Envoyer l&apos;invitation'}
                  </button>
                  <button type="button" onClick={() => { setAutoMode('idle'); setAutoError(null) }}
                    className="text-sm text-gray-500 border border-gray-200 px-4 py-2 rounded-lg hover:bg-gray-50 transition-colors">
                    Annuler
                  </button>
                </div>
              </form>
            )}

            {autoMode === 'sent' && (
              <div className="mt-3 bg-blue-50 border border-blue-200 rounded-xl p-4">
                <p className="text-sm font-semibold text-blue-700 mb-1">
                  {access?.child_user_id ? '✅ Compte activé' : '📬 Invitation envoyée !'}
                </p>
                <p className="text-xs text-gray-600">
                  {access?.child_user_id
                    ? `${childEmail} peut se connecter directement.`
                    : `${childEmail} recevra un courriel avec les instructions. L'enfant doit cliquer sur le lien pour activer son accès.`
                  }
                </p>
                <button onClick={() => setAutoMode('setup')}
                  className="mt-2 text-xs text-blue-600 hover:underline">
                  Renvoyer / changer de courriel
                </button>
              </div>
            )}
          </div>
        </div>

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
