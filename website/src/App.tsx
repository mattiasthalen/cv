import cvRaw from '../mattias_thalen__cv.yaml'
import type { CVRoot } from './types'
import { Hero } from './components/Hero'
import { StickyNav } from './components/StickyNav'
import { SummarySection } from './components/SummarySection'
import { SkillsSection } from './components/SkillsSection'
import { OpenSourceSection } from './components/OpenSourceSection'
import { CertificationsSection } from './components/CertificationsSection'
import { ExperienceSection } from './components/ExperienceSection'
import { PersonalProjectsSection } from './components/PersonalProjectsSection'
import { EducationSection } from './components/EducationSection'
import { Footer } from './components/Footer'

const cvData = (cvRaw as unknown as CVRoot).cv

const sections = [
  { id: 'summary', label: 'Summary' },
  { id: 'experience', label: 'Experience' },
  { id: 'open-source', label: 'Open Source' },
  { id: 'personal-projects', label: 'Personal Projects' },
  { id: 'certifications', label: 'Certifications' },
  { id: 'skills', label: 'Skills' },
]

function App() {
  return (
    <div className="min-h-screen">
      <Hero data={cvData} />
      <StickyNav sections={sections} />
      <main className="max-w-[960px] mx-auto px-6 pb-16">
        <SummarySection summary={cvData.sections.summary} />
        <ExperienceSection experience={cvData.sections.experience} />
        <OpenSourceSection contributions={cvData.sections.open_source_contributions} />
        <PersonalProjectsSection projects={cvData.sections.personal_projects} />
        <CertificationsSection certifications={cvData.sections.certifications} />
        <EducationSection education={cvData.sections.education_and_development} />
        <SkillsSection skills={cvData.sections.skills} />
      </main>
      <Footer />
    </div>
  )
}

export default App
