'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import Link from 'next/link'

export default function ForgotPasswordPage() {
  const [email, setEmail] = useState('')
  const [loading, setLoading] = useState(false)
  const [sent, setSent] = useState(false)
  const [error, setError] = useState<string | null>(null)

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setLoading(true)
    setError(null)
    const supabase = createClient()
    const { error: resetError } = await supabase.auth.resetPasswordForEmail(email, {
      redirectTo: `${window.location.origin}/auth/callback?next=/auth/reset-password`,
    })
    if (resetError) {
      setError(resetError.message)
      setLoading(false)
      return
    }
    setSent(true)
    setLoading(false)
  }

  if (sent) {
    return (
      <div className="min-h-screen flex items-center justify-center px-6"
        style={{ background: 'linear-gradient(135deg,#f8f9ff 0%,#fefce8 100%)' }}>
        <div className="bg-white rounded-2xl shadow-xl max-w-sm w-full p-8 text-center">
          <div className="text-5xl mb-4">📧</div>
          <h1 className="text-xl font-extrabold text-gray-900 mb-2">Vérifiez vos courriels</h1>
          <p className="text-gray-500 text-sm mb-6">
            Si un compte existe pour <strong>{email}</strong>, vous recevrez un lien
            pour réinitialiser votre mot de passe dans les prochaines minutes.
          </p>
          <Link href="/auth/login" className="text-indigo-600 font-semibold text-sm hover:underline">
            ← Retour à la connexion
          </Link>
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
            <span className="text-white font-extrabold">S</span>
          </div>
          <span className="font-extrabold text-lg text-gray-900">Savoila</span>
        </div>

        <h1 className="text-2xl font-extrabold text-gray-900 mb-1">Mot de passe oublié ?</h1>
        <p className="text-gray-500 text-sm mb-7">
          Entrez votre courriel et nous vous enverrons un lien pour créer un nouveau mot de passe.
        </p>

        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="block text-xs font-semibold text-gray-600 mb-1.5 uppercase tracking-wide">
              Adresse courriel
            </label>
            <input
              type="email"
              value={email}
              onChange={e => setEmail(e.target.value)}
              required
              placeholder="vous@exemple.com"
              className="w-full border border-gray-200 bg-gray-50 rounded-xl px-4 py-3 text-sm text-gray-900 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition"
            />
          </div>

          {error && (
            <div className="flex items-center gap-2 bg-red-50 border border-red-100 text-red-600 text-sm px-4 py-3 rounded-xl">
              <span>⚠️</span> {error}
            </div>
          )}

          <button
            type="submit"
            disabled={loading}
            className="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-3 px-4 rounded-xl transition disabled:opacity-50 text-sm">
            {loading ? 'Envoi en cours…' : 'Envoyer le lien →'}
          </button>
        </form>

        <p className="mt-6 text-center text-sm text-gray-400">
          <Link href="/auth/login" className="text-indigo-600 font-semibold hover:underline">
            ← Retour à la connexion
          </Link>
        </p>
      </div>
    </div>
  )
}
   