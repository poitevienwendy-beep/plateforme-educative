'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import Link from 'next/link'

export default function SignUpPage() {
  const router = useRouter()
  // Read ?next= from URL safely (avoids Suspense requirement of useSearchParams)
  // Safety: only allow relative paths (no open-redirect)
  const [next] = useState(() => {
    if (typeof window === 'undefined') return '/dashboard'
    const raw = new URLSearchParams(window.location.search).get('next') ?? ''
    return raw.startsWith('/') ? raw : '/dashboard'
  })
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [firstName, setFirstName] = useState('')
  const [lastName, setLastName] = useState('')
  const [confirm, setConfirm] = useState('')
  const [showPassword, setShowPassword] = useState(false)
  const [showConfirm, setShowConfirm] = useState(false)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  async function handleSignUp(e: React.FormEvent) {
    e.preventDefault()
    if (password !== confirm) { setError('Les mots de passe ne correspondent pas.'); return }
    setLoading(true)
    setError(null)
    const supabase = createClient()
    const { data, error: signUpError } = await supabase.auth.signUp({
      email,
      password,
      options: { data: { role: 'parent' } },
    })
    if (signUpError) { setError(signUpError.message); setLoading(false); return }
    if (data.user) {
      const { error: profileError } = await supabase.from('profiles').insert({
        id: data.user.id,
        email: data.user.email,
        first_name: firstName,
        last_name: lastName,
        role: 'parent',
      })
      if (profileError) console.error('Erreur création profil:', profileError)
    }
    router.push(next)
  }

  const pwValid = password.length >= 8 && password === confirm

  return (
    <div className="min-h-screen flex">

      {/* ── Panneau gauche ─────────────────────────────────────── */}
      <div className="hidden lg:flex lg:w-5/12 flex-col justify-between p-10"
        style={{ background: 'linear-gradient(145deg, #4f46e5 0%, #7c3aed 60%, #a855f7 100%)' }}>

        {/* Logo */}
        <div className="flex items-center gap-2">
          <div className="w-9 h-9 bg-white/20 rounded-xl flex items-center justify-center">
            <span className="text-white font-extrabold text-lg">E</span>
          </div>
          <span className="text-white font-extrabold text-xl tracking-tight">Educa+</span>
        </div>

        {/* Contenu central */}
        <div>
          {/* Illustration SVG originale — livre étoilé */}
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

          <h2 className="text-3xl font-extrabold text-white leading-tight mb-2">
            Créez votre compte<br />parent gratuitement.
          </h2>
          <p className="text-white/70 text-sm mb-6">
            Ajoutez ensuite vos enfants et suivez leur progression en temps réel.
          </p>

          <div className="space-y-2">
            {[
              {
                svg: <svg viewBox="0 0 20 20" fill="none" className="w-4 h-4 shrink-0" stroke="white" strokeWidth="2"><circle cx="10" cy="10" r="8"/><polyline points="6,10 9,13 14,7"/></svg>,
                text: 'Essai gratuit — 3 compétences incluses',
              },
              {
                svg: <svg viewBox="0 0 20 20" fill="none" className="w-4 h-4 shrink-0" stroke="white" strokeWidth="2"><rect x="5" y="9" width="10" height="8" rx="2"/><path d="M7 9V6a3 3 0 0 1 6 0v3"/></svg>,
                text: 'Vos données protégées par la Loi 25',
              },
              {
                svg: <svg viewBox="0 0 20 20" fill="none" className="w-4 h-4 shrink-0" stroke="white" strokeWidth="2"><path d="M4 4h5v12H4z"/><path d="M11 4h5v12h-5z"/><path d="M4 10h12"/></svg>,
                text: 'Conçu pour le programme scolaire québécois',
              },
            ].map((item, i) => (
              <div key={i} className="flex items-center gap-2.5">
                {item.svg}
                <p className="text-white/80 text-sm">{item.text}</p>
              </div>
            ))}
          </div>
        </div>

        <p className="text-white/40 text-xs">© 2026 EducaPlus — Conçu pour le Québec 🌸</p>
      </div>

      {/* ── Panneau droit (formulaire) ─────────────────────────── */}
      <div className="flex-1 flex flex-col justify-center px-6 py-12 bg-white">
        <div className="w-full max-w-sm mx-auto">

          {/* Logo mobile */}
          <div className="flex items-center gap-2 mb-8 lg:hidden">
            <div className="w-8 h-8 bg-indigo-600 rounded-xl flex items-center justify-center">
              <span className="text-white font-extrabold">E</span>
            </div>
            <span className="font-extrabold text-lg text-gray-900">Educa+</span>
          </div>

          <h1 className="text-2xl font-extrabold text-gray-900 mb-1">Créer un compte</h1>
          <p className="text-gray-500 text-sm mb-7">Pour les parents — c&apos;est gratuit et rapide.</p>

          <form onSubmit={handleSignUp} className="space-y-4">
            <div className="flex gap-3">
              <div className="flex-1">
                <label className="block text-xs font-semibold text-gray-600 mb-1.5 uppercase tracking-wide">Prénom</label>
                <input
                  type="text"
                  value={firstName}
                  onChange={e => setFirstName(e.target.value)}
                  required
                  placeholder="Marie"
                  className="w-full border border-gray-200 bg-gray-50 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition"
                />
              </div>
              <div className="flex-1">
                <label className="block text-xs font-semibold text-gray-600 mb-1.5 uppercase tracking-wide">Nom</label>
                <input
                  type="text"
                  value={lastName}
                  onChange={e => setLastName(e.target.value)}
                  required
                  placeholder="Tremblay"
                  className="w-full border border-gray-200 bg-gray-50 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition"
                />
              </div>
            </div>

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
                className="w-full border border-gray-200 bg-gray-50 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition"
              />
            </div>

            {/* Mot de passe */}
            <div>
              <label className="block text-xs font-semibold text-gray-600 mb-1.5 uppercase tracking-wide">
                Mot de passe
              </label>
              <div className="relative">
                <input
                  type={showPassword ? 'text' : 'password'}
                  value={password}
                  onChange={e => setPassword(e.target.value)}
                  required
                  minLength={8}
                  placeholder="8 caractères minimum"
                  className="w-full border border-gray-200 bg-gray-50 rounded-xl px-4 py-3 pr-11 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition"
                />
                <button
                  type="button"
                  onClick={() => setShowPassword(v => !v)}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                  {showPassword
                    ? <svg viewBox="0 0 20 20" fill="none" className="w-5 h-5" stroke="currentColor" strokeWidth="1.7"><path d="M3 10s3-5 7-5 7 5 7 5-3 5-7 5-7-5-7-5z"/><circle cx="10" cy="10" r="2"/><line x1="3" y1="3" x2="17" y2="17"/></svg>
                    : <svg viewBox="0 0 20 20" fill="none" className="w-5 h-5" stroke="currentColor" strokeWidth="1.7"><path d="M3 10s3-5 7-5 7 5 7 5-3 5-7 5-7-5-7-5z"/><circle cx="10" cy="10" r="2"/></svg>
                  }
                </button>
              </div>
              {/* Indicateur force */}
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

            {/* Confirmation mot de passe */}
            <div>
              <label className="block text-xs font-semibold text-gray-600 mb-1.5 uppercase tracking-wide">
                Confirmer le mot de passe
              </label>
              <div className="relative">
                <input
                  type={showConfirm ? 'text' : 'password'}
                  value={confirm}
                  onChange={e => setConfirm(e.target.value)}
                  required
                  placeholder="Répétez votre mot de passe"
                  className={`w-full border bg-gray-50 rounded-xl px-4 py-3 pr-11 text-sm focus:outline-none focus:ring-2 focus:border-transparent transition ${
                    confirm.length > 0
                      ? password === confirm
                        ? 'border-green-400 focus:ring-green-400'
                        : 'border-red-300 focus:ring-red-400'
                      : 'border-gray-200 focus:ring-indigo-500'
                  }`}
                />
                <button
                  type="button"
                  onClick={() => setShowConfirm(v => !v)}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                  {showConfirm
                    ? <svg viewBox="0 0 20 20" fill="none" className="w-5 h-5" stroke="currentColor" strokeWidth="1.7"><path d="M3 10s3-5 7-5 7 5 7 5-3 5-7 5-7-5-7-5z"/><circle cx="10" cy="10" r="2"/><line x1="3" y1="3" x2="17" y2="17"/></svg>
                    : <svg viewBox="0 0 20 20" fill="none" className="w-5 h-5" stroke="currentColor" strokeWidth="1.7"><path d="M3 10s3-5 7-5 7 5 7 5-3 5-7 5-7-5-7-5z"/><circle cx="10" cy="10" r="2"/></svg>
                  }
                </button>
              </div>
              {confirm.length > 0 && password !== confirm && (
                <p className="text-[11px] text-red-500 mt-1">Les mots de passe ne correspondent pas.</p>
              )}
              {confirm.length > 0 && password === confirm && (
                <p className="text-[11px] text-green-600 mt-1">✓ Les mots de passe correspondent.</p>
              )}
            </div>

            {error && (
              <div className="flex items-center gap-2 bg-red-50 border border-red-100 text-red-600 text-sm px-4 py-3 rounded-xl">
                <svg viewBox="0 0 20 20" fill="none" className="w-4 h-4 shrink-0" stroke="currentColor" strokeWidth="2"><circle cx="10" cy="10" r="8"/><line x1="10" y1="6" x2="10" y2="10"/><circle cx="10" cy="14" r="0.5" fill="currentColor"/></svg>
                {error}
              </div>
            )}

            <button
              type="submit"
              disabled={loading || !pwValid}
              className="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-3 px-4 rounded-xl transition disabled:opacity-50 text-sm mt-2">
              {loading ? 'Création en cours…' : 'Créer mon compte gratuitement →'}
            </button>
          </form>

          <p className="mt-3 text-center text-[11px] text-gray-400">
            En vous inscrivant, vous acceptez nos{' '}
            <Link href="/politique-confidentialite" className="underline">conditions d&apos;utilisation</Link>{' '}
            et notre politique de confidentialité (Loi 25).
          </p>

          <p className="mt-5 text-center text-sm text-gray-400">
            Déjà un compte ?{' '}
            <Link href="/auth/login" className="text-indigo-600 font-semibold hover:underline">
              Se connecter
            </Link>
          </p>
        </div>
      </div>
    </div>
  )
}
