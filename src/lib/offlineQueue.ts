/**
 * File d'attente hors-ligne — Eva Étude PRD v2.0 (Section 3)
 *
 * Les appels RPC Supabase qui échouent (réseau coupé) sont mis en queue
 * dans localStorage. La bannière hors-ligne les rejoue dès la reconnexion.
 */

export type QueuedRpc = {
  fn: string
  params: Record<string, unknown>
  ts: number  // timestamp unique — sert de clé de suppression
}

const QUEUE_KEY = 'eva_rpc_queue'

export const offlineQueue = {
  /** Ajoute un appel RPC échoué dans la queue */
  push(item: QueuedRpc): void {
    const q = offlineQueue.read()
    // Éviter les doublons exacts (même fn + mêmes params)
    const isDupe = q.some(
      (x) => x.fn === item.fn && JSON.stringify(x.params) === JSON.stringify(item.params)
    )
    if (!isDupe) {
      q.push(item)
      localStorage.setItem(QUEUE_KEY, JSON.stringify(q))
    }
  },

  /** Lit la queue complète */
  read(): QueuedRpc[] {
    try {
      return JSON.parse(localStorage.getItem(QUEUE_KEY) ?? '[]') as QueuedRpc[]
    } catch {
      return []
    }
  },

  /** Supprime un item par timestamp */
  remove(ts: number): void {
    const q = offlineQueue.read().filter((i) => i.ts !== ts)
    localStorage.setItem(QUEUE_KEY, JSON.stringify(q))
  },

  /** Vide toute la queue */
  clear(): void {
    localStorage.setItem(QUEUE_KEY, '[]')
  },

  /** Taille de la queue en attente */
  size(): number {
    return offlineQueue.read().length
  },
}
