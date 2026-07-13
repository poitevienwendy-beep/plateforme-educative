'use client'

import { useState, useEffect } from 'react'

export default function ConsentModal({ userId }: { userId: string }) {
  const [show, setShow] = useState(false)

  useEffect(() => {
    const key = `educ_loi25_consent_${userId}`
    if (!localStorage.getItem(key)) setShow(true)
  }, [userId])

  function accept() {
    localStorage.setItem(`educ_loi25_consent_${userId}`, '1')
    setShow(false)
  }

  if (!show) return null

  return (
    <div className="fixed inset-0 z-50 flex items-end sm:items-center justify-center bg-black/40 backdrop-blur-sm px-4 pb-4 sm:pb-0">
      <div className="bg-white rounded-2xl shadow-2xl p-7 max-w-sm w-full">
        <div className="text-3xl mb-3">🔒</div>
        <h2 className="text-lg font-bold text-gray-900 mb-3">
          Confidentialité de tes données
        </h2>
        <p className="text-sm text-gray-600 mb-2 leading-relaxed">
          Cette application collecte tes données d&apos;apprentissage pour personnaliser
          ton expérience éducative.
        </p>
        <ul className="text-xs text-gray-500 space-y-1.5 mb-5 list-none">
          <li className="flex items-start gap-2">
            <span className="text-indigo-400 shrink-0 mt-0.5">•</span>
            Tes données sont conservées pendant <strong>24 mois</strong> maximum.
          </li>
          <li className="flex items-start gap-2">
            <span className="text-indigo-400 shrink-0 mt-0.5">•</span>
            Tu peux demander leur suppression à tout moment.
          </li>
          <li className="flex items-start gap-2">
            <span className="text-indigo-400 shrink-0 mt-0.5">•</span>
            Conformément à la <strong>Loi 25</strong> (Québec) sur la protection
            des renseignements personnels.
          </li>
        </ul>
        <button
          onClick={accept}
          className="w-full bg-indigo-600 text-white font-bold py-3.5 rounded-xl hover:bg-indigo-700 transition-colors"
        >
          J&apos;accepte et je continue →
        </button>
      </div>
    </div>
  )
}
