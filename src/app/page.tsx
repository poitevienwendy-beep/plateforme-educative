import Link from 'next/link'

const FEATURE_ICONS = {
  target: (
    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="6"/><circle cx="12" cy="12" r="2"/>
    </svg>
  ),
  brain: (
    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M9.5 2A2.5 2.5 0 0 1 12 4.5v15a2.5 2.5 0 0 1-4.96-.46 2.5 2.5 0 0 1-1.98-3 2.5 2.5 0 0 1-1.32-4.24 3 3 0 0 1 .34-5.58 2.5 2.5 0 0 1 1.96-3.18A2.5 2.5 0 0 1 9.5 2Z"/>
      <path d="M14.5 2A2.5 2.5 0 0 0 12 4.5v15a2.5 2.5 0 0 0 4.96-.46 2.5 2.5 0 0 0 1.98-3 2.5 2.5 0 0 0 1.32-4.24 3 3 0 0 0-.34-5.58 2.5 2.5 0 0 0-1.96-3.18A2.5 2.5 0 0 0 14.5 2Z"/>
    </svg>
  ),
  chart: (
    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/>
      <line x1="2" y1="20" x2="22" y2="20"/>
    </svg>
  ),
  flag: (
    <svg viewBox="0 0 40 27" width="32" height="22" xmlns="http://www.w3.org/2000/svg">
      <rect width="40" height="27" fill="#003DA5"/>
      <rect x="17" y="0" width="6" height="27" fill="white"/>
      <rect x="0" y="10.5" width="40" height="6" fill="white"/>
      <text x="8.5" y="9.5" textAnchor="middle" fontSize="7" fill="white">⚜</text>
      <text x="31.5" y="9.5" textAnchor="middle" fontSize="7" fill="white">⚜</text>
      <text x="8.5" y="23" textAnchor="middle" fontSize="7" fill="white">⚜</text>
      <text x="31.5" y="23" textAnchor="middle" fontSize="7" fill="white">⚜</text>
    </svg>
  ),
}

const FEATURES = [
  {
    iconKey: 'target' as const,
    color: 'text-indigo-600',
    bg: 'bg-indigo-50',
    title: 'Exercices adaptés au PFEQ',
    description: "Questions alignées sur le Programme de formation de l'école québécoise, par niveau et par compétence.",
  },
  {
    iconKey: 'brain' as const,
    color: 'text-violet-600',
    bg: 'bg-violet-50',
    title: 'Apprentissage adaptatif',
    description: "L'algorithme BKT ajuste automatiquement la difficulté selon la maîtrise réelle de chaque élève.",
  },
  {
    iconKey: 'chart' as const,
    color: 'text-emerald-600',
    bg: 'bg-emerald-50',
    title: 'Rapport parent détaillé',
    description: 'Graphiques de progression, points forts, compétences à renforcer — envoyés par email chaque semaine.',
  },
  {
    iconKey: 'flag' as const,
    color: 'text-blue-600',
    bg: 'bg-blue-50',
    title: '100% québécois',
    description: 'Contenu en français, conforme au curriculum du secondaire québécois (Sec 1 à Sec 5).',
  },
]

const STEPS = [
  { num: '1', title: 'Créez votre compte parent', desc: 'Inscription en 30 secondes, aucune carte de crédit requise.' },
  { num: '2', title: 'Ajoutez votre enfant', desc: 'Un test de positionnement identifie son niveau exact en Maths et Français.' },
  { num: '3', title: 'Suivez la progression', desc: 'Rapport hebdomadaire par email avec les points forts et les axes à améliorer.' },
]

const STATS = [
  { value: '150+', label: 'exercices disponibles' },
  { value: 'Sec 1', label: 'curriculum PFEQ' },
  { value: '2 min', label: 'pour commencer' },
  { value: '100%', label: 'gratuit pour démarrer' },
]

export default function HomePage() {
  return (
    <div className="min-h-screen bg-white">

      {/* ── Nav ── */}
      <nav className="sticky top-0 z-50 bg-white/80 backdrop-blur-md border-b border-gray-100 px-4 md:px-10 py-3 md:py-4 flex items-center justify-between">
        {/* Logo */}
        <div className="flex items-center gap-1.5 min-w-0">
          <span className="text-base sm:text-xl font-extrabold text-indigo-600 tracking-tight whitespace-nowrap">Eva Étude</span>
          <span className="hidden sm:inline text-xs bg-indigo-100 text-indigo-700 font-bold px-2 py-0.5 rounded-full shrink-0">Québec</span>
        </div>

        {/* Liens desktop uniquement */}
        <div className="hidden md:flex items-center gap-8 text-sm text-gray-500 font-medium">
          <a href="#fonctionnalites" className="hover:text-gray-900 transition-colors">Fonctionnalités</a>
          <a href="#comment-ca-marche" className="hover:text-gray-900 transition-colors">Comment ça marche</a>
          <Link href="/premium" className="hover:text-indigo-600 transition-colors">Tarifs</Link>
        </div>

        {/* Boutons */}
        <div className="flex items-center gap-2 shrink-0">
          {/* "Se connecter" caché sur très petit écran */}
          <Link href="/auth/login" className="hidden sm:block text-sm text-gray-600 hover:text-gray-900 font-semibold transition-colors whitespace-nowrap">
            Se connecter
          </Link>
          <Link
            href="/auth/signup"
            className="text-sm font-bold px-3 sm:px-5 py-2 sm:py-2.5 rounded-xl text-white transition-all hover:scale-105 hover:shadow-lg whitespace-nowrap"
            style={{ background: 'linear-gradient(135deg, #4f46e5, #7c3aed)' }}
          >
            <span className="sm:hidden">Commencer →</span>
            <span className="hidden sm:inline">Essai gratuit →</span>
          </Link>
        </div>
      </nav>

      {/* ── Hero ── */}
      <section className="relative overflow-hidden">
        {/* Gradient de fond */}
        <div className="absolute inset-0 pointer-events-none" style={{
          background: 'radial-gradient(ellipse 80% 60% at 50% -10%, #eef2ff 0%, transparent 70%)'
        }} />
        <div className="absolute top-20 left-10 w-72 h-72 rounded-full opacity-10 blur-3xl pointer-events-none"
          style={{ background: '#4f46e5' }} />
        <div className="absolute top-40 right-10 w-96 h-96 rounded-full opacity-10 blur-3xl pointer-events-none"
          style={{ background: '#7c3aed' }} />

        <div className="relative max-w-5xl mx-auto px-6 md:px-10 pt-20 pb-28 text-center">
          {/* Badge */}
          <div className="inline-flex items-center gap-2 bg-white border border-indigo-100 shadow-sm text-indigo-700 text-sm font-semibold px-4 py-2 rounded-full mb-8">
            <span className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse" />
            Plateforme éducative adaptative · Secondaire québécois
          </div>

          {/* Titre */}
          <h1 className="text-3xl sm:text-5xl md:text-7xl font-extrabold text-gray-900 leading-[1.1] tracking-tight mb-6">
            Savoir exactement<br />où en est votre enfant.
          </h1>

          <p className="text-xl md:text-2xl font-semibold mb-3" style={{
            background: 'linear-gradient(135deg, #4f46e5 0%, #7c3aed 50%, #a855f7 100%)',
            WebkitBackgroundClip: 'text',
            WebkitTextFillColor: 'transparent',
            backgroundClip: 'text',
          }}>
            Pas une note. Une vraie progression.
          </p>

          <p className="text-lg text-gray-500 mb-10 max-w-xl mx-auto leading-relaxed">
            Exercices personnalisés basés sur le PFEQ, suivi en temps réel
            et rapports hebdomadaires — pour les parents qui veulent vraiment comprendre.
          </p>

          {/* CTAs */}
          <div className="flex flex-col sm:flex-row items-center justify-center gap-4 mb-16">
            <Link
              href="/auth/signup"
              className="w-full sm:w-auto font-bold px-8 py-4 rounded-2xl text-white text-base shadow-xl hover:shadow-2xl transition-all hover:scale-105"
              style={{ background: 'linear-gradient(135deg, #4f46e5, #7c3aed)' }}
            >
              Commencer gratuitement →
            </Link>
            <Link
              href="/auth/login"
              className="w-full sm:w-auto border-2 border-gray-200 text-gray-700 font-semibold px-8 py-4 rounded-2xl hover:border-indigo-200 hover:bg-indigo-50 transition-all text-base"
            >
              J'ai déjà un compte
            </Link>
          </div>

          {/* Stats */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 max-w-3xl mx-auto">
            {STATS.map((s) => (
              <div key={s.label} className="bg-white/80 backdrop-blur border border-gray-100 rounded-2xl p-4 shadow-sm">
                <p className="text-2xl font-extrabold text-indigo-600">{s.value}</p>
                <p className="text-xs text-gray-500 font-medium mt-0.5">{s.label}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ── Matières ── */}
      <section className="bg-gradient-to-b from-gray-50 to-white py-14">
        <div className="max-w-5xl mx-auto px-6 md:px-10">
          <p className="text-center text-xs font-bold text-gray-400 uppercase tracking-widest mb-8">
            Matières disponibles
          </p>
          <div className="flex flex-wrap justify-center gap-4">
            <div className="flex items-center gap-3 bg-white border-2 border-indigo-100 rounded-2xl px-7 py-4 shadow-sm hover:shadow-md transition-shadow">
              <span className="text-2xl">🔢</span>
              <span className="font-bold text-gray-800">Mathématiques</span>
              <span className="text-xs bg-indigo-100 text-indigo-700 font-bold px-2 py-0.5 rounded-full">Sec 1</span>
            </div>
            <div className="flex items-center gap-3 bg-white border-2 border-violet-100 rounded-2xl px-7 py-4 shadow-sm hover:shadow-md transition-shadow">
              <span className="text-2xl">📖</span>
              <span className="font-bold text-gray-800">Français</span>
              <span className="text-xs bg-violet-100 text-violet-700 font-bold px-2 py-0.5 rounded-full">Sec 1</span>
            </div>
            <div className="flex items-center gap-3 bg-white border-2 border-dashed border-gray-200 rounded-2xl px-7 py-4 text-gray-400">
              <span className="text-2xl">🔬</span>
              <span className="font-semibold">Sciences</span>
              <span className="text-xs bg-gray-100 text-gray-400 font-bold px-2 py-0.5 rounded-full">Bientôt</span>
            </div>
          </div>
        </div>
      </section>

      {/* ── Fonctionnalités ── */}
      <section id="fonctionnalites" className="max-w-5xl mx-auto px-6 md:px-10 py-24">
        <div className="text-center mb-14">
          <p className="text-xs font-bold text-indigo-600 uppercase tracking-widest mb-3">Fonctionnalités</p>
          <h2 className="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4">
            Tout ce qu'il faut pour progresser
          </h2>
          <p className="text-gray-500 max-w-xl mx-auto">
            Une plateforme complète pensée pour les élèves du secondaire québécois et leurs parents.
          </p>
        </div>
        <div className="grid sm:grid-cols-2 gap-6">
          {FEATURES.map((f) => (
            <div
              key={f.title}
              className="group bg-white border border-gray-100 rounded-2xl p-7 shadow-sm hover:shadow-xl transition-all duration-300 hover:-translate-y-1"
            >
              <div className={`inline-flex items-center justify-center w-12 h-12 rounded-xl ${f.bg} ${f.color} mb-5`}>
                {FEATURE_ICONS[f.iconKey]}
              </div>
              <h3 className="font-extrabold text-gray-900 text-lg mb-2">{f.title}</h3>
              <p className="text-gray-500 text-sm leading-relaxed">{f.description}</p>
            </div>
          ))}
        </div>
      </section>

      {/* ── Comment ça marche ── */}
      <section id="comment-ca-marche" className="py-24"
        style={{ background: 'linear-gradient(135deg, #f8f9ff 0%, #fefce8 100%)' }}>
        <div className="max-w-4xl mx-auto px-6 md:px-10">
          <div className="text-center mb-14">
            <p className="text-xs font-bold text-indigo-600 uppercase tracking-widest mb-3">Démarrage rapide</p>
            <h2 className="text-3xl md:text-4xl font-extrabold text-gray-900">
              Prêt en 2 minutes chrono
            </h2>
          </div>
          <div className="grid md:grid-cols-3 gap-8">
            {STEPS.map((s) => (
              <div key={s.num} className="text-center">
                <div
                  className="w-14 h-14 rounded-2xl text-white text-xl font-extrabold flex items-center justify-center mx-auto mb-5 shadow-lg"
                  style={{ background: 'linear-gradient(135deg, #4f46e5, #7c3aed)' }}
                >
                  {s.num}
                </div>
                <h3 className="font-extrabold text-gray-900 mb-2">{s.title}</h3>
                <p className="text-gray-500 text-sm leading-relaxed">{s.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ── CTA final ── */}
      <section className="py-24 relative overflow-hidden"
        style={{ background: 'linear-gradient(135deg, #4f46e5 0%, #7c3aed 50%, #a855f7 100%)' }}>
        <div className="absolute inset-0 pointer-events-none opacity-20"
          style={{ backgroundImage: 'radial-gradient(circle at 20% 50%, white 0%, transparent 50%), radial-gradient(circle at 80% 50%, white 0%, transparent 50%)' }} />
        <div className="relative max-w-2xl mx-auto px-6 md:px-10 text-center">
          <div className="text-5xl mb-6">🎓</div>
          <h2 className="text-3xl md:text-4xl font-extrabold text-white mb-4 leading-tight">
            Prêt à accompagner<br />la réussite de votre enfant ?
          </h2>
          <p className="text-indigo-200 mb-10 text-lg">
            Rejoignez des familles québécoises qui font confiance à Eva Étude
            pour le suivi scolaire de leur enfant.
          </p>
          <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
            <Link
              href="/auth/signup"
              className="w-full sm:w-auto bg-white font-extrabold text-indigo-600 px-8 py-4 rounded-2xl hover:bg-indigo-50 transition-all hover:scale-105 shadow-xl text-base"
            >
              Créer mon compte gratuit →
            </Link>
            <Link
              href="/premium"
              className="w-full sm:w-auto border-2 border-white/40 text-white font-semibold px-8 py-4 rounded-2xl hover:bg-white/10 transition-all text-base"
            >
              Voir les tarifs
            </Link>
          </div>
          <p className="text-indigo-300 text-sm mt-6">
            Gratuit pour commencer · Aucune carte de crédit requise
          </p>
        </div>
      </section>

      {/* ── Footer ── */}
      <footer className="border-t border-gray-100 px-6 md:px-10 py-8">
        <div className="max-w-5xl mx-auto flex flex-col md:flex-row items-center justify-between gap-4">
          <div className="flex items-center gap-2">
            <span className="font-extrabold text-indigo-600">Eva Étude</span>
            <span className="text-gray-300">·</span>
            <span className="text-sm text-gray-400">Plateforme éducative québécoise</span>
          </div>
          <div className="flex items-center gap-6 text-sm text-gray-400">
            <Link href="/premium" className="hover:text-gray-600 transition-colors">Tarifs</Link>
            <Link href="/politique-confidentialite" className="hover:text-gray-600 transition-colors">Confidentialité</Link>
            <a href="mailto:support@evaetude.ca" className="hover:text-gray-600 transition-colors">Support</a>
          </div>
          <p className="text-xs text-gray-400">© 2026 Eva Étude · Alignée sur le PFEQ</p>
        </div>
      </footer>

    </div>
  )
}
