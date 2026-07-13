'use client'

import { useEffect, useState } from 'react'

const COLORS = ['#4f46e5', '#7c3aed', '#10b981', '#f59e0b', '#ef4444', '#06b6d4', '#f97316']

type Piece = { id: number; color: string; x: number; delay: number; duration: number; size: number }

export default function ConfettiCelebration({ active }: { active: boolean }) {
  const [pieces, setPieces] = useState<Piece[]>([])

  useEffect(() => {
    if (!active) return
    setPieces(
      Array.from({ length: 60 }, (_, i) => ({
        id: i,
        color: COLORS[i % COLORS.length],
        x: Math.random() * 100,
        delay: Math.random() * 0.8,
        duration: 1.2 + Math.random() * 1.2,
        size: 6 + Math.random() * 8,
      }))
    )
    const t = setTimeout(() => setPieces([]), 3500)
    return () => clearTimeout(t)
  }, [active])

  if (!pieces.length) return null

  return (
    <div className="fixed inset-0 pointer-events-none z-50 overflow-hidden">
      {pieces.map((p) => (
        <div
          key={p.id}
          className="absolute top-0 rounded-sm"
          style={{
            left: `${p.x}%`,
            width: p.size,
            height: p.size * 1.4,
            backgroundColor: p.color,
            animation: `confetti-fall ${p.duration}s ${p.delay}s ease-in forwards`,
          }}
        />
      ))}
    </div>
  )
}
