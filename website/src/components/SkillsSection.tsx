import type { Skill } from '../types'

interface SkillsSectionProps {
  skills: Skill[]
}

export function SkillsSection({ skills }: SkillsSectionProps) {
  return (
    <section id="skills" className="pt-12 pb-8">
      <h2 className="text-2xl font-bold text-accent-green mb-6">Skills</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {skills.map(skill => (
          <div
            key={skill.label}
            className="rounded-xl border border-border bg-bg-surface p-5 hover:border-border-hover transition-all duration-200"
          >
            <h3 className="text-sm font-semibold text-accent-green uppercase tracking-wider mb-3">
              {skill.label}
            </h3>
            <div className="flex flex-wrap gap-2">
              {skill.details.split(', ').map(item => (
                <span
                  key={item}
                  className="px-3 py-1 rounded-full text-sm bg-accent-green/10 text-accent-green border border-accent-green/20"
                >
                  {item}
                </span>
              ))}
            </div>
          </div>
        ))}
      </div>
    </section>
  )
}
