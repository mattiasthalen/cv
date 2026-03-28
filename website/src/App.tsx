import cvRaw from '../mattias_thalen__cv.yaml'
import type { CVRoot } from './types'
import { Hero } from './components/Hero'
import { StickyNav } from './components/StickyNav'
import { SummarySection } from './components/SummarySection'
import { SkillsSection } from './components/SkillsSection'
import { OpenSourceSection } from './components/OpenSourceSection'
import { CertificationsSection } from './components/CertificationsSection'
import { ExperienceSection } from './components/ExperienceSection'
import { ProjectsSection } from './components/ProjectsSection'
import { Footer } from './components/Footer'

const cvData = (cvRaw as unknown as CVRoot).cv

const sections = [
  { id: 'summary', label: 'Summary' },
  { id: 'skills', label: 'Skills' },
  { id: 'open-source', label: 'Open Source' },
  { id: 'certifications', label: 'Certifications' },
  { id: 'experience', label: 'Experience' },
  { id: 'projects', label: 'Projects' },
]

function App() {
  return (
    <div className="min-h-screen">
      <Hero data={cvData} />
      <StickyNav sections={sections} />
      <main className="max-w-[960px] mx-auto px-6 pb-16">
        <SummarySection summary={cvData.sections.summary} />
        <SkillsSection skills={cvData.sections.skills} />
        <OpenSourceSection contributions={cvData.sections.open_source_contributions} />
        <CertificationsSection certifications={cvData.sections.certifications} />
        <ExperienceSection experience={cvData.sections.experience} />
        <ProjectsSection
          featured={cvData.sections.featured_project}
          projects={cvData.sections.project_history}
        />
      </main>
      <Footer />
    </div>
  )
}

export default App
