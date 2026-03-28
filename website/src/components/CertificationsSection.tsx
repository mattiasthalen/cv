import type { Certification } from '../types'

interface CertificationsSectionProps {
  certifications: Certification[]
}

export function CertificationsSection({ certifications }: CertificationsSectionProps) {
  return (
    <section id="certifications" className="pt-12 pb-8">
      <h2 className="text-2xl font-bold text-accent-orange mb-6">Certifications</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {certifications.map(cert => (
          <a
            key={cert.name}
            href={cert.url}
            target="_blank"
            rel="noopener noreferrer"
            className="group rounded-xl border border-border bg-bg-surface p-5 hover:border-border-hover transition-all duration-200 block"
          >
            <div className="flex items-start justify-between gap-3">
              <h3 className="text-sm font-semibold text-text-primary group-hover:text-accent-orange transition-colors duration-200">
                {cert.name}
              </h3>
              <svg className="w-4 h-4 text-text-secondary shrink-0 mt-0.5 group-hover:text-accent-orange transition-colors duration-200" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6" />
                <polyline points="15 3 21 3 21 9" />
                <line x1="10" y1="14" x2="21" y2="3" />
              </svg>
            </div>
            <p className="text-xs text-text-secondary mt-2 font-mono">{cert.date}</p>
          </a>
        ))}
      </div>
    </section>
  )
}
