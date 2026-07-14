import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'

// Gère tous les redirects d'auth Supabase :
// - /auth/callback?code=xxx          → PKCE (signup, magic link)
// - /auth/callback?token_hash=xxx&type=recovery → reset mot de passe (email template)
export async function GET(request: NextRequest) {
  const { searchParams, origin } = new URL(request.url)
  const code = searchParams.get('code')
  const token_hash = searchParams.get('token_hash')
  const type = searchParams.get('type') ?? ''
  const next = searchParams.get('next') ?? '/dashboard'

  const supabase = await createClient()

  // Flux PKCE (signup confirmation, magic link, etc.)
  if (code) {
    const { error } = await supabase.auth.exchangeCodeForSession(code)
    if (!error) {
      if (type === 'recovery') {
        return NextResponse.redirect(`${origin}/auth/reset-password`)
      }
      return NextResponse.redirect(`${origin}${next}`)
    }
  }

  // Flux token_hash (reset password via email template personnalisé)
  if (token_hash && type) {
    const { error } = await supabase.auth.verifyOtp({
      token_hash,
      type: type as 'recovery' | 'signup' | 'email' | 'magiclink' | 'email_change',
    })
    if (!error) {
      if (type === 'recovery') {
        return NextResponse.redirect(`${origin}/auth/reset-password`)
      }
      return NextResponse.redirect(`${origin}${next}`)
    }
  }

  // Lien invalide ou expiré
  return NextResponse.redirect(`${origin}/auth/login?error=lien-expire`)
}
