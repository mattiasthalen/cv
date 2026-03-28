export function Footer() {
  const year = new Date().getFullYear()

  return (
    <footer className="border-t border-border py-8 px-6">
      <div className="max-w-[960px] mx-auto flex justify-between items-center text-xs text-text-secondary">
        <span>&copy; {year} Mattias Thal&eacute;n</span>
        <span>Last updated {new Date().toLocaleDateString('en-US', { month: 'long', year: 'numeric' })}</span>
      </div>
    </footer>
  )
}
