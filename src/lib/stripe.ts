import Stripe from 'stripe'

if (!process.env.STRIPE_SECRET_KEY) {
  throw new Error('STRIPE_SECRET_KEY manquant dans .env.local')
}

export const stripe = new Stripe(process.env.STRIPE_SECRET_KEY, {
  apiVersion: '2025-02-24.acacia',
  typescript: true,
})

export const PLANS = {
  monthly: {
    priceId: process.env.STRIPE_PRICE_MONTHLY ?? '',
    amount: 1999,      // $19.99 CAD en cents
    interval: 'month' as const,
    label: 'Mensuel',
    price: '$19.99',
    period: '/ mois',
  },
  annual: {
    priceId: process.env.STRIPE_PRICE_ANNUAL ?? '',
    amount: 17900,     // $179.00 CAD en cents
    interval: 'year' as const,
    label: 'Annuel',
    price: '$179.00',
    period: '/ an',
    monthlyEquiv: '$14.92',
    savings: '25%',
  },
} as const

export type PlanInterval = keyof typeof PLANS
