import { sql } from '@/lib/db'

/**
 * Vérifie qu'un utilisateur Supabase a accès à un profil enfant.
 * Accepte deux cas :
 *  1. Parent  → user.id dans parent_child_links pour cet enfant
 *  2. Enfant  → children.child_user_id = user.id
 *
 * Retourne { authorized, isChild, child }
 * Lance notFound() (via l'appelant) si aucun cas ne correspond.
 */
export async function verifyChildAccess(
  userId: string,
  childId: string,
): Promise<{ isChild: boolean; child: Record<string, unknown> }> {
  const [child] = await sql`
    SELECT * FROM children WHERE id = ${childId}::uuid
  `
  if (!child) return Promise.reject(new Error('not_found'))

  // Cas 1 : l'enfant lui-même
  if (child.child_user_id === userId) {
    return { isChild: true, child }
  }

  // Cas 2 : le parent
  const [link] = await sql`
    SELECT child_id FROM parent_child_links
    WHERE parent_id = ${userId}::uuid AND child_id = ${childId}::uuid
  `
  if (!link) return Promise.reject(new Error('not_found'))

  return { isChild: false, child }
}
