import { NextRequest, NextResponse } from 'next/server'
import { stripe } from '@/lib/stripe'
import { createAdminClient } from '@/lib/supabase/admin'
import Stripe from 'stripe'

// App Router lit le body via req.text() — pas besoin de désactiver bodyParser
const WEBHOOK_SECRET = process.env.STRIPE_WEBHOOK_SECRET ?? ''

export async function POST(req: NextRequest) {
  const body = await req.text()
  const sig = req.headers.get('stripe-signature') ?? ''

  let event: Stripe.Event

  try {
    event = stripe.webhooks.constructEvent(body, sig, WEBHOOK_SECRET)
  } catch (err) {
    console.error('[stripe/webhook] Signature invalide', err)
    return NextResponse.json({ error: 'Invalid signature' }, { status: 400 })
  }

  const admin = createAdminClient()

  try {
    switch (event.type) {
      // Paiement initial réussi → activer premium
      case 'checkout.session.completed': {
        const session = event.data.object as Stripe.Checkout.Session
        if (session.mode !== 'subscription') break

        const subscription = await stripe.subscriptions.retrieve(
          session.subscription as string
        )
        const customerId = session.customer as string
        const expiresAt = new Date(subscription.current_period_end * 1000).toISOString()

        await admin.rpc('set_user_plan', {
          p_stripe_customer_id: customerId,
          p_plan: 'premium',
          p_subscription_id: subscription.id,
          p_expires_at: expiresAt,
        })
        break
      }

      // Renouvellement réussi → prolonger la date d'expiration
      case 'invoice.paid': {
        const invoice = event.data.object as Stripe.Invoice
        const subId = invoice.subscription as string | null
        if (!subId) break

        const subscription = await stripe.subscriptions.retrieve(subId)
        const customerId = invoice.customer as string
        const expiresAt = new Date(subscription.current_period_end * 1000).toISOString()

        await admin.rpc('set_user_plan', {
          p_stripe_customer_id: customerId,
          p_plan: 'premium',
          p_subscription_id: subscription.id,
          p_expires_at: expiresAt,
        })
        break
      }

      // Annulation ou non-paiement → rétrograder vers free
      case 'customer.subscription.deleted':
      case 'customer.subscription.paused': {
        const subscription = event.data.object as Stripe.Subscription
        const customerId = subscription.customer as string

        await admin.rpc('set_user_plan', {
          p_stripe_customer_id: customerId,
          p_plan: 'free',
          p_subscription_id: null,
          p_expires_at: null,
        })
        break
      }

      default:
        // Ignorer les autres events
        break
    }
  } catch (err) {
    console.error('[stripe/webhook] Erreur traitement event', event.type, err)
    return NextResponse.json({ error: 'Erreur serveur' }, { status: 500 })
  }

  return NextResponse.json({ received: true })
}
