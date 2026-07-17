'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import Link from 'next/link'
import { LogoutButton } from '@/components/LogoutButton'

export default function ProfilPage() {
  const router = useRouter()
  const supabase = createClient()

  // État profil
  const [firstName, setFirstName] = useState('')
  const [lastName, setLastName] = useState('')
  const [currentEmail, setCurrentEmail] = useState('')
  const [loadingProfile, setLoadingProfile] = useState(true)

  // Formulaire info
  const [infoMsg, setInfoMsg] = useState<{ type: 'ok' | 'err'; text: string } | null>(null)
  const [savingInfo, setSavingInfo] = useState(false)

  // Formulaire courriel
  const [newEmail, setNewEmail] = useState('')
  const [emailMsg, setEmailMsg] = useState<{ type: 'ok' | 'err'; text: string } | null>(null)
  const [savingEmail, setSavingEmail] = useState(false)

  // Formulaire mot de passe
  const [newPw, setNewPw] = useState('')
  const [confirmPw, setConfirmPw] = useState('')
  const [pwMsg, setPwMsg] = useState<{ type: 'ok' | 'err'; text: string } | null>(null)
  const [savingPw, setSavingPw] = useState(false)

  useEffect(() => {
    async function load() {
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) { router.push('/auth/login'); return }

      setCurrentEmail(user.email ?? '')
      setNewEmail(user.email ?? '')

      const { data: profile } = await supabase
        .from('profiles')
        .select('first_name, last_name')
        .eq('id', user.id)
        .single()

      if (profile) {
        setFirstName(profile.first_name ?? '')
        setLastName(profile.last_name ?? '')
      }
      setLoadingProfile(false)
    }
    load()
  }, [])

  async function handleSaveInfo(e: React.FormEvent) {
    e.preventDefault()
    setSavingInfo(true)
    setInfoMsg(null)
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) { router.push('/auth/login'); return }

    const { error } = await supabase
      .from('profiles')
      .update({ first_name: firstName, last_name: lastName })
      .eq('id', user.id)

    setSavingInfo(false)
    if (error) {
      setInfoMsg({ type: 'err', text: 'Erreur lors de la sauvegarde. Réessayez.' })
    } else {
      setInfoMsg({ type: 'ok', text: 'Informations mises à jour ✓' })
    }
  }

  async function handleSaveEmail(e: React.FormEvent) {
    e.preventDefault()
    if (!newEmail || newEmail === currentEmail) {
      setEmailMsg({ type: 'err', text: 'Entrez un nouveau courriel différent de l\'actuel.' })
      return
    }
    setSavingEmail(true)
    setEmailMsg(null)

    const { error } = await supabase.auth.updateUser({ email: newEmail })
    setSavingEmail(false)
    if (error) {
      setEmailMsg({ type: 'err', text: 'Erreur : ' + error.message })
    } else {
      setEmailMsg({ type: 'ok', text: 'Un lien de confirmation a été envoyé à ' + newEmail })
    }
  }

  async function handleSavePw(e: React.FormEvent) {
    e.preventDefault()
    if (newPw.length < 8) {
      setPwMsg({ type: 'err', text: 'Le mot de passe doit contenir au moins 8 caractères.' })
      return
    }
    if (newPw !== confirmPw) {
      setPwMsg({ type: 'err', text: 'Les mots de passe ne correspondent pas.' })
      return
    }
    setSavingPw(true)
    setPwMsg(null)

    const { error } = await supabase.auth.updateUser({ password: newPw })
    setSavingPw(false)
    if (error) {
      setPwMsg({ type: 'err', text: 'Erreur : ' + error.message })
    } else {
      setPwMsg({ type: 'ok', text: 'Mot de passe mis à jour ✓' })
      setNewPw('')
      setConfirmPw('')
    }
  }

  if (loadingProfile) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="w-6 h-6 border-2 border-indigo-500 border-t-transparent rounded-full animate-spin" />
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <span className="text-lg font-bold text-indigo-600">Savoila</span>
          <span className="text-xs bg-indigo-100 text-indigo-600 font-semibold px-2 py-0.5 rounded-full">Québec</span>
        </div>
        <div className="flex items-center gap-4">
          <Link href="/dashboard" className="text-sm text-gray-500 hover:text-gray-700">
            ← Tableau de bord
          </Link>
          <LogoutButton />
        </div>
      </header>

      <main className="max-w-2xl mx-auto px-6 py-10 space-y-6">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Mon profil</h1>
          <p className="text-gray-500 text-sm mt-1">Gérez vos informations personnelles et vos accès.</p>
        </div>

        {/* ── Section 1 : Informations personnelles ── */}
        <section className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
          <h2 className="text-base font-semibold text-gray-800 mb-4">Informations personnelles</h2>
          <form onSubmit={handleSaveInfo} className="space-y-4">
            <div className="flex gap-4">
              <div className="flex-1">
                <label className="block text-xs font-semibold text-gray-500 uppercase tracking-wide mb-1.5">
                  Prénom
                </label>
                <input
                  type="text"
                  value={firstName}
                  onChange={e => setFirstName(e.target.value)}
                  required
                  className="w-full border border-gray-200 bg-gray-50 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                />
              </div>
              <div className="flex-1">
                <label className="block text-xs font-semibold text-gray-500 uppercase tracking-wide mb-1.5">
                  Nom
                </label>
                <input
                  type="text"
                  value={lastName}
                  onChange={e => setLastName(e.target.value)}
                  required
                  className="w-full border border-gray-200 bg-gray-50 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                />
              </div>
            </div>

            {infoMsg && (
              <p className={`text-sm px-4 py-2.5 rounded-xl ${infoMsg.type === 'ok' ? 'bg-green-50 text-green-700' : 'bg-red-50 text-red-600'}`}>
                {infoMsg.text}
              </p>
            )}

            <button
              type="submit"
              disabled={savingInfo}
              className="bg-indigo-600 hover:bg-indigo-700 text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition disabled:opacity-50"
            >
              {savingInfo ? 'Sauvegarde…' : 'Sauvegarder'}
            </button>
          </form>
        </section>

        {/* ── Section 2 : Courriel ── */}
        <section className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
          <h2 className="text-base font-semibold text-gray-800 mb-1">Adresse courriel</h2>
          <p className="text-xs text-gray-400 mb-4">Actuel : <span className="font-medium text-gray-600">{currentEmail}</span></p>
          <form onSubmit={handleSaveEmail} className="space-y-4">
            <div>
              <label className="block text-xs font-semibold text-gray-500 uppercase tracking-wide mb-1.5">
                Nouveau courriel
              </label>
              <input
                type="email"
                value={newEmail}
                onChange={e => setNewEmail(e.target.value)}
                required
                placeholder="nouveau@exemple.com"
                className="w-full border border-gray-200 bg-gray-50 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
              />
            </div>

            {emailMsg && (
              <p className={`text-sm px-4 py-2.5 rounded-xl ${emailMsg.type === 'ok' ? 'bg-green-50 text-green-700' : 'bg-red-50 text-red-600'}`}>
                {emailMsg.text}
              </p>
            )}

            <button
              type="submit"
              disabled={savingEmail}
              className="bg-indigo-600 hover:bg-indigo-700 text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition disabled:opacity-50"
            >
              {savingEmail ? 'Envoi…' : 'Changer le courriel'}
            </button>
          </form>
        </section>

        {/* ── Section 3 : Mot de passe ── */}
        <section className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
          <h2 className="text-base font-semibold text-gray-800 mb-4">Mot de passe</h2>
          <form onSubmit={handleSavePw} className="space-y-4">
            <div>
              <label className="block text-xs font-semibold text-gray-500 uppercase tracking-wide mb-1.5">
                Nouveau mot de passe
              </label>
              <input
                type="password"
                value={newPw}
                onChange={e => setNewPw(e.target.value)}
                required
                minLength={8}
                placeholder="8 caractères minimum"
                className="w-full border border-gray-200 bg-gray-50 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
              />
            </div>
            <div>
              <label className="block text-xs font-semibold text-gray-500 uppercase tracking-wide mb-1.5">
                Confirmer le mot de passe
              </label>
              <input
                type="password"
                value={confirmPw}
                onChange={e => setConfirmPw(e.target.value)}
                required
                placeholder="Répétez le mot de passe"
                className={`w-full border bg-gray-50 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:border-transparent transition ${
                  confirmPw.length > 0
                    ? newPw === confirmPw ? 'border-green-400 focus:ring-green-400' : 'border-red-300 focus:ring-red-400'
                    : 'border-gray-200 focus:ring-indigo-500'
                }`}
              />
              {confirmPw.length > 0 && newPw !== confirmPw && (
                <p className="text-[11px] text-red-500 mt-1">Les mots de passe ne correspondent pas.</p>
              )}
            </div>

            {pwMsg && (
              <p className={`text-sm px-4 py-2.5 rounded-xl ${pwMsg.type === 'ok' ? 'bg-green-50 text-green-700' : 'bg-red-50 text-red-600'}`}>
                {pwMsg.text}
              </p>
            )}

            <button
              type="submit"
              disabled={savingPw || newPw.length < 8 || newPw !== confirmPw}
              className="bg-indigo-600 hover:bg-indigo-700 text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition disabled:opacity-50"
            >
              {savingPw ? 'Mise à jour…' : 'Changer le mot de passe'}
            </button>
          </form>
        </section>

        {/* ── Zone danger ── */}
        <section className="bg-white rounded-2xl border border-red-100 shadow-sm p-6">
          <h2 className="text-base font-semibold text-red-600 mb-1">Zone dangereuse</h2>
          <p className="text-xs text-gray-400 mb-4">Ces actions sont irréversibles.</p>
          <LogoutButton className="text-sm text-red-500 hover:text-red-700 font-semibold border border-red-200 hover:border-red-400 px-4 py-2 rounded-xl transition" />
        </section>
      </main>
    </div>
  )
}
