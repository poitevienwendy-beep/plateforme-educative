'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import Link from 'next/link'

export default function LoginPage() {
  const router = useRouter()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  // Read ?next= from URL safely (avoids Suspense requirement of useSearchParams)
  // Safety: only allow relative paths (no open-redirect)
  const [next] = useState(() => {
    if (typeof window === 'undefined') return '/dashboard'
    const raw = new URLSearchParams(window.location.search).get('next') ?? ''
    return raw.startsWith('/') ? raw : '/dashboard'
  })

  async function handleLogin(e: React.FormEvent) {
    e.preventDefault()
    setLoading(true)
    setError(null)
    const supabase = createClient()
    const { error: loginError } = await supabase.auth.signInWithPassword({ email, password })
    if (loginError) {
      setError('Courriel ou mot de passe invalide')
      setLoading(false)
      return
    }
    router.refresh()
    router.push(next)
  }

  return (
    <div className="min-h-screen flex">

      {/* ── Panneau gauche ─────────────────────────────────────── */}
      <div className="hidden lg:flex lg:w-5/12 flex-col justify-between p-10"
        style={{ background: 'linear-gradient(145deg, #4f46e5 0%, #7c3aed 60%, #a855f7 100%)' }}>

        {/* Logo */}
        <div>
          <div className="flex items-center gap-2">
            <div className="w-9 h-9 bg-white/20 rounded-xl flex items-center justify-center">
              <span className="text-white font-extrabold text-lg">E</span>
            </div>
            <span className="text-white font-extrabold text-xl tracking-tight">Savoila</span>
          </div>
        </div>

        {/* Accroche centrale */}
        <div>
          {/* Illustration SVG originale — constellation d'étoiles */}
          <svg viewBox="0 0 240 180" className="w-56 mb-8 opacity-90" xmlns="http://www.w3.org/2000/svg">
            {/* Livre ouvert */}
            <rect x="40" y="80" width="75" height="55" rx="4" fill="white" opacity="0.15"/>
            <rect x="125" y="80" width="75" height="55" rx="4" fill="white" opacity="0.15"/>
            <line x1="118" y1="80" x2="118" y2="135" stroke="white" strokeWidth="2" opacity="0.3"/>
            {/* Lignes de texte symboliques */}
            <line x1="52" y1="97" x2="102" y2="97" stroke="white" strokeWidth="2" opacity="0.4"/>
            <line x1="52" y1="107" x2="95" y2="107" stroke="white" strokeWidth="2" opacity="0.4"/>
            <line x1="52" y1="117" x2="100" y2="117" stroke="white" strokeWidth="2" opacity="0.4"/>
            <line x1="133" y1="97" x2="183" y2="97" stroke="white" strokeWidth="2" opacity="0.4"/>
            <line x1="133" y1="107" x2="175" y2="107" stroke="white" strokeWidth="2" opacity="0.4"/>
            <line x1="133" y1="117" x2="180" y2="117" stroke="white" strokeWidth="2" opacity="0.4"/>
            {/* Etoile de réussite au-dessus */}
            <polygon points="118,28 123,44 140,44 126,54 131,70 118,60 105,70 110,54 96,44 113,44"
              fill="#fbbf24" opacity="0.9"/>
            {/* Petites étoiles décoratives */}
            <circle cx="50" cy="45" r="3" fill="white" opacity="0.5"/>
            <circle cx="190" cy="35" r="2" fill="white" opacity="0.4"/>
            <circle cx="210" cy="65" r="3" fill="#fbbf24" opacity="0.6"/>
            <circle cx="30" cy="70" r="2" fill="white" opacity="0.4"/>
            <circle cx="65" cy="25" r="2" fill="#fbbf24" opacity="0.5"/>
            <circle cx="170" cy="20" r="3" fill="white" opacity="0.4"/>
            {/* Barre de progression */}
            <rect x="60" y="150" width="120" height="8" rx="4" fill="white" opacity="0.15"/>
            <rect x="60" y="150" width="85" height="8" rx="4" fill="#fbbf24" opacity="0.7"/>
          </svg>

          <h2 className="text-3xl font-extrabold text-white leading-tight mb-4">
            La réussite scolaire,<br />une compétence à la fois.
          </h2>

          <div className="space-y-3">
            {[
              {
                svg: <svg viewBox="0 0 20 20" fill="none" className="w-4 h-4" stroke="white" strokeWidth="1.8"><circle cx="10" cy="10" r="8"/><circle cx="10" cy="10" r="4"/><circle cx="10" cy="10" r="1.5" fill="white"/></svg>,
                text: 'Exercices adaptés au niveau de chaque enfant',
              },
              {
                svg: <svg viewBox="0 0 20 20" fill="none" className="w-4 h-4" stroke="white" strokeWidth="1.8"><polyline points="2,14 7,9 11,12 18,5"/><polyline points="14,5 18,5 18,9"/></svg>,
                text: 'Progression visible en temps réel pour les parents',
              },
              {
                svg: <svg viewBox="0 0 20 20" fill="none" className="w-4 h-4" stroke="white" strokeWidth="1.8"><path d="M10 2l2.4 4.8 5.3.8-3.8 3.7.9 5.2L10 14l-4.8 2.5.9-5.2L2.3 7.6l5.3-.8z"/></svg>,
                text: 'Motivation par les étoiles, XP et badges',
              },
            ].map((item, i) => (
              <div key={i} className="flex items-center gap-3">
                <div className="w-8 h-8 bg-white/15 rounded-lg flex items-center justify-center shrink-0">
                  {item.svg}
                </div>
                <p className="text-white/85 text-sm">{item.text}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Bas de page */}
        <p className="text-white/40 text-xs">© 2026 Savoila — Conçu pour le Québec 🌸</p>
      </div>

      {/* ── Panneau droit (formulaire) ─────────────────────────── */}
      <div className="flex-1 flex flex-col justify-center px-6 py-12 bg-white">
        <div className="w-full max-w-sm mx-auto">

          {/* Logo mobile uniquement */}
          <div className="flex items-center gap-2 mb-8 lg:hidden">
            <div className="w-8 h-8 bg-indigo-600 rounded-xl flex items-center justify-center">
              <span className="text-white font-extrabold">S</span>
            </div>
            <span className="font-extrabold text-lg text-gray-900">Savoila</span>
          </div>

          <h1 className="text-2xl font-extrabold text-gray-900 mb-1">Bon retour !</h1>
          <p className="text-gray-500 text-sm mb-7">Connectez-vous à votre espace parent.</p>

          <form onSubmit={handleLogin} className="space-y-4">
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

            <div>
              <div className="flex items-center justify-between mb-1.5">
                <label className="text-xs font-semibold text-gray-600 uppercase tracking-wide">
                  Mot de passe
                </label>
                <Link href="/auth/forgot-password" className="text-xs text-indigo-500 hover:underline">
                  Mot de passe oublié ?
                </Link>
              </div>
              <input
                type="password"
                value={password}
                onChange={e => setPassword(e.target.value)}
                required
                placeholder="••••••••"
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
              className="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-3 px-4 rounded-xl transition disabled:opacity-50 text-sm mt-2">
              {loading ? 'Connexion en cours…' : 'Se connecter →'}
            </button>
          </form>

          <p className="mt-6 text-center text-sm text-gray-400">
            Pas encore de compte ?{' '}
            <Link href="/auth/signup" className="text-indigo-600 font-semibold hover:underline">
              Créer un compte gratuitement
