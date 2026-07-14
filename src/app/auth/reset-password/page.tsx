'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import Link from 'next/link'

export default function ResetPasswordPage() {
  const router = useRouter()
  const [password, setPassword] = useState('')
  const [confirm, setConfirm] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [ready, setReady] = useState(false)
  const [done, setDone] = useState(false)

  useEffect(() => {
    // Le lien courriel Supabase inclut un "code" (flux PKCE)
    const code = new URLSearchParams(window.location.search).get('code')
    if (!code) {
      setError('Lien invalide. Demandez un nouveau lien de réinitialisation.')
      return
    }
    const supabase = createClient()
    supabase.auth.exchangeCodeForSession(code).then(({ error: exchangeError }) => {
      if (exchangeError) {
        setError('Ce lien est expiré ou déjà utilisé. Demandez-en un nouveau.')
      } else {
        setReady(true)
      }
    })
  }, [])

  async function handleReset(e: React.FormEvent) {
    e.preventDefault()
    if (password !== confirm) {
      setError('Les mots de passe ne correspondent pas.')
      return
    }
    setLoading(true)
    setError(null)
    const supabase = createClient()
    const { error: updateError } = await supabase.auth.updateUser({ password })
    if (updateError) {
      setError('Erreur lors de la mise à jour. Réessayez.')
      setLoading(false)
      return
    }
    setDone(true)
    setTimeout(() => router.push('/dashboard'), 2500)
  }

  if (done) {
    return (
      <div className="min-h-screen flex items-center justify-center px-6"
        style={{ background: 'linear-gradient(135deg,#f8f9ff 0%,#fefce8 100%)' }}>
        <div className="bg-white rounded-2xl shadow-xl max-w-sm w-full p-8 text-center">
          <div className="text-5xl mb-4">✅</div>
          <h1 className="text-xl font-extrabold text-gray-900 mb-2">Mot de passe mis à jour !</h1>
          <p className="text-gray-500 text-sm">Redirection vers votre tableau de bord…</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen flex items-center justify-center px-6"
      style={{ background: 'linear-gradient(135deg,#f8f9ff 0%,#fefce8 100%)' }}>
      <div className="bg-white rounded-2xl shadow-xl max-w-sm w-full p-8">

        {/* Logo */}
        <div className="flex items-center gap-2 mb-8">
          <div className="w-8 h-8 bg-indigo-600 rounded-xl flex items-center justify-center">
            <span className="text-white font-extrabold">E</span>
          </div>
          <span className="font-extrabold text-lg text-gray-900">Eva Etude</span>
        </div>

        <h1 className="text-2xl font-extrabold text-gray-900 mb-1">Nouveau mot de passe</h1>
        <p className="text-gray-500 text-sm mb-7">Choisissez un mot de passe sécurisé d&apos;au moins 8 caractères.</p>

        {/* Vérification du lien en cours */}
        {!ready && !error && (
          <div className="text-center py-6">
            <div className="inline-block w-6 h-6 border-2 border-indigo-500 border-t-transparent rounded-full animate-spin mb-3"/>
            <p className="text-gray-400 text-sm">Vérification du lien…</p>
          </div>
        )}

        {/* Lien invalide ou expiré */}
        {error && (
          <div className="bg-red-50 border border-red-100 text-red-600 text-sm px-4 py-4 rounded-xl">
            <p className="mb-3">⚠️ {error}</p>
            <Link href="/auth/forgot-password"
              className="inline-block text-indigo-600 font-semibold underline text-sm">
              Demander un nouveau lien →
            </Link>
          </div>
        )}

        {/* Formulaire nouveau mot de passe */}
        {ready && (
          <form onSubmit={handleReset} className="space-y-4">
            <div>
              <label className="block text-xs font-semibold text-gray-600 mb-1.5 uppercase tracking-wide">
                Nouveau mot de passe
              </label>
              <input
                type="password"
                value={password}
                onChange={e => setPassword(e.target.value)}
                required
                minLength={8}
                placeholder="8 caractères minimum"
                className="w-full border border-gray-200 bg-gray-50 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition"
              />
              {password.length > 0 && (
                <div className="flex items-center gap-1.5 mt-1.5">
                  <div className={`h-1 flex-1 rounded-full transition-all ${password.length >= 1 ? 'bg-red-400' : 'bg-gray-200'}`}/>
                  <div className={`h-1 flex-1 rounded-full transition-all ${password.length >= 6 ? 'bg-amber-400' : 'bg-gray-200'}`}/>
                  <div className={`h-1 flex-1 rounded-full transition-all ${password.length >= 8 ? 'bg-green-500' : 'bg-gray-200'}`}/>
                  <span className="text-[10px] text-gray-400 shrink-0">
                    {password.length < 6 ? 'Trop court' : password.length < 8 ? 'Presque' : '✓ Suffisant'}
                  </span>
                </div>
              )}
            </div>

            <div>
              <label className="block text-xs font-semibold text-gray-600 mb-1.5 uppercase tracking-wide">
                Confirmer le mot de passe
              </label>
              <input
                type="password"
                value={confirm}
                onChange={e => setConfirm(e.target.value)}
                required
                placeholder="Répétez votre mot de passe"
                className={`w-full border bg-gray-50 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:border-transparent transition ${
                  confirm.length > 0
                    ? password === confirm
                      ? 'border-green-400 focus:ring-green-400'
                      : 'border-red-300 focus:ring-red-400'
                    : 'border-gray-200 focus:ring-indigo-500'
                }`}
              />
              {confirm.length > 0 && password !== confirm && (
                <p className="text-[11px] text-red-500 mt-1">Les mots de passe ne correspondent pas.</p>
              )}
              {confirm.length > 0 && password === confirm && (
                <p className="text-[11px] text-green-600 mt-1">✓ Les mots de passe correspondent.</p>
              )}
            </div>

            <button
              type="submit"
              disabled={loading || password.length < 8 || password !== confirm}
              className="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-3 px-4 rounded-xl transition disabled:opacity-50 text-sm mt-2">
              {loading ? 'Mise à jour…' : 'Réinitialiser le mot de passe →'}
            </button>
          </form>
        )}
      </div>
    </div>
  )
}
