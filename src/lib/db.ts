import postgres from 'postgres'

// Connexion directe PostgreSQL — bypasse le cache PostgREST cassé
// Utilise le session pooler Supabase (compatible IPv4/Vercel)
export const sql = postgres(process.env.DATABASE_URL!, {
  ssl: 'require',
  max: 1,
  idle_timeout: 20,
  connect_timeout: 10,
})
