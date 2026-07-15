import Link from 'next/link'

export const metadata = {
  title: 'Politique de confidentialité & Conditions d\'utilisation — EducaPlus',
}

export default function PolitiqueConfidentialitePage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* En-tête */}
      <div style={{ background: 'linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%)' }} className="py-12 px-6">
        <div className="max-w-3xl mx-auto">
          <Link href="/" className="text-white/70 text-sm hover:text-white mb-4 inline-block">
            ← Retour à l&apos;accueil
          </Link>
          <h1 className="text-3xl font-extrabold text-white mb-2">
            Politique de confidentialité
          </h1>
          <p className="text-white/70 text-sm">
            Dernière mise à jour : 12 juillet 2026 · Conforme à la Loi 25 (Québec)
          </p>
        </div>
      </div>

      {/* Contenu */}
      <div className="max-w-3xl mx-auto px-6 py-12 space-y-10">

        {/* Intro */}
        <div className="bg-indigo-50 border border-indigo-100 rounded-2xl p-5">
          <p className="text-sm text-indigo-800 leading-relaxed">
            EducaPlus s&apos;engage à protéger la vie privée de vos enfants et la vôtre.
            Cette politique explique quelles informations nous collectons, pourquoi,
            et comment vous pouvez exercer vos droits conformément à la{' '}
            <strong>Loi sur la protection des renseignements personnels dans le secteur privé</strong>{' '}
            (Loi 25, Québec).
          </p>
        </div>

        <Section title="1. Responsable de la protection des renseignements personnels">
          <p>
            La personne responsable de la protection des renseignements personnels au sein d&apos;EducaPlus est
            le fondateur et administrateur principal. Pour toute question, vous pouvez nous contacter à :
          </p>
          <div className="bg-gray-100 rounded-xl p-4 mt-3 text-sm font-mono">
            confidentialite@evaetude.ca
          </div>
        </Section>

        <Section title="2. Renseignements personnels collectés">
          <p>Nous collectons uniquement les informations nécessaires au fonctionnement du service :</p>
          <TableLoi25
            rows={[
              ['Compte parent', 'Prénom, nom, adresse courriel, mot de passe (chiffré)', 'Création et gestion du compte'],
              ['Profil enfant', 'Prénom, niveau scolaire', 'Personnalisation des exercices'],
              ['Données d\'apprentissage', 'Réponses aux exercices, scores, temps de session', 'Adaptation pédagogique (algorithme BKT)'],
              ['Données de paiement', 'Gérées exclusivement par Stripe — nous ne stockons aucun numéro de carte', 'Abonnement Premium'],
              ['Données techniques', 'Adresse IP, type de navigateur, cookies de session', 'Sécurité et fonctionnement'],
            ]}
          />
        </Section>

        <Section title="3. Finalités de la collecte">
          <ul className="list-disc list-inside space-y-1 text-gray-700 text-sm">
            <li>Fournir le service d&apos;apprentissage adaptatif</li>
            <li>Générer les rapports hebdomadaires pour les parents</li>
            <li>Améliorer la qualité pédagogique de la plateforme</li>
            <li>Gérer les abonnements et la facturation</li>
            <li>Assurer la sécurité et prévenir la fraude</li>
          </ul>
          <p className="mt-3 text-sm text-gray-600">
            Nous n&apos;utilisons jamais les données de vos enfants à des fins publicitaires
            et ne les vendons à aucun tiers.
          </p>
        </Section>

        <Section title="4. Durée de conservation">
          <TableLoi25
            rows={[
              ['Données de compte', '3 ans après la dernière connexion, puis suppression automatique'],
              ['Données d\'apprentissage', 'Durée de l\'abonnement + 1 an'],
              ['Données de paiement', 'Selon les obligations légales fiscales (7 ans — Stripe)'],
              ['Logs techniques', '90 jours'],
            ]}
            cols={['Type de donnée', 'Durée de conservation']}
          />
        </Section>

        <Section title="5. Partage avec des tiers">
          <p>Nous partageons des données uniquement avec les sous-traitants nécessaires au service :</p>
          <TableLoi25
            rows={[
              ['Supabase (USA/Canada)', 'Hébergement de la base de données', 'Accord de traitement des données'],
              ['Stripe (USA)', 'Paiements en ligne', 'Certifié PCI-DSS'],
              ['Vercel (USA)', 'Hébergement de l\'application web', 'Accord de traitement des données'],
              ['Resend (USA)', 'Envoi des courriels hebdomadaires', 'Accord de traitement des données'],
            ]}
            cols={['Fournisseur', 'Usage', 'Garantie']}
          />
          <p className="mt-3 text-sm text-gray-600">
            Ces fournisseurs agissent uniquement selon nos instructions et ne peuvent
            pas utiliser vos données à d&apos;autres fins.
          </p>
        </Section>

        <Section title="6. Protection des mineurs">
          <div className="bg-amber-50 border border-amber-200 rounded-xl p-4 text-sm text-amber-800">
            <strong>Les profils enfants ne contiennent pas de données permettant d&apos;identifier
            directement un mineur</strong> (pas de photo, pas de nom complet obligatoire, pas
            de localisation). Seul le parent titulaire du compte peut créer, modifier ou supprimer
            un profil enfant.
          </div>
        </Section>

        <Section title="7. Vos droits (Loi 25)">
          <p>En tant que résident du Québec, vous avez le droit de :</p>
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 mt-3">
            {[
              { titre: 'Accès', desc: 'Obtenir une copie de vos données personnelles' },
              { titre: 'Rectification', desc: 'Corriger des informations inexactes' },
              { titre: 'Suppression', desc: 'Demander la suppression de votre compte et données' },
              { titre: 'Portabilité', desc: 'Recevoir vos données dans un format lisible' },
              { titre: 'Retrait du consentement', desc: 'Retirer votre consentement en tout temps' },
              { titre: 'Plainte', desc: 'Déposer une plainte auprès de la CAI' },
            ].map(d => (
              <div key={d.titre} className="bg-white border border-gray-100 rounded-xl p-3">
                <p className="font-semibold text-sm text-gray-800 mb-0.5">{d.titre}</p>
                <p className="text-xs text-gray-500">{d.desc}</p>
              </div>
            ))}
          </div>
          <p className="mt-4 text-sm text-gray-600">
            Pour exercer vos droits, écrivez-nous à{' '}
            <a href="mailto:confidentialite@evaetude.ca" className="text-indigo-600 underline">
              confidentialite@evaetude.ca
            </a>
            . Nous répondrons dans un délai de 30 jours.
          </p>
        </Section>

        <Section title="8. Cookies">
          <p>
            EducaPlus utilise uniquement des cookies techniques essentiels au fonctionnement
            de la plateforme (session d&apos;authentification). Nous n&apos;utilisons pas de
            cookies publicitaires ni de traceurs tiers.
          </p>
        </Section>

        <Section title="9. Sécurité">
          <ul className="list-disc list-inside space-y-1 text-sm text-gray-700">
            <li>Données chiffrées en transit (HTTPS / TLS 1.3)</li>
            <li>Mots de passe hachés (bcrypt via Supabase Auth)</li>
            <li>Accès à la base de données restreint par Row Level Security (RLS)</li>
            <li>Clés d&apos;API jamais exposées côté client</li>
          </ul>
        </Section>

        <Section title="10. Modifications de cette politique">
          <p>
            En cas de modification importante, nous vous en informerons par courriel
            au moins 30 jours avant l&apos;entrée en vigueur. La date de dernière mise à
            jour est indiquée en haut de cette page.
          </p>
        </Section>

        {/* Conditions d'utilisation */}
        <div className="border-t border-gray-200 pt-10">
          <h2 className="text-2xl font-extrabold text-gray-900 mb-6">Conditions d&apos;utilisation</h2>

          <div className="space-y-6 text-sm text-gray-700 leading-relaxed">
            <div>
              <h3 className="font-bold text-gray-800 mb-1">1. Accès au service</h3>
              <p>EducaPlus est réservé aux parents résidant au Canada souhaitant soutenir l&apos;apprentissage
              de leurs enfants du niveau primaire et secondaire. L&apos;inscription est gratuite pour les
              3 premières compétences. L&apos;accès complet requiert un abonnement Premium.</p>
            </div>

            <div>
              <h3 className="font-bold text-gray-800 mb-1">2. Compte et responsabilités</h3>
              <p>Le titulaire du compte (parent ou tuteur légal) est responsable de la confidentialité
              de ses identifiants et de l&apos;utilisation faite par les enfants associés au compte.</p>
            </div>

            <div>
              <h3 className="font-bold text-gray-800 mb-1">3. Propriété intellectuelle</h3>
              <p>L&apos;ensemble du contenu pédagogique, des algorithmes, des textes et des interfaces
              d&apos;EducaPlus est la propriété exclusive d&apos;EducaPlus. Toute reproduction sans autorisation est interdite.</p>
            </div>

            <div>
              <h3 className="font-bold text-gray-800 mb-1">4. Abonnement et remboursement</h3>
              <p>Les abonnements sont mensuels ou annuels, renouvelés automatiquement. Vous pouvez
              annuler à tout moment via votre espace client. Aucun remboursement partiel n&apos;est
              accordé pour la période déjà facturée, sauf obligation légale.</p>
            </div>

            <div>
              <h3 className="font-bold text-gray-800 mb-1">5. Limitation de responsabilité</h3>
              <p>EducaPlus est un outil de soutien scolaire et ne remplace pas l&apos;enseignement en classe
              ni le suivi d&apos;un professionnel de l&apos;éducation. Nous ne garantissons pas de résultats
              scolaires spécifiques.</p>
            </div>

            <div>
              <h3 className="font-bold text-gray-800 mb-1">6. Droit applicable</h3>
              <p>Ces conditions sont régies par les lois de la province de Québec et du Canada.
              Tout litige sera soumis aux tribunaux compétents du Québec.</p>
            </div>
          </div>
        </div>

        {/* Footer */}
        <div className="bg-gray-100 rounded-2xl p-5 text-center text-sm text-gray-500">
          <p>Des questions ? Contactez-nous à{' '}
            <a href="mailto:confidentialite@evaetude.ca" className="text-indigo-600 underline">
              confidentialite@evaetude.ca
            </a>
          </p>
          <p className="mt-1">Commission d&apos;accès à l&apos;information du Québec (CAI) :{' '}
            <a href="https://www.cai.gouv.qc.ca" target="_blank" rel="noopener noreferrer"
              className="text-indigo-600 underline">cai.gouv.qc.ca</a>
          </p>
        </div>

      </div>
    </div>
  )
}

// ── Composants internes ────────────────────────────────────────────────────

function Section({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <section>
      <h2 className="text-lg font-extrabold text-gray-900 mb-3 pb-2 border-b border-gray-100">{title}</h2>
      <div className="text-sm text-gray-700 leading-relaxed space-y-2">{children}</div>
    </section>
  )
}

function TableLoi25({
  rows,
  cols = ['Donnée', 'Contenu', 'Finalité'],
}: {
  rows: string[][]
  cols?: string[]
}) {
  return (
    <div className="overflow-x-auto mt-3">
      <table className="w-full text-xs border-collapse">
        <thead>
          <tr className="bg-gray-100">
            {cols.map(c => (
              <th key={c} className="text-left px-3 py-2 font-semibold text-gray-600 border border-gray-200">{c}</th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.map((row, i) => (
            <tr key={i} className={i % 2 === 0 ? 'bg-white' : 'bg-gray-50'}>
              {row.map((cell, j) => (
                <td key={j} className="px-3 py-2 border border-gray-200 text-gray-700">{cell}</td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
