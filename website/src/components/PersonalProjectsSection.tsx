import type { PersonalProjectEntry } from '../types'

interface PersonalProjectsSectionProps {
  projects: PersonalProjectEntry[]
}

export function PersonalProjectsSection({ projects }: PersonalProjectsSectionProps) {
  return (
    <section id="personal-projects" className="pt-12 pb-8">
      <h2 className="text-2xl font-bold text-accent-orange mb-6">Personal Projects</h2>
      <div className="grid gap-4">
        {projects.map(entry => (
          <div
            key={entry.name}
            className="rounded-xl border border-border bg-bg-surface p-5 hover:border-border-hover transition-all duration-200"
          >
            <div className="flex items-start justify-between gap-4 mb-2">
              <div>
                <a
                  href={entry.url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-lg font-semibold text-accent-orange hover:underline"
                >
                  {entry.name}
                </a>
                <p className="text-sm text-text-secondary mt-1">{entry.summary}</p>
              </div>
              <span className="text-xs text-text-secondary whitespace-nowrap font-mono">
                {entry.date}
              </span>
            </div>
            {entry.highlights && entry.highlights.length > 0 && (
              <ul className="mt-3 space-y-1">
                {entry.highlights.map((h, i) => (
                  <li key={i} className="text-sm text-text-primary flex gap-2">
                    <span className="text-accent-orange mt-0.5">•</span>
                    <span>{h}</span>
                  </li>
                ))}
              </ul>
            )}
          </div>
        ))}
      </div>
    </section>
  )
}
