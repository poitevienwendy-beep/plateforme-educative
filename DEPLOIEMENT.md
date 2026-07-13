# 🚀 Guide de déploiement Éduc+ — Vercel + educplus.ca

## Étape 0 — Prérequis locaux

```bash
# Installer les nouvelles dépendances
npm install

# Vérifier que ça build sans erreurs
npm run build
```

---

## Étape 1 — Supabase : exécuter le SQL Phase 3

Dans le **SQL Editor** de votre projet Supabase, coller et exécuter :

```
supabase/phase3_stripe.sql
```

Résultat attendu : `col_customer_id=1, col_sub_id=1, fn_set_plan=1, fn_set_customer=1`

---

## Étape 2 — Stripe : créer les produits

1. Allez sur https://dashboard.stripe.com/products
2. Cliquez **+ Ajouter un produit**
3. Nom : **Éduc+ Premium**
4. Ajoutez 2 tarifs :
   - **Mensuel** : $14.99 CAD / mois récurrent → copiez le `price_xxx` (mensuel)
   - **Annuel** : $119.99 CAD / an récurrent → copiez le `price_xxx` (annuel)
5. Activez **Stripe Tax** dans Settings → Tax pour que TPS+TVQ soient calculées automatiquement

---

## Étape 3 — Stripe Tax (TPS + TVQ Québec)

1. Dashboard Stripe → **Tax** → Enable
2. Ajoutez votre adresse d'entreprise (Québec, Canada)
3. Stripe détectera automatiquement TPS (5%) + TVQ (9.975%) pour les clients québécois

---

## Étape 4 — Déployer sur Vercel

### 4a. Installer Vercel CLI (si pas déjà fait)
```bash
npm i -g vercel
```

### 4b. Premier déploiement
```bash
cd C:\Users\Wendy Poitevien\plateforme-educative
vercel
```
- Framework : **Next.js** (détecté automatiquement)
- Acceptez les paramètres par défaut

### 4c. Déploiement production
```bash
vercel --prod
```

Notez l'URL de déploiement (ex: `https://educplus.vercel.app`)

---

## Étape 5 — Variables d'environnement sur Vercel

Dans le **dashboard Vercel** → votre projet → **Settings → Environment Variables** :

| Nom | Valeur | Environnements |
|-----|--------|----------------|
| `NEXT_PUBLIC_SUPABASE_URL` | `https://xxxxx.supabase.co` | All |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | `eyJ...` | All |
| `SUPABASE_SERVICE_ROLE_KEY` | `eyJ...` (secret !) | Production + Preview |
| `STRIPE_SECRET_KEY` | `sk_live_...` | Production |
| `STRIPE_SECRET_KEY` | `sk_test_...` | Preview |
| `STRIPE_PRICE_MONTHLY` | `price_xxx` (mensuel) | All |
| `STRIPE_PRICE_ANNUAL` | `price_xxx` (annuel) | All |
| `STRIPE_WEBHOOK_SECRET` | `whsec_xxx` (étape 6) | All |
| `RESEND_API_KEY` | `re_xxx` | Production |
| `NEXT_PUBLIC_SITE_URL` | `https://educplus.ca` | Production |
| `NEXT_PUBLIC_SITE_URL` | `https://educplus.vercel.app` | Preview |

⚠️ **SUPABASE_SERVICE_ROLE_KEY** ne doit JAMAIS être committé dans git.

---

## Étape 6 — Stripe Webhook

1. Dashboard Stripe → **Developers → Webhooks → + Add endpoint**
2. URL : `https://educplus.ca/api/stripe/webhook`
3. Événements à écouter :
   - `checkout.session.completed`
   - `invoice.paid`
   - `customer.subscription.deleted`
   - `customer.subscription.paused`
4. Cliquez **Add endpoint**
5. Copiez le **Signing secret** (`whsec_xxx`) → collez-le dans Vercel comme `STRIPE_WEBHOOK_SECRET`

---

## Étape 7 — Domaine educplus.ca

### 7a. Ajouter le domaine sur Vercel
1. Vercel → projet → **Settings → Domains**
2. Ajoutez `educplus.ca` et `www.educplus.ca`
3. Vercel vous donnera les DNS records à configurer

### 7b. Configuration DNS chez votre registrar
Ajoutez ces enregistrements DNS :

```
Type    Nom    Valeur
A       @      76.76.21.21
CNAME   www    cname.vercel-dns.com
```

(Vercel affiche les valeurs exactes dans l'interface — utilisez celles-ci)

### 7c. SSL
Vercel génère le certificat SSL automatiquement. Comptez 5-30 minutes après la propagation DNS.

---

## Étape 8 — Stripe Customer Portal

1. Dashboard Stripe → **Settings → Billing → Customer portal**
2. Activez le portail
3. Configurez :
   - ✅ Annulation d'abonnement autorisée
   - ✅ Mise à jour du moyen de paiement
   - URL de retour : `https://educplus.ca/dashboard`
4. Sauvegardez

---

## Étape 9 — Supabase Auth : URL de redirection

1. Dashboard Supabase → **Authentication → URL Configuration**
2. **Site URL** : `https://educplus.ca`
3. **Redirect URLs** : ajoutez
   - `https://educplus.ca/**`
   - `https://educplus.vercel.app/**`

---

## Étape 10 — Test end-to-end

1. Allez sur `https://educplus.ca/premium`
2. Choisissez un forfait → Cliquez **Commencer Premium**
3. En mode test, utilisez la carte Stripe : `4242 4242 4242 4242` (n'importe quelle date future, n'importe quel CVC)
4. Adresse : Montréal, QC, H2X 1Y4 (pour déclencher TPS+TVQ)
5. Vérifiez que vous êtes redirigé vers `/premium/succes`
6. Vérifiez dans Supabase que `profiles.plan = 'premium'`

---

## Checklist finale

- [ ] `npm install` ✅
- [ ] `npm run build` sans erreurs ✅
- [ ] SQL Phase 3 exécuté dans Supabase ✅
- [ ] Produits Stripe créés (mensuel + annuel) ✅
- [ ] Stripe Tax activé ✅
- [ ] Déployé sur Vercel ✅
- [ ] Variables d'env configurées sur Vercel ✅
- [ ] Webhook Stripe configuré (`whsec_xxx`) ✅
- [ ] Domaine educplus.ca configuré ✅
- [ ] DNS propagé + SSL actif ✅
- [ ] Stripe Customer Portal configuré ✅
- [ ] Supabase Auth URLs mises à jour ✅
- [ ] Test paiement end-to-end réussi ✅
