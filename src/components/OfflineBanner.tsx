'use client'

import { useState, useEffect, useCallback } from 'react'
import { createClient } from '@/lib/supabase/client'
import { offlineQueue } from '@/lib/offlineQueue'

export default function OfflineBanner() {
  const [offline, setOffline] = useState(false)
  const [flushing, setFlushing] = useState(false)
  const [flushedCount, setFlushedCount] = useState(0)

  const flushQueue = useCallback(async () => {
    const queue = offlineQueue.read()
    if (queue.length === 0) return

    setFlushing(true)
    const supabase = createClient()
    let synced = 0

    for (const item of queue) {
      try {
        const { error } = await supabase.rpc(item.fn, item.params)
        if (!error) {
          offlineQueue.remove(item.ts)
          synced++
        }
      } catch {
        // On garde l'item en queue si l'appel échoue encore
      }
    }

    if (synced > 0) setFlushedCount(synced)
    setFlushing(false)

    // Effacer le message de confirmation après 3s
    if (synced > 0) setTimeout(() => setFlushedCount(0), 3000)
  }, [])

  useEffect(() => {
    setOffline(!navigator.onLine)

    const goOffline = () => setOffline(true)
    const goOnline = async () => {
      setOffline(false)
      await flushQueue()
    }

    window.addEventListener('offline', goOffline)
    window.addEventListener('online', goOnline)
    return () => {
      window.removeEventListener('offline', goOffline)
      window.removeEventListener('online', goOnline)
    }
  }, [flushQueue])

  // Bannière de confirmation après sync réussie
  if (!offline && flushedCount > 0) {
    return (
      <div className="fixed top-0 inset-x-0 z-40 bg-emerald-500 text-white text-center text-sm font-semibold py-2 px-4 flex items-center justify-center gap-2">
        <span>✅</span>
        <span>{flushedCount} réponse{flushedCount > 1 ? 's' : ''} synchronisée{flushedCount > 1 ? 's' : ''} avec succès.</span>
      </div>
    )
  }

  if (!offline) return null

  return (
    <div className="fixed top-0 inset-x-0 z-40 bg-amber-500 text-white text-center text-sm font-semibold py-2 px-4 flex items-center justify-center gap-2">
      <span>📡</span>
      <span>
        {flushing
          ? 'Synchronisation en cours…'
          : 'Mode hors ligne — tes progrès seront synchronisés à la reconnexion.'}
      </span>
    </div>
  )
}
