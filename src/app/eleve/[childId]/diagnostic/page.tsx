'use client'

import { useState, useEffect, use } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'

// ── 36 questions de positionnement — 3 par compétence ──────────────────────
const DIAGNOSTIC = [
  {
    skillName: 'Nombres entiers',
    questions: [
      {
        q: 'Quel est le résultat de 48 ÷ 6 ?',
        opts: ['6', '7', '8', '9'],
        ans: 2,
      },
      {
        q: 'Lequel de ces entiers est le plus grand ?',
        opts: ['-3', '-7', '-1', '-5'],
        ans: 2,
      },
      {
        q: 'Combien font 15 × 12 ?',
        opts: ['170', '180', '165', '190'],
        ans: 1,
      },
    ],
  },
  {
    skillName: 'Fractions et décimaux',
    questions: [
      {
        q: '0,75 est égal à quelle fraction ?',
        opts: ['1/4', '3/4', '7/5', '3/5'],
        ans: 1,
      },
      {
        q: 'Quelle fraction est équivalente à 2/3 ?',
        opts: ['4/9', '6/9', '4/6', '3/4'],
        ans: 2,
      },
      {
        q: 'Quel est le résultat de 1/2 + 1/4 ?',
        opts: ['2/6', '3/4', '1/3', '2/8'],
        ans: 1,
      },
    ],
  },
  {
    skillName: 'Algèbre',
    questions: [
      {
        q: 'Si 2x + 3 = 11, quelle est la valeur de x ?',
        opts: ['3', '4', '5', '6'],
        ans: 1,
      },
      {
        q: 'Simplifie : 3a + 2b + 5a',
        opts: ['8a + 2b', '10ab', '8b + 2a', '5a + 2b'],
        ans: 0,
      },
      {
        q: 'Si y − 7 = 12, quelle est la valeur de y ?',
        opts: ['5', '17', '19', '18'],
        ans: 2,
      },
    ],
  },
  {
    skillName: 'Géométrie',
    questions: [
      {
        q: "Quelle est l'aire d'un rectangle de 5 cm × 8 cm ?",
        opts: ['26 cm²', '40 cm²', '13 cm²', '45 cm²'],
        ans: 1,
      },
      {
        q: "Combien un carré possède-t-il d'axes de symétrie ?",
        opts: ['2', '3', '4', '1'],
        ans: 2,
      },
      {
        q: "Quel est le périmètre d'un triangle équilatéral de côté 6 cm ?",
        opts: ['12 cm', '18 cm', '36 cm', '6 cm'],
        ans: 1,
      },
    ],
  },
  {
    skillName: 'Statistiques',
    questions: [
      {
        q: 'Quelle est la moyenne de : 4, 8, 6, 10 ?',
        opts: ['6', '7', '8', '9'],
        ans: 1,
      },
      {
        q: 'Quelle est la médiane de : 2, 5, 7, 9, 11 ?',
        opts: ['5', '6', '7', '9'],
        ans: 2,
      },
      {
        q: 'Dans un diagramme à bandes, la hauteur représente :',
        opts: ['La catégorie', 'La fréquence', 'La probabilité', 'La moyenne'],
        ans: 1,
      },
    ],
  },
  {
    skillName: 'Probabilités',
    questions: [
      {
        q: "On lance un dé à 6 faces. Probabilité d'obtenir un 4 ?",
        opts: ['1/4', '1/5', '1/6', '4/6'],
        ans: 2,
      },
      {
        q: '3 billes rouges et 2 bleues. Probabilité de tirer rouge ?',
        opts: ['2/5', '3/5', '1/3', '3/2'],
        ans: 1,
      },
      {
        q: "On lance une pièce. Probabilité d'obtenir face ?",
        opts: ['1/4', '1/3', '2/3', '1/2'],
        ans: 3,
      },
    ],
  },
  {
    skillName: 'Grammaire',
    questions: [
      {
        q: 'Dans « Le chat mange la souris », quel est le sujet ?',
        opts: ['mange', 'chat', 'Le chat', 'la souris'],
        ans: 2,
      },
      {
        q: 'Quel est le groupe nominal dans « La grande maison bleue » ?',
        opts: ['grande', 'maison', 'La grande maison bleue', 'bleue'],
        ans: 2,
      },
      {
        q: 'Quelle est la fonction de « rapidement » dans « Il court rapidement » ?',
        opts: ['Sujet', 'Complément du nom', 'Attribut du sujet', 'Compl. circ. de manière'],
        ans: 3,
      },
    ],
  },
  {
    skillName: 'Conjugaison',
    questions: [
      {
        q: 'Quel est le temps de « Nous mangions souvent ici » ?',
        opts: ['Présent', 'Imparfait', 'Passé composé', 'Futur'],
        ans: 1,
      },
      {
        q: 'Conjugue « finir » au présent, 2e personne du pluriel :',
        opts: ['finissons', 'finissez', 'finissent', 'finis'],
        ans: 1,
      },
      {
        q: 'Le participe passé de « venir » est :',
        opts: ['venu', 'venir', 'venait', 'viens'],
        ans: 0,
      },
    ],
  },
  {
    skillName: 'Orthographe',
    questions: [
      {
        q: 'Quelle orthographe est correcte ?',
        opts: ['les cheval', 'les chevals', 'les chevaux', 'les chevauls'],
        ans: 2,
      },
      {
        q: "Complète : « Elle s'est ___ les mains. » (laver)",
        opts: ['lavé', 'lavée', 'lavés', 'lavées'],
        ans: 0,
      },
      {
        q: 'Quel homophone est correct ? « Il ___ parti tôt. »',
        opts: ['est', 'et', 'ai', 'ait'],
        ans: 0,
      },
    ],
  },
  {
    skillName: 'Vocabulaire',
    questions: [
      {
        q: 'Quel est le synonyme de « heureux » ?',
        opts: ['triste', 'joyeux', 'fatigué', 'fâché'],
        ans: 1,
      },
      {
        q: 'Quel est l\'antonyme de « rapide » ?',
        opts: ['vite', 'agile', 'lent', 'fort'],
        ans: 2,
      },
      {
        q: 'Que signifie le préfixe « inter- » dans « international » ?',
        opts: ['en dessous', 'entre', 'au-dessus', 'avant'],
        ans: 1,
      },
    ],
  },
  {
    skillName: 'Compréhension de texte',
    questions: [
      {
        q: '« Le loup, affamé et épuisé, cherchait une proie. » Quel est l\'état du loup ?',
        opts: ['En pleine forme', 'Fatigué et qui a faim', 'Reposé', 'Content'],
        ans: 1,
      },
      {
        q: 'À quoi sert principalement le titre d\'un texte ?',
        opts: ['Donner la conclusion', 'Indiquer le sujet principal', 'Lister les personnages', 'Expliquer la morale'],
        ans: 1,
      },
      {
        q: '« Il pleuvait des cordes. Marie prit son parapluie. » Pourquoi ?',
        opts: ['Pour se protéger du soleil', 'Par habitude', "Parce qu'il pleut beaucoup", "Pour faire de l'ombre"],
        ans: 2,
      },
    ],
  },
  {
    skillName: 'Rédaction',
    questions: [
      {
        q: 'Un texte bien structuré comprend :',
        opts: ['Seulement une introduction', 'Une intro, un développement et une conclusion', 'Seulement des paragraphes', 'Un titre et une conclusion'],
        ans: 1,
      },
      {
        q: 'Quel mot de liaison indique une cause ?',
        opts: ['Donc', 'Ensuite', 'Car', 'Puis'],
        ans: 2,
      },
      {
        q: "Pour relier deux phrases qui s'opposent, on utilise :",
        opts: ['et', 'car', 'mais', 'donc'],
        ans: 2,
      },
    ],
  },
]

// Aplatir pour navigation linéaire
const ALL_QUESTIONS = DIAGNOSTIC.flatMap((skill, si) =>
  skill.questions.map((q, qi) => ({
    ...q,
    skillName: skill.skillName,
    skillIdx: si,
    localIdx: qi,
    globalIdx: si * 3 + qi,
  }))
)
const TOTAL = ALL_QUESTIONS.length // 36

export default function DiagnosticPage({
  params,
}: {
  params: Promise<{ childId: string }>
}) {
  const router = useRouter()
  const { childId } = use(params)

  const [skills, setSkills] = useState<{ id: string; name: string }[]>([])
  const [current, setCurrent] = useState(0)
  const [answers, setAnswers] = useState<(number | null)[]>(Array(TOTAL).fill(null))
  const [selected, setSelected] = useState<number | null>(null)
  const [revealed, setRevealed] = useState(false)
  const [loading, setLoading] = useState(true)
  const [submitting, setSubmitting] = useState(false)
  const [done, setDone] = useState(false)
  const [unlockedCount, setUnlockedCount] = useState(0)
  const [started, setStarted] = useState(false)

  useEffect(() => {
    const supabase = createClient()
    supabase
      .from('skills')
      .select('id, name')
      .eq('grade_level', 'sec1')
      .eq('is_active', true)
      .then(({ data }) => {
        setSkills(data ?? [])
        setLoading(false)
      })
  }, [])

  function handleSelect(idx: number) {
    if (revealed) return
    const newAnswers = [...answers]
    newAnswers[current] = idx
    setAnswers(newAnswers)
    setSelected(idx)
    setRevealed(true)
  }

  async function handleNext() {
    if (current < TOTAL - 1) {
      setCurrent((c) => c + 1)
      setSelected(null)
      setRevealed(false)
    } else {
      await finalize([...answers])
    }
  }

  async function finalize(finalAnswers: (number | null)[]) {
    setSubmitting(true)
    const supabase = createClient()

    const skillIdMap = new Map(skills.map((s) => [s.name, s.id]))
    const upserts: { child_id: string; skill_id: string; p_mastery: number }[] = []
    let unlocked = 0

    DIAGNOSTIC.forEach((skill, si) => {
      const skillId = skillIdMap.get(skill.skillName)
      if (!skillId) return
      let correct = 0
      skill.questions.forEach((q, qi) => {
        if (finalAnswers[si * 3 + qi] === q.ans) correct++
      })
      const mastery = correct >= 2 ? 0.65 : 0.15
      if (correct >= 2) unlocked++
      upserts.push({ child_id: childId, skill_id: skillId, p_mastery: mastery })
    })

    await supabase
      .from('knowledge_states')
      .upsert(upserts, { onConflict: 'child_id,skill_id' })

    setUnlockedCount(unlocked)
    setDone(true)
    setSubmitting(false)
  }

  // ── Loading ──────────────────────────────────────────────────────────────
  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <p className="text-gray-400">Préparation du test…</p>
      </div>
    )
  }

  // ── Écran d'accueil ──────────────────────────────────────────────────────
  if (!started) {
    return (
      <div
        className="min-h-screen flex items-center justify-center px-5"
        style={{ background: 'linear-gradient(145deg, #eef2ff 0%, #faf5ff 100%)' }}
      >
        <div className="bg-white rounded-3xl shadow-xl p-10 max-w-md w-full text-center">
          <div className="text-6xl mb-5">🎯</div>
          <h1 className="text-2xl font-extrabold text-gray-900 mb-3">
            Test de positionnement
          </h1>
          <p className="text-gray-500 mb-2 text-sm leading-relaxed">
            Réponds à <strong>36 questions rapides</strong> (3 par compétence) pour que
            l&apos;application personnalise ton parcours.
          </p>
          <p className="text-gray-400 text-xs mb-8">
            Les compétences que tu maîtrises déjà seront automatiquement débloquées.
          </p>
          <button
            onClick={() => setStarted(true)}
            className="w-full bg-indigo-600 text-white font-bold py-4 rounded-2xl hover:bg-indigo-700 transition-colors text-lg"
          >
            Commencer le test →
          </button>
        </div>
      </div>
    )
  }

  // ── Écran de résultats ───────────────────────────────────────────────────
  if (done) {
    return (
      <div
        className="min-h-screen flex items-center justify-center px-5"
        style={{ background: 'linear-gradient(145deg, #eef2ff 0%, #faf5ff 100%)' }}
      >
        <div className="bg-white rounded-3xl shadow-xl p-10 max-w-md w-full text-center">
          <div className="text-6xl mb-4">🎉</div>
          <h1 className="text-2xl font-extrabold text-gray-900 mb-2">
            Positionnement terminé !
          </h1>
          <div className="bg-indigo-50 rounded-2xl p-6 mb-6">
            <p className="text-5xl font-bold text-indigo-600 mb-1">{unlockedCount}</p>
            <p className="text-gray-600 text-sm">
              compétence{unlockedCount !== 1 ? 's' : ''} débloquée{unlockedCount !== 1 ? 's' : ''} sur 12
            </p>
          </div>
          <p className="text-gray-500 text-sm mb-8">
            {unlockedCount >= 6
              ? 'Excellent niveau ! Tu peux aller directement aux compétences avancées.'
              : 'Ton parcours est prêt — commence par les bases et progresse à ton rythme.'}
          </p>
          <button
            onClick={() => router.push(`/eleve/${childId}`)}
            className="w-full bg-indigo-600 text-white font-bold py-4 rounded-2xl hover:bg-indigo-700 transition-colors"
          >
            Voir mon parcours →
          </button>
        </div>
      </div>
    )
  }

  // ── Question ─────────────────────────────────────────────────────────────
  const q = ALL_QUESTIONS[current]
  const isCorrect = selected !== null && selected === q.ans
  const progress = ((current + 1) / TOTAL) * 100

  return (
    <div
      className="min-h-screen"
      style={{ background: 'linear-gradient(145deg, #eef2ff 0%, #faf5ff 100%)' }}
    >
      {/* Barre de progression */}
      <div className="bg-white/80 backdrop-blur border-b border-gray-100 px-5 py-3">
        <div className="max-w-xl mx-auto flex items-center gap-4">
          <span className="text-xs font-semibold text-indigo-500 shrink-0">
            Test de positionnement
          </span>
          <div className="flex-1 bg-gray-100 rounded-full h-2">
            <div
              className="bg-indigo-500 h-2 rounded-full transition-all duration-300"
              style={{ width: `${progress}%` }}
            />
          </div>
          <span className="text-xs text-gray-400 shrink-0">
            {current + 1} / {TOTAL}
          </span>
        </div>
      </div>

      <main className="max-w-xl mx-auto px-5 py-8">
        {/* Badge compétence */}
        <div className="mb-5">
          <span className="inline-block bg-indigo-100 text-indigo-700 text-xs font-bold px-3 py-1.5 rounded-full uppercase tracking-wide">
            {q.skillName}
          </span>
          <span className="ml-2 text-xs text-gray-400">
            Question {q.localIdx + 1}/3
          </span>
        </div>

        {/* Question */}
        <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-7 mb-5">
          <h2 className="text-lg font-bold text-gray-900 leading-snug mb-6">
            {q.q}
          </h2>

          {/* Options */}
          <div className="space-y-3">
            {q.opts.map((opt, i) => {
              let cls =
                'w-full text-left px-5 py-4 rounded-xl border-2 font-medium transition-all text-sm '

              if (!revealed) {
                cls += 'border-gray-200 bg-white hover:border-indigo-400 hover:bg-indigo-50 text-gray-800'
              } else if (i === q.ans) {
                cls += 'border-green-500 bg-green-50 text-green-800'
              } else if (i === selected && i !== q.ans) {
                cls += 'border-red-400 bg-red-50 text-red-700'
              } else {
                cls += 'border-gray-100 bg-gray-50 text-gray-400'
              }

              return (
                <button
                  key={i}
                  onClick={() => handleSelect(i)}
                  disabled={revealed}
                  className={cls}
                >
                  <span className="flex items-center gap-2">
                    {revealed && i === q.ans && <span>✅</span>}
                    {revealed && i === selected && i !== q.ans && <span>❌</span>}
                    {opt}
                  </span>
                </button>
              )
            })}
          </div>
        </div>

        {/* Feedback + bouton suivant */}
        {revealed && (
          <>
            <div
              className={`rounded-xl px-5 py-3 mb-4 text-sm font-medium ${
                isCorrect
                  ? 'bg-green-50 text-green-700 border border-green-200'
                  : 'bg-red-50 text-red-700 border border-red-200'
              }`}
            >
              {isCorrect ? '🎉 Bonne réponse !' : `La bonne réponse était : ${q.opts[q.ans]}`}
            </div>

            <button
              onClick={handleNext}
              disabled={submitting}
              className="w-full bg-indigo-600 text-white font-bold py-3.5 rounded-xl hover:bg-indigo-700 transition-colors disabled:opacity-60"
            >
              {submitting
                ? 'Calcul en cours…'
                : current === TOTAL - 1
                ? 'Voir mes résultats →'
                : 'Question suivante →'}
            </button>
          </>
        )}
      </main>
    </div>
  )
}
