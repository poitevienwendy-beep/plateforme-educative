'use client'

import { useState, useRef, use } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'

const DIGITS = ['1','2','3','4','5','6','7','8','9','','0','⌫']

export default function AccesEnfantPage({
  params,
}: {
  params: Promise<{ childId: string }>
}) {
  const { childId } = use(params)
  const router = useRouter()

  const [pin, setPin] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)
  const [shake, setShake] = useState(false)

  function pressDigit(d: string) {
    if (loading) return
    if (d === '⌫') {
      setPin(p => p.slice(0, -1))
      setError('')
      return
    }
    if (d === '') return
    if (pin.length >= 4) return
    const next = pin + d
    setPin(next)
    setError('')
    if (next.length === 4) submitPin(next)
  }

  async function submitPin(value: string) {
    setLoading(true)
    try {
      const res = await fetch('/api/children/validate-pin', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ child_id: childId, pin: value }),
      })
      const data = await res.json()

      if (!res.ok || !data.token_hash) {
        setError('PIN incorrect. Essaie encore 🔄')
        setPin('')
        setShake(true)
        setTimeout(() => setShake(false), 600)
        setLoading(false)
        return
      }

      // Déconnecter toute session parent active avant de connecter l'enfant
      const supabase = createClient()
      await supabase.auth.signOut()

      const { error: otpErr } = await supabase.auth.verifyOtp({
        token_hash: data.token_hash,
        type: data.type ?? 'magiclink',
      })

      if (otpErr) {
        setError('Erreur de connexion. Demande à un parent.')
        setPin('')
        setLoading(false)
        return
      }

      // Connecté ! Rediriger vers le parcours
      router.push(`/eleve/${childId}`)
    } catch {
      setError('Erreur réseau. Réessaie.')
      setPin('')
      setLoading(false)
    }
  }

  return (
    <div
      className="min-h-screen flex flex-col items-center justify-center px-6"
      style={{ background: 'linear-gradient(135deg,#667eea 0%,#764ba2 100%)' }}
    >
      {/* Carte principale */}
      <div className="bg-white rounded-3xl shadow-2xl p-8 w-full max-w-sm text-center">

        {/* Avatar / avatar emoji */}
        <div className="w-20 h-20 rounded-full bg-indigo-100 flex items-center justify-center text-4xl mx-auto mb-4">
          🎓
        </div>

        <h1 className="text-2xl font-extrabold text-gray-900 mb-1">
          Bonjour !
        </h1>
        <p className="text-gray-500 text-sm mb-6">
          Entre ton code secret pour commencer
        </p>

        {/* Indicateurs PIN */}
        <div
          className="flex justify-center gap-4 mb-8"
          style={shake ? { animation: 'box-shake 0.5s ease-in-out' } : {}}
        >
          {[0,1,2,3].map(i => (
            <div
              key={i}
              className="w-5 h-5 rounded-full border-2 transition-all duration-150"
              style={{
                background: i < pin.length ? '#4f46e5' : 'transparent',
                borderColor: i < pin.length ? '#4f46e5' : '#d1d5db',
                transform: i < pin.length ? 'scale(1.2)' : 'scale(1)',
              }}
            />
          ))}
        </div>

        {/* Message d'erreur */}
        {error && (
          <p className="text-red-500 text-sm font-medium mb-4 animate-pulse">{error}</p>
        )}

        {/* Clavier numérique */}
        <div className="grid grid-cols-3 gap-3">
          {DIGITS.map((d, i) => (
            <button
              key={i}
              onClick={() => pressDigit(d)}
              disabled={loading || (d !== '⌫' && d !== '' && pin.length >= 4)}
              className={`
                rounded-2xl text-2xl font-bold py-4 transition-all duration-100 select-none
                ${d === '' ? 'invisible' : ''}
                ${d === '⌫'
                  ? 'bg-gray-100 text-gray-600 active:bg-gray-200'
                  : 'bg-indigo-50 text-indigo-700 hover:bg-indigo-100 active:bg-indigo-200 active:scale-95'
                }
                ${loading ? 'opacity-50 cursor-not-allowed' : 'cursor-pointer'}
              `}
            >
              {loading && d !== '⌫' && d !== '' ? (
                <span className="text-base">…</span>
              ) : d}
            </button>
          ))}
        </div>

        {/* Chargement */}
        {loading && (
          <p className="mt-6 text-indigo-500 font-semibold text-sm animate-pulse">
            Connexion en cours…
          </p>
        )}
      </div>

      {/* Lien retour */}
      <button
        onClick={() => router.push('/auth/login')}
        className="mt-6 text-white/70 text-sm hover:text-white transition-colors"
      >
        Connexion parent →
      </button>
    </div>
  )
}
