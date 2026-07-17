import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import { LogoutButton } from '@/components/LogoutButton'

const GRADE_LABELS: Record<string, string> = {
  sec1: 'Secondaire 1',
  sec2: 'Secondaire 2',
  sec3: 'Secondaire 3',
  sec4: 'Secondaire 4',
  sec5: 'Secondaire 5',
}

const CHILD_COLORS = [
  { bg: 'bg-indigo-100', text: 'text-indigo-600', btn: 'bg-indigo-600 hover:bg-indigo-700', border: 'border-indigo-200', ring: 'hover:ring-indigo-300' },
  { bg: 'bg-violet-100', text: 'text-violet-600', btn: 'bg-violet-600 hover:bg-violet-700', border: 'border-violet-200', ring: 'hover:ring-violet-300' },
  { bg: 'bg-emerald-100', text: 'text-emerald-600', btn: 'bg-emerald-600 hover:bg-emerald-700', border: 'border-emerald-200', ring: 'hover:ring-emerald-300' },
  { bg: 'bg-amber-100', text: 'text-amber-600', btn: 'bg-amber-500 hover:bg-amber-600', border: 'border-amber-200', ring: 'hover:ring-amber-300' },
  { bg: 'bg-rose-100', text: 'text-rose-600', btn: 'bg-rose-600 hover:bg-rose-700', border: 'border-rose-200', ring: 'hover:ring-rose-300' },
]

export default async function DashboardPage() {
  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/auth/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', user.id)
    .single()

  // Récupérer les enfants liés à ce parent
  const { data: links } = await supabase
    .from('parent_child_links')
    .select('child_id, children(*)')
    .eq('parent_id', user.id)

  const children = links?.map((l: any) => l.children).filter(Boolean) ?? []

  // Pour chaque enfant, récupérer la maîtrise moyenne
  const childIds = children.map((c: any) => c.id)
  const { data: masteryRows } = childIds.length > 0
    ? await supabase
        .from('knowledge_states')
        .select('child_id, p_mastery')
        .in('child_id', childIds)
    : { data: [] }

  // Calculer la maîtrise moyenne par enfant
  const masteryByChild: Record<string, number> = {}
  if (masteryRows && masteryRows.length > 0) {
    const grouped: Record<string, number[]> = {}
    for (const row of masteryRows) {
      if (!grouped[row.child_id]) grouped[row.child_id] = []
      grouped[row.child_id].push(row.p_mastery)
    }
    for (const [childId, values] of Object.entries(grouped)) {
      masteryByChild[childId] = values.reduce((a, b) => a + b, 0) / values.length
    }
  }

  // Sessions cette semaine
  const weekAgo = new Date()
  weekAgo.setDate(weekAgo.getDate() - 7)
  const { data: recentSessions } = childIds.length > 0
    ? await supabase
        .from('exercise_sessions')
        .select('child_id')
        .in('child_id', childIds)
        .gte('started_at', weekAgo.toISOString())
    : { data: [] }

  const sessionsByChild: Record<string, number> = {}
  for (const s of recentSessions ?? []) {
    sessionsByChild[s.child_id] = (sessionsByChild[s.child_id] ?? 0) + 1
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header compact */}
      <header className="bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <span className="text-lg font-bold text-indigo-600">Savoila</span>
          <span className="text-xs bg-indigo-100 text-indigo-600 font-semibold px-2 py-0.5 rounded-full">Québec</span>
        </div>
        <div className="flex items-center gap-4">
          <Link href="/dashboard/profil" className="text-sm text-gray-500 hover:text-gray-700 transition">
            {profile?.first_name} {profile?.last_name}
          </Link>
          <LogoutButton />
        </div>
      </header>

      <main className="max-w-5xl mx-auto px-6 py-10">

        {/* Salutation */}
        <div className="mb-8">
          <h1 className="text-2xl font-bold text-gray-900">
            Bonjour, {profile?.first_name || 'Parent'} 👋
          </h1>
          <p className="text-gray-500 mt-1">Choisissez un enfant pour commencer une session.</p>
        </div>

        {/* === PROFILS ENFANTS — élément principal === */}
        {children.length === 0 ? (
          <div className="bg-white border-2 border-dashed border-gray-200 rounded-2xl p-16 text-center">
            <div className="text-5xl mb-4">👨‍👩‍👧</div>
            <h2 className="text-lg font-semibold text-gray-700 mb-2">Aucun enfant ajouté</h2>
            <p className="text-gray-400 mb-6">Ajoutez le profil de votre enfant pour commencer.</p>
            <Link
              href="/dashboard/enfants/ajouter"
              className="inline-block bg-indigo-600 text-white font-semibold px-6 py-3 rounded-xl hover:bg-indigo-700 transition-colors"
            >
              + Ajouter mon premier enfant
            </Link>
          </div>
        ) : (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
            {children.map((child: any, i: number) => {
              const color = CHILD_COLORS[i % CHILD_COLORS.length]
              const mastery = masteryByChild[child.id]
              const masteryPct = mastery !== undefined ? Math.round(mastery * 100) : null
              const sessions = sessionsByChild[child.id] ?? 0

              return (
                <div
                  key={child.id}
                  className={`bg-white rounded-2xl border ${color.border} shadow-sm hover:shadow-md hover:ring-2 ${color.ring} transition-all flex flex-col`}
                >
                  {/* Avatar + nom */}
                  <div className="p-6 flex-1">
                    <div className={`w-16 h-16 rounded-full ${color.bg} flex items-center justify-center text-2xl font-bold ${color.text} mb-4`}>
                      {child.display_name[0].toUpperCase()}
                    </div>
                    <h2 className="text-xl font-bold text-gray-900 mb-1">{child.display_name}</h2>
                    <p className="text-sm text-gray-500 mb-4">
                      {GRADE_LABELS[child.grade_level] ?? child.grade_level}
                    </p>

                    {/* Stats rapides */}
                    <div className="flex items-center gap-4 text-xs text-gray-400">
                      {masteryPct !== null ? (
                        <span className="flex items-center gap-1">
                          <span className="font-semibold text-gray-600">{masteryPct}%</span> maîtrise globale
                        </span>
                      ) : (
                        <span>Pas encore de session</span>
                      )}
                      {sessions > 0 && (
                        <span>{sessions} session{sessions > 1 ? 's' : ''} cette semaine</span>
                      )}
                    </div>

                    {/* Barre de maîtrise */}
                    {masteryPct !== null && (
                      <div className="w-full bg-gray-100 rounded-full h-1.5 mt-3">
                        <div
                          className="h-1.5 rounded-full bg-indigo-500 transition-all duration-500"
                          style={{ width: `${masteryPct}%` }}
                        />
                      </div>
                    )}
                  </div>

                  {/* Actions */}
                  <div className="px-6 pb-6 flex flex-col gap-2">
                    <Link
                      href={`/eleve/${child.id}`}
                      className={`w-full text-center ${color.btn} text-white font-semibold py-3 rounded-xl transition-colors text-sm`}
                    >
                      🎓 Interface élève
                    </Link>
                    <Link
                      href={`/dashboard/enfants/${child.id}`}
                      className="w-full text-center text-gray-400 font-medium py-2 text-sm hover:text-gray-600 transition-colors"
                    >
                      Voir le profil →
                    </Link>
                  </div>
                </div>
              )
            })}

            {/* Carte "Ajouter un enfant" */}
            <Link
              href="/dashboard/enfants/ajouter"
              className="bg-white border-2 border-dashed border-gray-200 rounded-2xl p-6 flex flex-col items-center justify-center text-center hover:border-indigo-300 hover:bg-indigo-50 transition-all group min-h-[200px]"
            >
              <div className="w-14 h-14 rounded-full bg-gray-100 group-hover:bg-indigo-100 flex items-center justify-center text-2xl text-gray-400 group-hover:text-indigo-500 mb-3 transition-colors">
                +
              </div>
              <p className="text-sm font-medium text-gray-400 group-hover:text-indigo-600 transition-colors">
                Ajouter un enfant
              </p>
            </Link>
          </div>
        )}
      </main>
    </div>
  )
}
