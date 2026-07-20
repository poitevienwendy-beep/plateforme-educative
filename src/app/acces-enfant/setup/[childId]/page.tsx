'use client'

import { useEffect, useState, use } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'

export default function SetupInvitePage({
  params,
}: {
  params: Promise<{ childId: string }>
}) {
  const { childId } = use(params)
  const router = useRouter()
  const [status, setStatus] = useState<'loading' | 'error'>('loading')
  const [errorMsg, setErrorMsg] = useState('')

  useEffect(() => {
    let cancelled = false

    async function setup() {
      const supabase = createClient()

      // Attendre que Supabase traite le #access_token du fragment URL
      // createBrowserClient détecte automatiquement le hash et déclenche SIGNED_IN
      const session = await new Promise<import('@supabase/supabase-js').Session | null>((resolve) => {
        const timer = setTimeout(() => resolve(null), 8000)

        // Écouter le changement d'état auth (déclenché quand le hash est traité)
        const { data: { subscription } } = supabase.auth.onAuthStateChange((event, sess) => {
          if (sess) {
            clearTimeout(timer)
            subscription.unsubscribe()
            resolve(sess)
          }
        })

        // Vérifier aussi si déjà connecté (cas où onAuthStateChange ne se déclenche pas)
        supabase.auth.getSession().then(({ data }) => {
          if (data.session) {
            clearTimeout(timer)
            subscription.unsubscribe()
            resolve(data.session)
          }
        })
      })

      if (cancelled) return

      if (!session) {
        setErrorMsg('Lien invalide ou expiré. Demande à ton parent de te renvoyer une invitation.')
        setStatus('error')
        return
      }

      // Lier le compte enfant au profil dans la DB
      const res = await fetch('/api/children/complete-invite', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ child_id: childId }),
      })

      if (!res.ok) {
        const body = await res.json().catch(() => ({ error: 'Erreur réseau' }))
        if (!cancelled) {
          setErrorMsg(body.error || 'Erreur lors de la configuration du compte.')
          setStatus('error')
        }
        return
      }

      if (!cancelled) {
        router.replace(`/eleve/${childId}`)
      }
    }

    setup().catch(() => {
      if (!cancelled) {
        setErrorMsg('Une erreur inattendue est survenue. Réessaie ou contacte ton parent.')
        setStatus('error')
      }
    })

    return () => { cancelled = true }
  }, [childId, router])

  if (status === 'error') {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50 p-6">
        <div className="bg-white rounded-2xl shadow-md border border-gray-100 p-8 max-w-sm w-full text-center">
          <div className="text-5xl mb-4">😕</div>
          <h1 className="text-lg font-bold text-gray-900 mb-2">Lien invalide</h1>
          <p className="text-gray-500 text-sm mb-6">{errorMsg}</p>
          <p className="text-xs text-gray-400">
            Les liens d'invitation sont valides 24 heures.
          </p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="text-center">
        <div className="text-5xl mb-4 animate-pulse">🎓</div>
        <p className="text-gray-700 font-semibold text-lg">Configuration de ton compte...</p>
        <p className="text-gray-400 text-sm mt-2">Tu seras redirigé dans quelques secondes</p>
      </div>
    </div>
  )
}
