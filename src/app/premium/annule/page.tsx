import Link from 'next/link'

export default function AnnulePage() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center px-6"
      style={{ background: 'linear-gradient(135deg,#f8f9ff 0%,#fefce8 100%)' }}>
      <div className="max-w-md w-full text-center bg-white rounded-3xl shadow-xl border border-gray-100 p-10">
        <div className="text-6xl mb-4">😔</div>
        <h1 className="text-2xl font-extrabold text-gray-900 mb-2">
          Paiement annulé
        </h1>
        <p className="text-gray-500 mb-8">
          Aucun montant n&apos;a été débité. Vous pouvez réessayer quand vous voulez.
        </p>

        <div className="space-y-3">
          <Link href="/premium"
            className="block w-full py-3 rounded-xl font-bold text-white text-sm"
            style={{ background: 'linear-gradient(135deg,#4f46e5,#7c3aed)' }}>
            Réessayer →
          </Link>
          <Link href="/dashboard"
            className="block w-full py-3 rounded-xl font-semibold text-sm text-gray-500 border-2 border-gray-200 hover:bg-gray-50 transition-colors">
            Retour au tableau de bord
          </Link>
        </div>

        <p className="text-xs text-gray-400 mt-6">
          Des questions ? Écrivez-nous à&nbsp;
          <a href="mailto:support@savoila.com" className="underline">support@savoila.com</a>
        </p>
      </div>
    </div>
  )
}
