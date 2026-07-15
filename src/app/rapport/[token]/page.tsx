import { createAdminClient } from '@/lib/supabase/admin'
import Link from 'next/link'

interface ReportData {
  student_name: string
  xp_this_week: number
  sessions_this_week: number
  streak: number
  total_xp: number
  avg_accuracy: number
  top_skill: string | null
  weak_skill: string | null
}

export default async function RapportPublicPage({
  params,
}: {
  params: Promise<{ token: string }>
}) {
  const { token } = await params
  const admin = createAdminClient()

  const { data, error } = await admin
    .from('report_tokens')
    .select('*')
    .eq('token', token)
    .gt('expires_at', new Date().toISOString())
    .single()

  if (error || !data) {
    return (
      <div className="min-h-screen flex items-center justify-center px-6"
        style={{ background: 'linear-gradient(135deg,#f8f9ff 0%,#fefce8 100%)' }}>
        <div className="bg-white rounded-2xl shadow-xl max-w-sm w-full p-8 text-center">
          <div className="text-5xl mb-4">⏳</div>
          <h1 className="text-xl font-extrabold text-gray-900 mb-2">Lien expiré</h1>
          <p className="text-gray-500 text-sm mb-6">
            Ce lien de rapport n&apos;est plus valide (7 jours max). Connectez-vous pour voir les rapports à jour.
          </p>
          <Link href="/auth/login"
            className="inline-block bg-indigo-600 text-white text-sm font-semibold px-6 py-3 rounded-xl hover:bg-indigo-700 transition">
            Se connecter →
          </Link>
        </div>
      </div>
    )
  }

  const report = data.report_data as ReportData
  const weekLabel = new Date(data.week_start).toLocaleDateString('fr-CA', {
    day: 'numeric', month: 'long', year: 'numeric',
  })

  const accuracy = Math.min(100, Math.round(report.avg_accuracy ?? 0))

  return (
    <div className="min-h-screen py-10 px-4"
      style={{ background: 'linear-gradient(135deg,#f8f9ff 0%,#fefce8 100%)' }}>
      <div className="max-w-lg mx-auto">

        {/* Header */}
        <div className="bg-gradient-to-br from-indigo-600 to-purple-600 rounded-2xl p-8 text-center text-white mb-5 shadow-lg">
          <div className="flex items-center justify-center gap-2 mb-5">
            <div className="w-8 h-8 bg-white/20 rounded-xl flex items-center justify-center">
              <span className="text-white font-extrabold">E</span>
            </div>
            <span className="font-extrabold text-lg">Educa+</span>
          </div>
          <div className="text-4xl mb-3">📚</div>
          <h1 className="text-2xl font-extrabold mb-1">Rapport hebdomadaire</h1>
          <p className="text-white/80 text-sm">{report.student_name} — semaine du {weekLabel}</p>
        </div>

        {/* Stats */}
        <div className="grid grid-cols-3 gap-3 mb-4">
          <div className="bg-white rounded-2xl p-4 text-center shadow-sm border border-gray-100">
            <div className="text-3xl font-extrabold text-indigo-600">{report.sessions_this_week}</div>
            <div className="text-xs text-gray-500 mt-1">sessions</div>
          </div>
          <div className="bg-white rounded-2xl p-4 text-center shadow-sm border border-gray-100">
            <div className="text-3xl font-extrabold text-amber-500">+{report.xp_this_week} ⭐</div>
            <div className="text-xs text-gray-500 mt-1">XP cette semaine</div>
          </div>
          <div className="bg-white rounded-2xl p-4 text-center shadow-sm border border-gray-100">
            <div className="text-3xl font-extrabold text-orange-500">{report.streak} 🔥</div>
            <div className="text-xs text-gray-500 mt-1">jours consécutifs</div>
          </div>
        </div>

        {/* Précision */}
        {accuracy > 0 && (
          <div className="bg-white rounded-2xl p-5 shadow-sm border border-gray-100 mb-4">
            <p className="text-sm font-semibold text-gray-700 mb-3">Précision cette semaine</p>
            <div className="bg-gray-100 rounded-full h-3 overflow-hidden">
              <div
                className="h-3 rounded-full bg-gradient-to-r from-indigo-500 to-purple-500 transition-all"
                style={{ width: `${accuracy}%` }}
              />
            </div>
            <p className="text-xs text-gray-400 text-right mt-1.5">{accuracy}% de bonnes réponses</p>
          </div>
        )}

        {/* Points forts / à renforcer */}
        <div className="space-y-3 mb-4">
          {report.top_skill && (
            <div className="bg-green-50 border border-green-100 rounded-2xl p-4 flex items-center gap-3">
              <span className="text-2xl">🌟</span>
              <div>
                <p className="text-xs text-green-600 font-semibold uppercase tracking-wide">Point fort</p>
                <p className="text-sm font-bold text-green-800">{report.top_skill}</p>
              </div>
            </div>
          )}
          {report.weak_skill && (
            <div className="bg-amber-50 border border-amber-100 rounded-2xl p-4 flex items-center gap-3">
              <span className="text-2xl">💪</span>
              <div>
                <p className="text-xs text-amber-600 font-semibold uppercase tracking-wide">À renforcer</p>
                <p className="text-sm font-bold text-amber-800">{report.weak_skill}</p>
              </div>
            </div>
          )}
        </div>

        {/* XP total */}
        <div className="bg-white rounded-2xl p-5 shadow-sm border border-gray-100 mb-6 text-center">
          <p className="text-xs text-gray-400 uppercase tracking-wide mb-1">Total cumulé</p>
          <p className="text-3xl font-extrabold text-indigo-600">{report.total_xp} XP</p>
        </div>

        {/* Footer */}
        <div className="text-center">
          <p className="text-xs text-gray-400 mb-3">
            Ce lien est valide 7 jours. Pour voir tous les rapports :
          </p>
          <Link href="/auth/login"
            className="inline-block bg-indigo-600 text-white text-sm font-semibold px-6 py-3 rounded-xl hover:bg-indigo-700 transition">
            Accéder au tableau de bord →
          </Link>
          <p className="text-[10px] text-gray-300 mt-4">EducaPlus — Plateforme éducative adaptative pour le Québec</p>
        </div>

      </div>
    </div>
  )
}
