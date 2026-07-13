import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { createAdminClient } from '@/lib/supabase/admin'
import { stripe } from '@/lib/stripe'

// Supporte POST depuis un <form> ET GET depuis un lien
export async function POST(req: NextRequest) {
  return handlePortal(req)
}

export async function GET(req: NextRequest) {
  return handlePortal(req)
}

async function handlePortal(req: NextRequest) {
  try {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
      return NextResponse.redirect(new URL('/auth/login?next=/premium', req.url))
    }

    const admin = createAdminClient()
    const { data: profile } = await admin
      .from('profiles')
      .select('stripe_customer_id')
      .eq('id', user.id)
      .single()

    if (!profile?.stripe_customer_id) {
      return NextResponse.redirect(new URL('/premium', req.url))
    }

    const origin = req.headers.get('origin') ?? process.env.NEXT_PUBLIC_SITE_URL ?? 'http://localhost:3000'

    const portalSession = await stripe.billingPortal.sessions.create({
      customer: profile.stripe_customer_id,
      return_url: `${origin}/dashboard`,
    })

    return NextResponse.redirect(portalSession.url)
  } catch (err) {
    console.error('[stripe/portal]', err)
    return NextResponse.redirect(new URL('/premium', req.url))
  }
}
