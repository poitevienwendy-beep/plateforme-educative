'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'

export default function PremiumCheckout() {
  const [interval, setInterval] = useState<'monthly' | 'annual'>('annual')
  const [loading, setLoading] = useState(false)
  const router = useRouter()

  async function handleCheckout() {
    setLoading(true)
    try {
      const res = await fetch('/api/stripe/checkout', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ interval }),
      })
      const { url, error } = await res.json()
      if (error) {
        if (res.status === 401) {
          router.push('/auth/signup?next=/premium')
          return
        }
        alert(error)
        setLoading(false)
        return
      }
      window.location.href = url
    } catch {
      alert('Erreur de connexion. Réessayez.')
      setLoading(false)
    }
  }

  return (
    <div className="max-w-sm mx-auto">
      {/* Toggle mensuel / annuel */}
      <div className="flex bg-gray-100 rounded-xl p-1 mb-6">
        <button
          onClick={() => setInterval('monthly')}
          className={`flex-1 py-2 rounded-lg text-sm font-semibold transition-all ${
            interval === 'monthly'
              ? 'bg-white shadow text-gray-900'
              : 'text-gray-500 hover:text-gray-700'
          }`}
        >
          Mensuel
        </button>
        <button
          onClick={() => setInterval('annual')}
          className={`flex-1 py-2 rounded-lg text-sm font-semibold transition-all relative ${
            interval === 'annual'
              ? 'bg-white shadow text-gray-900'
              : 'text-gray-500 hover:text-gray-700'
          }`}
        >
          Annuel
          <span className="ml-1 text-xs bg-amber-400 text-amber-900 font-bold px-1.5 py-0.5 rounded-full">
            -25%
          </span>
        </button>
      </div>

      {/* Prix affiché */}
      <div className="text-center mb-6">
        {interval === 'annual' ? (
          <>
            <p className="text-4xl font-extrabold text-gray-900">
              $14.92
              <span className="text-base font-normal text-gray-400"> / mois</span>
            </p>
            <p className="text-sm text-gray-500 mt-1">Facturé $179/an · économisez $60.88</p>
          </>
        ) : (
          <>
            <p className="text-4xl font-extrabold text-gray-900">
              $19.99
              <span className="text-base font-normal text-gray-400"> / mois</span>
            </p>
            <p className="text-sm text-gray-500 mt-1">Facturé mensuellement</p>
          </>
        )}
      </div>

      {/* Bouton checkout */}
      <button
        onClick={handleCheckout}
        disabled={loading}
        className="w-full py-4 rounded-2xl font-bold text-white text-base transition-all disabled:opacity-60"
        style={{ background: loading ? '#a5b4fc' : 'linear-gradient(135deg,#4f46e5,#7c3aed)' }}
      >
        {loading ? 'Redirection...' : 'Commencer Premium →'}
      </button>

      <p className="text-center text-xs text-gray-400 mt-3">
        Annulation à tout moment · + TPS et TVQ applicables
      </p>
    </div>
  )
}
