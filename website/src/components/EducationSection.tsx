interface EducationSectionProps {
  education: string[]
}

export function EducationSection({ education }: EducationSectionProps) {
  return (
    <section className="pt-12 pb-8">
      <h2 className="text-2xl font-bold text-accent-primary mb-6">Education & Development</h2>
      <div className="rounded-xl border border-border bg-bg-surface p-6">
        {education.map((text, i) => (
          <p key={i} className="text-text-primary leading-relaxed">
            {text}
          </p>
        ))}
      </div>
    </section>
  )
}
