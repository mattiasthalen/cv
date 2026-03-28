import { useState } from 'react'
import type { ProjectEntry } from '../types'

interface ProjectsSectionProps {
  featured: ProjectEntry[]
  projects: ProjectEntry[]
}

function ProjectCard({ project, defaultExpanded = false }: { project: ProjectEntry; defaultExpanded?: boolean }) {
  const [isExpanded, setIsExpanded] = useState(defaultExpanded)

  return (
    <div
      className="rounded-xl border border-border bg-bg-surface p-5 cursor-pointer hover:border-border-hover transition-all duration-200"
      onClick={() => setIsExpanded(!isExpanded)}
    >
      <div className="flex items-start justify-between gap-4">
        <div className="min-w-0">
          <h3 className="text-base font-semibold text-text-primary">{project.title}</h3>
          <div className="flex flex-wrap gap-2 mt-2">
            {project.authors.map(tech => (
              <span
                key={tech}
                className="px-2 py-0.5 rounded-full text-xs bg-accent-orange/10 text-accent-orange border border-accent-orange/20"
              >
                {tech}
              </span>
            ))}
          </div>
        </div>
        <div className="flex items-center gap-2 shrink-0">
          <span className="text-xs text-text-secondary font-mono">{project.date}</span>
          <span className={`text-text-secondary text-xs transition-transform duration-200 ${isExpanded ? 'rotate-90' : ''}`}>
            ▶
          </span>
        </div>
      </div>
      <div className={`expandable-content ${isExpanded ? 'expanded' : ''}`}>
        <div className="expandable-inner">
          <p className="mt-4 text-sm text-text-secondary leading-relaxed">
            {project.summary}
          </p>
        </div>
      </div>
    </div>
  )
}

export function ProjectsSection({ featured, projects }: ProjectsSectionProps) {
  return (
    <section id="projects" className="pt-12 pb-8">
      <h2 className="text-2xl font-bold text-accent-orange mb-6">Projects</h2>

      {featured.length > 0 && (
        <div className="mb-6">
          <h3 className="text-sm font-semibold text-text-secondary uppercase tracking-wider mb-3">
            Featured
          </h3>
          {featured.map(p => (
            <ProjectCard key={p.title} project={p} defaultExpanded />
          ))}
        </div>
      )}

      <div className="grid gap-4">
        {projects.map(p => (
          <ProjectCard key={p.title} project={p} />
        ))}
      </div>
    </section>
  )
}
