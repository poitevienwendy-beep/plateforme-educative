'use client'

import {
  ResponsiveContainer,
  ComposedChart,
  Line,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
} from 'recharts'

export type WeekData = {
  week: string
  xp: number
  sessions: number
  avgPct: number
}

type Props = { data: WeekData[] }

export default function ProgressionChart({ data }: Props) {
  return (
    <ResponsiveContainer width="100%" height={260}>
      <ComposedChart data={data} margin={{ top: 8, right: 16, left: 0, bottom: 0 }}>
        <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
        <XAxis
          dataKey="week"
          tick={{ fontSize: 11, fill: '#9ca3af' }}
          axisLine={false}
          tickLine={false}
        />
        <YAxis
          yAxisId="xp"
          orientation="left"
          tick={{ fontSize: 11, fill: '#9ca3af' }}
          axisLine={false}
          tickLine={false}
        />
        <YAxis
          yAxisId="pct"
          orientation="right"
          domain={[0, 100]}
          tick={{ fontSize: 11, fill: '#9ca3af' }}
          axisLine={false}
          tickLine={false}
          unit="%"
        />
        <Tooltip
          contentStyle={{
            borderRadius: '12px',
            border: '1px solid #e5e7eb',
            fontSize: 12,
          }}
          formatter={(value, name) => {
            if (name === 'XP') return [`${value} XP`, 'XP gagné']
            if (name === 'Sessions') return [value, 'Sessions']
            if (name === 'Précision') return [`${value}%`, 'Précision moy.']
            return [value, name]
          }}
        />
        <Legend
          wrapperStyle={{ fontSize: 12, paddingTop: 8 }}
          formatter={(value) =>
            value === 'XP' ? 'XP gagné' : value === 'Sessions' ? 'Sessions' : 'Précision %'
          }
        />
        <Bar
          yAxisId="xp"
          dataKey="xp"
          name="XP"
          fill="#e0e7ff"
          radius={[4, 4, 0, 0]}
          maxBarSize={32}
        />
        <Line
          yAxisId="pct"
          dataKey="avgPct"
          name="Précision"
          stroke="#4f46e5"
          strokeWidth={2.5}
          dot={{ r: 4, fill: '#4f46e5' }}
          activeDot={{ r: 6 }}
          type="monotone"
        />
      </ComposedChart>
    </ResponsiveContainer>
  )
}
