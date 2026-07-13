'use client'

import dynamic from 'next/dynamic'
import type { WeekData } from './ProgressionChart'
import type { SkillData } from './PrecisionBarChart'

const ProgressionChart = dynamic(() => import('./ProgressionChart'), { ssr: false })
const PrecisionBarChart = dynamic(() => import('./PrecisionBarChart'), { ssr: false })

type Props = {
  weeklyData: WeekData[]
  skillBarData: SkillData[]
}

export default function ReportCharts({ weeklyData, skillBarData }: Props) {
  return (
    <>
      {/* Graphique progression hebdomadaire */}
      <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6 mb-8">
        <h2 className="text-base font-semibold text-gray-800 mb-1">Progression sur 8 semaines</h2>
        <p className="text-xs text-gray-400 mb-4">XP gagnes (barres) et precision moyenne (ligne bleue)</p>
        <ProgressionChart data={weeklyData} />
      </div>

      {/* Graphique maitrise par competence */}
      <div className="bg-white rounded-xl border border-gray-100 shadow-sm p-6 mb-8">
        <h2 className="text-base font-semibold text-gray-800 mb-1">Maitrise par competence</h2>
        <p className="text-xs text-gray-400 mb-4">
          <span className="inline-block w-3 h-3 rounded-sm bg-emerald-500 mr-1" />
          &ge;75% maitrise &nbsp;
          <span className="inline-block w-3 h-3 rounded-sm bg-amber-400 mr-1" />
          50-74% &nbsp;
          <span className="inline-block w-3 h-3 rounded-sm bg-red-400 mr-1" />
          &lt;50%
        </p>
        <PrecisionBarChart data={skillBarData} />
      </div>
    </>
  )
}
