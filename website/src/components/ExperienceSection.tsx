import { useState } from 'react'
import type { ExperienceEntry } from '../types'

interface ExperienceSectionProps {
  experience: ExperienceEntry[]
}

export function ExperienceSection({ experience }: ExperienceSectionProps) {
  const [expandedIndex, setExpandedIndex] = useState<number | null>(null)

  return (
    <section id="experience" className="pt-12 pb-8">
      <h2 className="text-2xl font-bold text-accent-purple mb-6">Experience</h2>
      <div className="relative ml-4 border-l-2 border-accent-purple/30">
        {experience.map((entry, i) => {
          const isExpanded = expandedIndex === i
          const hasDetails = entry.highlights && entry.highlights.length > 0
          const dateRange = entry.end_date === 'present'
            ? `${entry.start_date} – Present`
            : `${entry.start_date} – ${entry.end_date}`

          return (
            <div key={i} className="relative pl-8 pb-8 last:pb-0">
              <div className="absolute -left-[9px] top-1 w-4 h-4 rounded-full bg-accent-purple border-2 border-bg-primary" />
              <div
                className={`rounded-xl border border-border bg-bg-surface p-5 transition-all duration-200 ${hasDetails ? 'cursor-pointer hover:border-border-hover' : ''}`}
                onClick={() => hasDetails && setExpandedIndex(isExpanded ? null : i)}
              >
                <div className="flex items-start justify-between gap-4">
                  <div>
                    <h3 className="text-lg font-semibold text-text-primary">
                      {entry.company}
                    </h3>
                    <p className="text-sm text-accent-purple">{entry.position}</p>
                  </div>
                  <div className="flex items-center gap-2">
                    <span className="text-xs text-text-secondary font-mono whitespace-nowrap">
                      {dateRange}
                    </span>
                    {hasDetails && (
                      <span className={`text-text-secondary text-xs transition-transform duration-200 ${isExpanded ? 'rotate-90' : ''}`}>
                        ▶
                      </span>
                    )}
                  </div>
                </div>
                <div className={`expandable-content ${isExpanded ? 'expanded' : ''}`}>
                  <div className="expandable-inner">
                    <div className="mt-4 space-y-3">
                      {entry.highlights?.map((h, j) => (
                        <p key={j} className="text-sm text-text-secondary leading-relaxed">
                          {h}
                        </p>
                      ))}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          )
        })}
      </div>
    </section>
  )
}
