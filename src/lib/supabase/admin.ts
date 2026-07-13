import { createClient } from '@supabase/supabase-js'

/**
 * Client Supabase avec la service role key.
 * Bypass RLS — à utiliser UNIQUEMENT dans des Server Components ou API Routes.
 * Ne jamais exposer côté client.
 */
export function createAdminClient() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    {
      auth: {
        autoRefreshToken: false,
        persistSession: false,
      },
    }
  )
}
