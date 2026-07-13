# PRD — Éduc+ : Plateforme éducative adaptative pour le secondaire québécois
**Version 2.0 — Juillet 2026**
**Basé sur : analyse de 12 plateformes concurrentes (QC, FR, GB) + état actuel du produit**

---

## 1. Contexte & état actuel

### Ce qu'on a déjà construit ✅
| Fonctionnalité | État |
|---|---|
| Auth parent (login / signup / logout) | ✅ Fait |
| Dashboard parent + gestion des enfants | ✅ Fait |
| Interface élève `/eleve/[childId]` | ✅ Fait |
| Test de positionnement 36 questions (1er login) | ✅ Fait |
| BKT (Bayesian Knowledge Tracing) — maîtrise 0→1 | ✅ Fait |
| Verrouillage progressif des compétences (BKT ≥ 0.65) | ✅ Fait |
| Étoiles ⭐⭐⭐ au lieu de % brut | ✅ Fait |
| Freemium — thèmes 4-6 verrouillés plan gratuit | ✅ Fait |
| Sessions 25 questions, anti-répétition 60 jours | ✅ Fait |
| Banque de 1 800 questions, 12 compétences, Sec 1 PFEQ | ✅ Fait |
| Consentement Loi 25 (vie privée Québec) | ✅ Fait |
| Bannière hors-ligne (offline detection) | ✅ Fait |
| Page admin gestion des questions | ✅ Fait |
| Landing page | ✅ Fait |
| Rapport parent par enfant | ✅ Fait |

---

## 2. Analyse concurrentielle

### 2.1 Plateformes Québec

| Plateforme | Forces | Faiblesses identifiées |
|---|---|---|
| **Alloprof** | Gratuit, très connu au QC, aide aux devoirs humaine, vidéos | Pas d'IA adaptative, pas de suivi de progression structuré, interface vieillissante, pas de gamification |
| **Netmath** | Adaptatif en maths, aligné PFEQ | Seulement les maths, pas le français, coûteux |
| **Khan Academy (fr)** | Adaptatif, gratuit, 120M utilisateurs | Pas aligné PFEQ précisément, interface froide, manque de gamification pour les jeunes ados |

### 2.2 Plateformes France

| Plateforme | Forces | Faiblesses identifiées |
|---|---|---|
| **Schoolmouv** | Vidéos engageantes, résumés concis (4.3/5 Trustpilot) | Contenu **passif** (vidéos seulement), désabonnement difficile, prélèvements non désirés |
| **Kartable** | Structuré, IA intégrée (assistant Alfa), 200+ enseignants (4.1/5) | Interface attrayante mais contenu parfois pauvre, IA ne remplace pas le prof humain |
| **Maxicours** | Large catalogue | Note **2.6/5** Trustpilot — UX médiocre, contenu daté |
| **Lumni** | Gratuit, audiovisuel public, maternelle → lycée | Pas interactif, pas de suivi de progression, pas adaptatif |
| **Wiloki** | Tableau de bord parent, 6-14 ans, maths + français + anglais | Moins connu, contenu limité |

### 2.3 Plateformes Grande-Bretagne

| Plateforme | Forces | Faiblesses identifiées |
|---|---|---|
| **BBC Bitesize** | Gratuit, curriculum UK complet, trusted brand | Pas adaptatif, pas de suivi de progression, contenu passif |
| **MyMaths** | Utilisé dans 4 000+ écoles | **1.3/5 Trustpilot** — "depression creating", réponses correctes marquées fausses, UX catastrophique, aucun engagement |
| **Mathletics** | Compétitions en direct, curriculum UK | Seulement les maths, gamification superficielle |
| **Third Space Learning** | 1-à-1 personnalisé, 4 100+ écoles | Très coûteux, pas scalable pour le grand public |
| **IXL** | Adaptatif, analytiques riches, parcours personnalisés | Interface austère pour les enfants, abonnement cher |

### 2.4 Faiblesses communes — opportunités pour Éduc+

1. **Gamification absente ou superficielle** — MyMaths (1.3/5), Maxicours (2.6/5) prouvent que l'engagement est le facteur #1 d'abandon
2. **Rapport parent insuffisant** — les parents ne voient pas les progrès en temps réel avec des métriques claires
3. **Contenu non adapté au curriculum local** — Khan Academy / BBC Bitesize ne sont pas alignés PFEQ
4. **Interface enfant rebutante** — aucune célébration, aucun son, aucune animation de victoire
5. **Désabonnement frustrant** — Schoolmouv critiqué pour facturation abusive
6. **Pas d'objectifs à court terme** — les élèves ne savent pas pourquoi revenir demain
7. **Contenu uniquement passif** (vidéos) sans pratique interactive adaptative
8. **Pas de mode révision** après une mauvaise session
9. **Pas de streak / habitude quotidienne** encouragée
10. **Zéro aspect social** — aucune compétition amicale ni défi entre pairs

---

## 3. Positionnement d'Éduc+

> **Éduc+ est la seule plateforme adaptative gamifiée alignée sur le PFEQ québécois, conçue pour les élèves du secondaire, avec un suivi parental en temps réel et une conformité totale à la Loi 25.**

### Avantage concurrentiel clé
- **BKT réel** (pas du scoring simple) → seul Netmath s'en approche, mais seulement en maths
- **PFEQ Sec 1** exact → ni Alloprof ni Khan Academy ne l'offrent en mode adaptatif complet
- **Rapport parent** structuré par compétence → Alloprof ne l'a pas du tout
- **Conformité Loi 25** → aucun concurrent québécois ne l'affiche explicitement

---

## 4. Fonctionnalités à construire (backlog priorisé)

### 🔴 PRIORITÉ 1 — Engagement & rétention (impact direct sur abandon)

#### F1 — Système XP et niveaux
**Problème résolu :** Les élèves quittent après 2 sessions car il n'y a pas de progression visible au-delà des étoiles.
**Solution :**
- Chaque bonne réponse = +10 XP, mauvaise = +3 XP (pour encourager la tentative)
- Bonus combo : 3 bonnes d'affilée = +15 XP
- Niveaux : Apprenti (0) → Explorer (500) → Découvreur (1500) → Champion (3000) → Expert (6000) → Maître PFEQ (10000)
- Barre XP visible en haut de l'interface élève et dans la session
- Table : `xp_log (child_id, amount, reason, created_at)` + colonne `total_xp` dans `children`

#### F2 — Streak quotidien 🔥
**Problème résolu :** Alloprof, Schoolmouv, MyMaths n'ont aucun mécanisme de retour quotidien.
**Solution :**
- Flamme 🔥 affiché dans l'interface élève : "3 jours de suite !"
- Streak = nombre de jours consécutifs avec ≥ 1 session complétée
- Streak brisé → message encourageant (pas punitif) + bouton "Reprendre"
- Table : `streaks (child_id, current_streak, longest_streak, last_session_date)`

#### F3 — Badges et récompenses 🏅
**Problème résolu :** Aucun concurrent direct au QC n'a de système de badges aligné au curriculum.
**Badges suggérés :**
- 🌱 Premier pas (première session terminée)
- 🔥 7 jours de suite
- ⭐ Première étoile double (p_mastery ≥ 0.65)
- 🏆 Maître des maths (toutes les compétences maths ≥ ⭐⭐)
- 📖 Maître du français (toutes les compétences français ≥ ⭐⭐)
- 💎 Perfectionniste (session 100%)
- 🚀 Vitesse éclair (session < 8 min)
- Table : `badges (id, name, icon, description, condition_type, condition_value)` + `child_badges (child_id, badge_id, earned_at)`
- Affiché dans l'interface élève + rapport parent

#### F4 — Célébrations visuelles en session
**Problème résolu :** MyMaths est décrit comme "depression creating" — aucune émotion positive.
**Solution :**
- Animation confettis sur bonne réponse (CSS/Framer Motion)
- Son optionnel (toggle on/off dans les paramètres)
- Message aléatoire de félicitations : "Excellent ! 🎯", "Tu déchires ! 🔥", "Parfait !"
- Écran de résultats enrichi : niveau XP gagné + badges débloqués + partage optionnel

---

### 🟠 PRIORITÉ 2 — Rapport parent renforcé (différenciateur clé)

#### F5 — Tableau de bord parent enrichi
**Problème résolu :** Alloprof n'a aucun rapport parent. Wiloki est le seul à le faire bien, mais pas au QC.
**Solution :**
- Graphique de progression par compétence sur 30/60/90 jours (recharts)
- Temps total d'étude cette semaine vs semaine précédente
- Nombre de sessions, taux de bonnes réponses global
- Compétence la plus forte / la plus faible
- Alerte automatique si enfant inactif > 7 jours
- Bouton "Envoyer un encouragement" → notifie l'enfant au prochain login

#### F6 — Rapport hebdomadaire par email
**Problème résolu :** Les parents de Schoolmouv se plaignent de ne pas savoir ce que fait leur enfant.
**Solution :**
- Email automatique chaque lundi matin (Supabase Edge Function + Resend)
- Contenu : progrès de la semaine, compétences améliorées, streak actuel, prochains objectifs
- Opt-in dans les paramètres parent (coché par défaut)

---

### 🟠 PRIORITÉ 3 — Couverture pédagogique élargie

#### F7 — Secondaire 2 (Sec 2)
**Problème résolu :** Après Sec 1, les élèves n'ont plus rien à faire sur Éduc+ → churn garanti.
**Compétences à ajouter (PFEQ Sec 2) :**
- **Maths** : Nombres réels, Équations du 1er degré, Géométrie analytique, Statistiques bivarées, Probabilités conditionnelles, Fonctions affines
- **Français** : Textes argumentatifs, Discours rapporté, Subjonctif, Figures de style avancées, Lecture littéraire, Techniques de rédaction avancées
- Même structure BKT, même système étoiles
- Test de positionnement Sec 2 (36 questions)

#### F8 — Mode révision après session
**Problème résolu :** Après une mauvaise session, l'élève ne sait pas quoi retravailler.
**Solution :**
- Bouton "Revoir mes erreurs" à l'écran de résultats
- Affiche chaque question ratée avec la bonne réponse + explication
- Option "Refaire ces questions" → mini-session de rattrapage (questions ratées seulement)

---

### 🟡 PRIORITÉ 4 — Monétisation & croissance

#### F9 — Page upgrade premium + paiement
**Problème résolu :** Le freemium existe dans le code mais il n'y a aucun flow de paiement.
**Solution :**
- Page `/premium` avec comparaison gratuit vs premium
- Intégration Stripe (checkout + webhooks → update `profiles.plan`)
- Plans : Mensuel 16,99$/mois / Annuel 149,99$/an (économie 26%)
- Essai gratuit 14 jours pour premium
- Email de confirmation + facture automatique

#### F10 — Déploiement Vercel + domaine
**Problème résolu :** La plateforme n'est pas en production.
**Solution :**
- Déployer sur Vercel (lier repo GitHub → Vercel)
- Variables d'environnement Supabase dans Vercel
- Domaine custom : educplus.ca (à acheter)
- HTTPS, CSP headers, performance audit Lighthouse ≥ 90

#### F11 — Page de tarification publique
- `/tarifs` claire avec FAQ
- Mention explicite : "Conforme Loi 25 · Données au Canada · Sans publicité"
- Testimonials parents (à collecter après beta)

---

### 🟢 PRIORITÉ 5 — Fonctionnalités différenciatrices avancées

#### F12 — Défis entre amis (mode social privé)
**Problème résolu :** Mathletics réussit grâce aux compétitions en direct — aucun concurrent QC ne l'a.
**Solution :**
- Système de code d'invitation (entre élèves du même parent OU amis)
- Défi hebdomadaire : qui gagne le plus de XP cette semaine ?
- Classement privé (jamais public, conforme Loi 25)
- Notification "Ton ami a dépassé ton score !"

#### F13 — Assistant pédagogique IA (Éduc+ IA)
**Problème résolu :** Kartable a lancé "Alfa" — l'IA dans la plateforme est un différenciateur fort en 2025-2026.
**Solution :**
- Bouton "Aide-moi 💡" sur chaque question → appel API Claude (Anthropic)
- L'IA explique la question différemment, ne donne pas la réponse directement
- Contexte : nom du skill, la question, les options → prompt structuré
- Limité à 5 aides/session pour plan gratuit, illimité en premium
- Log des aides utilisées pour analytics

#### F14 — Mode enseignant (B2B)
**Problème résolu :** Third Space Learning est coûteux pour les écoles. Éduc+ pourrait offrir une version école.
**Solution :**
- Interface enseignant : voir la progression de toute une classe
- Assigner des compétences spécifiques à des élèves
- Rapport de classe exportable (PDF/CSV)
- Licences école (à partir de 199$/classe/an)

---

## 5. Architecture technique — ajouts requis

### Nouvelles tables Supabase
```sql
-- XP et niveaux
ALTER TABLE children ADD COLUMN total_xp INT NOT NULL DEFAULT 0;
CREATE TABLE xp_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  child_id UUID REFERENCES children(id),
  amount INT NOT NULL,
  reason TEXT,  -- 'correct_answer', 'combo', 'session_complete', 'badge'
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Streaks
CREATE TABLE streaks (
  child_id UUID PRIMARY KEY REFERENCES children(id),
  current_streak INT NOT NULL DEFAULT 0,
  longest_streak INT NOT NULL DEFAULT 0,
  last_session_date DATE
);

-- Badges
CREATE TABLE badges (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  icon TEXT NOT NULL,
  description TEXT NOT NULL,
  condition_type TEXT NOT NULL,  -- 'sessions', 'streak', 'mastery', 'xp', 'score'
  condition_value INT NOT NULL
);
CREATE TABLE child_badges (
  child_id UUID REFERENCES children(id),
  badge_id UUID REFERENCES badges(id),
  earned_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (child_id, badge_id)
);

-- Défis entre amis
CREATE TABLE friend_challenges (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  challenger_child_id UUID REFERENCES children(id),
  challenged_child_id UUID REFERENCES children(id),
  week_start DATE NOT NULL,
  challenger_xp INT DEFAULT 0,
  challenged_xp INT DEFAULT 0,
  status TEXT DEFAULT 'active'  -- 'active', 'completed'
);
```

### Nouvelles pages Next.js
```
/premium              → Page upgrade + Stripe checkout
/tarifs               → Page publique tarification
/eleve/[childId]/badges    → Galerie de badges
/eleve/[childId]/classement → Défis amis
/enseignant/[classId]      → Interface enseignant (F14)
/api/webhooks/stripe       → Webhooks paiement
/api/ai/hint               → Route IA pour l'assistant
```

### Dépendances à ajouter
```bash
npm install stripe @stripe/stripe-js  # Paiement
npm install framer-motion              # Animations célébrations
npm install resend                     # Emails rapport hebdomadaire
npm install recharts                   # Graphiques rapport parent
```

---

## 6. Métriques de succès

| Métrique | Cible 6 mois | Cible 12 mois |
|---|---|---|
| Sessions/élève/semaine | ≥ 3 | ≥ 5 |
| Streak moyen | ≥ 4 jours | ≥ 7 jours |
| Taux de conversion gratuit→premium | ≥ 8% | ≥ 15% |
| Taux de rétention à 30 jours | ≥ 45% | ≥ 60% |
| NPS parent | ≥ 40 | ≥ 60 |
| Compétences maîtrisées (⭐⭐) / élève | ≥ 3 à 90j | ≥ 6 à 180j |

---

## 7. Roadmap de livraison

### Phase 1 — Engagement (Semaines 1-3)
- [ ] F1 : XP + niveaux
- [ ] F2 : Streak quotidien
- [ ] F3 : Badges (8 premiers)
- [ ] F4 : Célébrations visuelles + sons

### Phase 2 — Rapport & rétention (Semaines 4-6)
- [ ] F5 : Dashboard parent enrichi (recharts)
- [ ] F6 : Email hebdomadaire (Resend)
- [ ] F8 : Mode révision après session

### Phase 3 — Monétisation (Semaines 7-9)
- [ ] F9 : Stripe + page premium
- [ ] F10 : Déploiement Vercel + domaine educplus.ca
- [ ] F11 : Page tarification publique

### Phase 4 — Croissance (Semaines 10-14)
- [ ] F7 : Sec 2 (12 nouvelles compétences + 1 800 questions)
- [ ] F12 : Défis entre amis
- [ ] F13 : Assistant IA (Claude API)

### Phase 5 — B2B (Semaines 15-20)
- [ ] F14 : Interface enseignant + licences école

---

## 8. Ce qu'Éduc+ fait mieux que TOUS les concurrents

| Critère | Alloprof | Khan Academy | Schoolmouv | MyMaths | **Éduc+** |
|---|---|---|---|---|---|
| Aligné PFEQ Québec | ✅ | ❌ | ❌ | ❌ | ✅ |
| BKT adaptatif réel | ❌ | Partiel | ❌ | ❌ | ✅ |
| Gamification (XP, streaks, badges) | ❌ | Partiel | ❌ | ❌ | ✅ (Phase 1) |
| Rapport parent détaillé | ❌ | ❌ | ❌ | ❌ | ✅ (Phase 2) |
| Conforme Loi 25 (QC) | ✅ | ❌ | ❌ | ❌ | ✅ |
| Mode hors-ligne | ❌ | ❌ | ❌ | ❌ | ✅ |
| Freemium transparent | ❌ | ✅ | ❌ | ❌ | ✅ |
| Assistant IA | ❌ | ❌ | ❌ | ❌ | ✅ (Phase 4) |
| Anti-répétition intelligente | ❌ | ❌ | ❌ | ❌ | ✅ |
