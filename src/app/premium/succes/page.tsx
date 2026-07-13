import Link from 'next/link'

export default function SuccesPage() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center px-6"
      style={{ background: 'linear-gradient(135deg,#f8f9ff 0%,#fefce8 100%)' }}>
      <div className="max-w-md w-full text-center bg-white rounded-3xl shadow-xl border border-emerald-100 p-10">
        <div className="text-6xl mb-4">🎉</div>
        <h1 className="text-2xl font-extrabold text-gray-900 mb-2">
          Bienvenue dans Eva Étude Premium !
        </h1>
        <p className="text-gray-500 mb-8">
          Votre abonnement est actif. Toutes les compétences sont maintenant débloquées
          et les rapports parent sont disponibles.
        </p>

        <div className="space-y-3">
          <Link href="/dashboard"
            className="block w-full py-3 rounded-xl font-bold text-white text-sm"
            style={{ background: 'linear-gradient(135deg,#4f46e5,#7c3aed)' }}>
            Aller au tableau de bord →
          </Link>
          <Link href="/premium"
            className="block w-full py-3 rounded-xl font-semibold text-sm text-indigo-600 border-2 border-indigo-200 hover:bg-indigo-50 transition-colors">
            Voir mon abonnement
          </Link>
        </div>

        <p className="text-xs text-gray-400 mt-6">
          Un reçu a été envoyé à votre adresse email par Stripe.
        </p>
      </div>
    </div>
  )
}
