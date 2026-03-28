interface SummarySectionProps {
  summary: string[]
}

export function SummarySection({ summary }: SummarySectionProps) {
  return (
    <section id="summary" className="pt-12 pb-8">
      <h2 className="text-2xl font-bold text-accent-primary mb-6">Summary</h2>
      <div className="rounded-xl border border-border bg-bg-surface p-6">
        {summary.map((text, i) => (
          <p key={i} className="text-text-primary leading-relaxed">
            {text}
          </p>
        ))}
      </div>
    </section>
  )
}
