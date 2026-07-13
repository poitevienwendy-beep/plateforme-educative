'use client'

import { useState } from 'react'
import Link from 'next/link'

// ── Carte compétence verrouillée BKT ────────────────────────────────────────
export function BktLockedCard({ skillName, previousSkillName }: {
  skillName: string
  previousSkillName: string
}) {
  const [open, setOpen] = useState(false)

  return (
    <>
      <button
        onClick={() => setOpen(true)}
        className="flex flex-col p-3 rounded-xl bg-gray-100 border-2 border-gray-200 opacity-70 text-left w-full">
        <div className="flex items-center justify-between mb-1.5">
          <span className="text-xl">🔐</span>
          <span className="invisible text-xs px-1.5 py-0.5">·</span>
        </div>
        <p className="text-xs font-semibold text-gray-500 leading-tight line-clamp-2 flex-1 mb-2">{skillName}</p>
        <div className="w-full bg-gray-200 rounded-full h-1.5 mb-1">
          <div className="h-1.5 rounded-full bg-gray-300" style={{ width: '0%' }} />
        </div>
        <span className="text-xs text-gray-400">Débloque ⭐⭐ avant</span>
      </button>

      {open && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 px-4"
          onClick={() => setOpen(false)}>
          <div
            className="w-full max-w-sm bg-white rounded-2xl shadow-xl p-5"
            onClick={e => e.stopPropagation()}>
            <div className="flex items-center gap-2 mb-3">
              <span className="text-2xl">🔐</span>
              <h2 className="text-base font-extrabold text-gray-800">Compétence verrouillée</h2>
            </div>
            <p className="text-sm text-gray-600 mb-4">
              Pour accéder à <span className="font-bold text-gray-800">{skillName}</span>, tu dois d'abord
              maîtriser <span className="font-bold text-indigo-600">{previousSkillName}</span>.
            </p>
            <div className="bg-indigo-50 rounded-xl p-3 mb-4 space-y-2">
              <p className="text-xs font-bold text-indigo-700 uppercase tracking-wide">Comment débloquer</p>
              <div className="flex items-start gap-2">
                <span className="flex-shrink-0 w-5 h-5 rounded-full bg-indigo-600 text-white text-[10px] flex items-center justify-center font-bold">1</span>
                <p className="text-xs text-gray-700">Pratique <span className="font-semibold">{previousSkillName}</span> régulièrement</p>
              </div>
              <div className="flex items-start gap-2">
                <span className="flex-shrink-0 w-5 h-5 rounded-full bg-indigo-600 text-white text-[10px] flex items-center justify-center font-bold">2</span>
                <p className="text-xs text-gray-700">Atteins le niveau <span className="font-semibold">⭐⭐ (65 % de maîtrise)</span></p>
              </div>
              <div className="flex items-start gap-2">
                <span className="flex-shrink-0 w-5 h-5 rounded-full bg-indigo-600 text-white text-[10px] flex items-center justify-center font-bold">3</span>
                <p className="text-xs text-gray-700"><span className="font-semibold">{skillName}</span> se débloque automatiquement !</p>
              </div>
            </div>
            <button
              onClick={() => setOpen(false)}
              className="w-full py-2.5 bg-indigo-600 text-white text-sm font-bold rounded-xl">
              Compris, je continue !
            </button>
          </div>
        </div>
      )}
    </>
  )
}

// ── Carte compétence verrouillée Premium ────────────────────────────────────
export function PremiumLockedCard({ skillName }: { skillName: string }) {
  const [open, setOpen] = useState(false)

  return (
    <>
      <button
        onClick={() => setOpen(true)}
        className="flex flex-col p-3 rounded-xl bg-amber-50 border-2 border-amber-200 opacity-90 text-left w-full">
        <div className="flex items-center justify-between mb-1.5">
          <span className="text-xl">🔒</span>
          <span className="text-xs bg-amber-100 text-amber-700 px-1.5 py-0.5 rounded-full font-semibold">Premium</span>
        </div>
        <p className="text-xs font-semibold text-gray-600 leading-tight line-clamp-2 flex-1 mb-2">{skillName}</p>
        <div className="w-full bg-amber-100 rounded-full h-1.5 mb-1">
          <div className="h-1.5 rounded-full bg-amber-300" style={{ width: '0%' }} />
        </div>
        <span className="text-xs text-amber-600 font-medium">Abonnement requis</span>
      </button>

      {open && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 px-4"
          onClick={() => setOpen(false)}>
          <div
            className="w-full max-w-sm bg-white rounded-2xl shadow-xl p-5"
            onClick={e => e.stopPropagation()}>
            <div className="flex items-center gap-2 mb-3">
              <span className="text-2xl">⭐</span>
              <h2 className="text-base font-extrabold text-gray-800">Compétence Premium</h2>
            </div>
            <p className="text-sm text-gray-600 mb-4">
              <span className="font-bold text-gray-800">{skillName}</span> fait partie du plan{' '}
              <span className="font-bold text-amber-600">Eva Étude Premium</span>.
            </p>
            <div className="bg-amber-50 rounded-xl p-3 mb-4 space-y-2">
              <p className="text-xs font-bold text-amber-700 uppercase tracking-wide">Comment y accéder</p>
              <div className="flex items-start gap-2">
                <span className="flex-shrink-0 w-5 h-5 rounded-full bg-amber-500 text-white text-[10px] flex items-center justify-center font-bold">1</span>
                <p className="text-xs text-gray-700">Demande à tes parents de visiter la page <span className="font-semibold">Tarifs</span></p>
              </div>
              <div className="flex items-start gap-2">
                <span className="flex-shrink-0 w-5 h-5 rounded-full bg-amber-500 text-white text-[10px] flex items-center justify-center font-bold">2</span>
                <p className="text-xs text-gray-700">Ils choisissent le forfait <span className="font-semibold">mensuel ou annuel</span></p>
              </div>
              <div className="flex items-start gap-2">
                <span className="flex-shrink-0 w-5 h-5 rounded-full bg-amber-500 text-white text-[10px] flex items-center justify-center font-bold">3</span>
                <p className="text-xs text-gray-700">Toutes les compétences se <span className="font-semibold">débloquent immédiatement</span> !</p>
              </div>
            </div>
            <div className="flex gap-2">
              <button
                onClick={() => setOpen(false)}
                className="flex-1 py-2.5 bg-gray-100 text-gray-600 text-sm font-bold rounded-xl">
                Fermer
              </button>
              <Link
                href="/premium"
                className="flex-1 py-2.5 bg-amber-500 text-white text-sm font-bold rounded-xl text-center">
                Voir les forfaits
              </Link>
            </div>
          </div>
        </div>
      )}
    </>
  )
}
