import { useState, useEffect } from 'react'

interface Section {
  id: string
  label: string
}

interface StickyNavProps {
  sections: Section[]
}

export function StickyNav({ sections }: StickyNavProps) {
  const [activeSection, setActiveSection] = useState(sections[0]?.id ?? '')

  useEffect(() => {
    const observers: IntersectionObserver[] = []

    for (const section of sections) {
      const el = document.getElementById(section.id)
      if (!el) continue

      const observer = new IntersectionObserver(
        ([entry]) => {
          if (entry.isIntersecting) {
            setActiveSection(section.id)
          }
        },
        { rootMargin: '-20% 0px -60% 0px' }
      )
      observer.observe(el)
      observers.push(observer)
    }

    return () => observers.forEach(o => o.disconnect())
  }, [sections])

  return (
    <nav className="sticky top-0 z-50 bg-bg-primary/80 backdrop-blur-md border-b border-border">
      <div className="max-w-[960px] mx-auto px-6 flex gap-1 overflow-x-auto scrollbar-none">
        {sections.map(section => (
          <a
            key={section.id}
            href={`#${section.id}`}
            className={`px-4 py-3 text-sm font-medium whitespace-nowrap transition-all duration-200 border-b-2 ${
              activeSection === section.id
                ? 'text-accent-primary border-accent-primary'
                : 'text-text-secondary border-transparent hover:text-text-primary'
            }`}
          >
            {section.label}
          </a>
        ))}
      </div>
    </nav>
  )
}
