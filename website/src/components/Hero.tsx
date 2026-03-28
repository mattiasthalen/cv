import type { CVData } from '../types'

interface HeroProps {
  data: CVData
}

export function Hero({ data }: HeroProps) {
  const linkedIn = data.social_networks.find(s => s.network === 'LinkedIn')
  const github = data.social_networks.find(s => s.network === 'GitHub')

  return (
    <section className="py-16 px-6">
      <div className="max-w-[960px] mx-auto flex flex-col items-center text-center gap-4">
        <img
          src={`${import.meta.env.BASE_URL}mattias_thalen.jpg`}
          alt={data.name}
          className="w-24 h-24 rounded-full object-cover ring-2 ring-accent-primary/50 ring-offset-2 ring-offset-bg-primary"
        />
        <h1 className="text-4xl md:text-5xl font-extrabold gradient-text leading-tight">
          {data.name}
        </h1>
        <p className="text-lg text-text-secondary">
          {data.headline} &middot; {data.location}
        </p>
        <div className="flex flex-wrap justify-center gap-3 mt-2">
          {github && (
            <a
              href={`https://github.com/${github.username}`}
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center gap-2 px-4 py-2 rounded-lg border border-border text-sm text-text-primary hover:border-border-hover hover:bg-bg-surface transition-all duration-200"
            >
              <svg className="w-4 h-4" viewBox="0 0 24 24" fill="currentColor">
                <path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z" />
              </svg>
              GitHub
            </a>
          )}
          {linkedIn && (
            <a
              href={`https://linkedin.com/in/${linkedIn.username}`}
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center gap-2 px-4 py-2 rounded-lg border border-border text-sm text-text-primary hover:border-border-hover hover:bg-bg-surface transition-all duration-200"
            >
              <svg className="w-4 h-4" viewBox="0 0 24 24" fill="currentColor">
                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
              </svg>
              LinkedIn
            </a>
          )}
          <a
            href={`mailto:${data.email}`}
            className="flex items-center gap-2 px-4 py-2 rounded-lg border border-border text-sm text-text-primary hover:border-border-hover hover:bg-bg-surface transition-all duration-200"
          >
            <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <rect x="2" y="4" width="20" height="16" rx="2" />
              <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7" />
            </svg>
            Email
          </a>
          <a
            href={`${import.meta.env.BASE_URL}Mattias_Thalen_CV.pdf`}
            download
            className="flex items-center gap-2 px-4 py-2 rounded-lg bg-accent-primary text-bg-primary text-sm font-semibold hover:brightness-110 transition-all duration-200"
          >
            <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
              <polyline points="7 10 12 15 17 10" />
              <line x1="12" y1="15" x2="12" y2="3" />
            </svg>
            Download CV
          </a>
        </div>
      </div>
    </section>
  )
}
