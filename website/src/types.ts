export interface SocialNetwork {
  network: string
  username: string
}

export interface OpenSourceEntry {
  name: string
  summary: string
  date: string
  highlights: string[]
  url: string
}

export interface PersonalProjectEntry {
  name: string
  summary: string
  date: string
  highlights?: string[]
  url: string
}

export interface Certification {
  name: string
  date: string
  url: string
}

export interface Skill {
  label: string
  details: string
}

export interface ExperienceEntry {
  company: string
  position: string
  start_date: string
  end_date: string
  highlights?: string[]
}

export interface CVSections {
  summary: string[]
  experience: ExperienceEntry[]
  open_source_contributions: OpenSourceEntry[]
  personal_projects: PersonalProjectEntry[]
  certifications: Certification[]
  education_and_development: string[]
  skills: Skill[]
}

export interface CVData {
  name: string
  headline: string
  location: string
  email: string
  photo: string
  social_networks: SocialNetwork[]
  sections: CVSections
}

export interface CVRoot {
  cv: CVData
}
