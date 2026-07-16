import { createClient } from '@/lib/supabase/server'
import Link from 'next/link'
import PremiumCheckout from './PremiumCheckout'

const FREE_FEATURES = [
  '3 compétences par matière (Maths + Français)',
  'Exercices adaptés au niveau BKT',
  'XP, niveaux et streaks',
  'Badges de motivation',
  'Mode révision des erreurs',
]

const PREMIUM_FEATURES = [
  'Toutes les compétences débloquées (6 par matière)',
  'Rapport parent avec graphiques',
  'Email hebdomadaire de progression',
  'Analyse détaillée par compétence',
  'Priorité support',
  'Accès aux nouvelles matières en avant-première',
]

export default async function PremiumPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const isPremium = user
    ? (await supabase.from('profiles').select('plan').eq('id', user.id).single()).data?.plan === 'premium'
    : false

  return (
    <div className="min-h-screen" style={{ background: 'linear-gradient(135deg,#f8f9ff 0%,#fefce8 100%)' }}>
      {/* Nav */}
      <header className="bg-white/80 backdrop-blur border-b border-gray-100 px-5 md:px-8 py-4 flex items-center justify-between">
        <Link href="/dashboard" className="font-bold text-indigo-600 text-lg">
          📚 Savoila
        </Link>
        <Link href="/dashboard" className="text-sm text-gray-500 hover:underline">
          ← Retour
        </Link>
      </header>

      <main className="max-w-4xl mx-auto px-6 py-16">
        {/* Hero */}
        <div className="text-center mb-14">
          <span className="inline-block bg-amber-100 text-amber-700 text-xs font-bold px-3 py-1 rounded-full mb-4 uppercase tracking-wide">
            ⭐ Passez à Premium
          </span>
          <h1 className="text-4xl font-extrabold text-gray-900 mb-4">
            Débloquez le plein potentiel<br />
            <span style={{ color: '#4f46e5' }}>de votre enfant</span>
          </h1>
          <p className="text-lg text-gray-500 max-w-xl mx-auto">
            Accès complet à toutes les compétences PFEQ Sec&nbsp;1, rapports parent
            détaillés et suivi hebdomadaire par email.
          </p>
        </div>

        {isPremium ? (
          <div className="max-w-md mx-auto text-center bg-white rounded-2xl border border-emerald-200 shadow-md p-8">
            <div className="text-5xl mb-3">🌟</div>
            <h2 className="text-xl font-bold text-gray-900 mb-2">Vous êtes déjà Premium !</h2>
            <p className="text-gray-500 mb-6">Profitez de toutes les fonctionnalités dSavoila.</p>
            <form action="/api/stripe/portal" method="POST">
              <button type="submit"
                className="w-full border-2 border-indigo-600 text-indigo-600 py-3 rounded-xl font-semibold hover:bg-indigo-50">
                Gérer mon abonnement
              </button>
            </form>
          </div>
        ) : (
          <PremiumCheckout />
        )}

        {/* Comparaison Free vs Premium */}
        <div className="mt-16 grid grid-cols-1 md:grid-cols-2 gap-6">
          {/* Free */}
          <div className="bg-white rounded-2xl border border-gray-200 p-7">
            <h3 className="text-lg font-bold text-gray-700 mb-1">Gratuit</h3>
            <p className="text-3xl font-extrabold text-gray-900 mb-6">$0 <span className="text-base font-normal text-gray-400">pour toujours</span></p>
            <ul className="space-y-3">
              {FREE_FEATURES.map((f) => (
                <li key={f} className="flex items-start gap-2 text-sm text-gray-700">
                  <span className="text-emerald-500 mt-0.5">✓</span> {f}
                </li>
              ))}
            </ul>
          </div>

          {/* Premium */}
          <div className="bg-gradient-to-br from-indigo-600 to-violet-600 rounded-2xl p-7 text-white shadow-xl">
            <div className="flex items-center justify-between mb-1">
              <h3 className="text-lg font-bold">Premium</h3>
              <span className="text-xs bg-amber-400 text-amber-900 font-bold px-2 py-0.5 rounded-full">POPULAIRE</span>
            </div>
            <p className="text-3xl font-extrabold mb-1">$19.99 <span className="text-base font-normal opacity-70">/ mois</span></p>
            <p className="text-xs opacity-60 mb-6">ou $179/an &mdash; économisez 25&nbsp;%</p>
            <ul className="space-y-3">
              {[...FREE_FEATURES, ...PREMIUM_FEATURES].map((f, i) => (
                <li key={f} className="flex items-start gap-2 text-sm">
                  <span className={i < FREE_FEATURES.length ? 'opacity-60' : 'text-amber-300'}>{i < FREE_FEATURES.length ? '✓' : '⭐'}</span>
                  <span className={i < FREE_FEATURES.length ? 'opacity-80' : 'font-semibold'}>{f}</span>
                </li>
              ))}
            </ul>
          </div>
        </div>

        {/* Garantie */}
        <div className="mt-10 text-center text-sm text-gray-400">
          🔒 Paiement sécurisé par Stripe &nbsp;·&nbsp;
          Annulation à tout moment &nbsp;·&nbsp;
          + TPS et TVQ applicables
        </div>
      </main>
    </div>
  )
}
