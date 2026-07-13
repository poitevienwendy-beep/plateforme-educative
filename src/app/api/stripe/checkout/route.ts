import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { createAdminClient } from '@/lib/supabase/admin'
import { stripe, PLANS } from '@/lib/stripe'
import type { PlanInterval } from '@/lib/stripe'

export async function POST(req: NextRequest) {
  try {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
      return NextResponse.json({ error: 'Non authentifié' }, { status: 401 })
    }

    const { interval } = (await req.json()) as { interval: PlanInterval }
    const plan = PLANS[interval]
    if (!plan) {
      return NextResponse.json({ error: 'Forfait invalide' }, { status: 400 })
    }

    const admin = createAdminClient()

    // Récupérer ou créer le customer Stripe
    const { data: profile } = await admin
      .from('profiles')
      .select('stripe_customer_id, full_name')
      .eq('id', user.id)
      .single()

    let customerId = profile?.stripe_customer_id as string | undefined

    if (!customerId) {
      const customer = await stripe.customers.create({
        email: user.email,
        name: profile?.full_name ?? undefined,
        metadata: { supabase_user_id: user.id },
      })
      customerId = customer.id

      // Persister le customer ID
      await admin.rpc('set_stripe_customer', {
        p_user_id: user.id,
        p_stripe_customer_id: customerId,
      })
    }

    const origin = req.headers.get('origin') ?? process.env.NEXT_PUBLIC_SITE_URL ?? 'http://localhost:3000'

    const session = await stripe.checkout.sessions.create({
      customer: customerId,
      mode: 'subscription',
      line_items: [
        {
          price: plan.priceId,
          quantity: 1,
        },
      ],
      // Stripe Tax calcule automatiquement TPS + TVQ Quebec
      automatic_tax: { enabled: true },
      customer_update: { address: 'auto' },
      success_url: `${origin}/premium/succes?session_id={CHECKOUT_SESSION_ID}`,
      cancel_url: `${origin}/premium/annule`,
      metadata: {
        supabase_user_id: user.id,
        interval,
      },
    })

    return NextResponse.json({ url: session.url })
  } catch (err) {
    console.error('[stripe/checkout]', err)
    return NextResponse.json({ error: 'Erreur serveur' }, { status: 500 })
  }
}
