# Modern GitHub Pages CV - React Redesign

## Status: Brainstorm

## Context

The current CV site uses Jekyll + Alpine.js with the `midnight` theme. It works, but feels like a themed Markdown document rather than a crafted personal brand. The goal is to rebuild as a modern React SPA deployed to GitHub Pages — taking inspiration from the [Intent-Driven Development](https://mattiasthalen.github.io/intent-driven-development/) landing page.

### What makes the IDD page feel modern

- **Dark-first design** (`#0D0D1A` deep navy background)
- **Card-based architecture** with consistent `border: 1px solid #222`, `borderRadius: 12px`
- **Gradient text** on hero heading via `WebkitBackgroundClip`
- **Progressive disclosure** — expandable sections prevent overload
- **Restrained micro-interactions** — `0.2s–0.3s ease` transitions, no gratuitous animation
- **Semantic color association** — each section/phase gets a dedicated accent color
- **Information density with breathing room** — packed content, generous whitespace
- **Typography hierarchy** — aggressive font weights (700–800), clear scale (36px → 18px → 13px)
- **Single-page React component** — no routing overhead, everything in one flow

---

## Tech Stack Proposal

| Layer | Current | Proposed |
|-------|---------|----------|
| Framework | Jekyll (Ruby) | **React 18** + TypeScript |
| Build tool | Bundler + Jekyll | **Vite** |
| Styling | SCSS + midnight theme | **CSS Modules** or **Tailwind CSS** |
| Interactivity | Alpine.js + jQuery | **React state** |
| CV data | RenderCV YAML → Markdown | **YAML → JSON at build time** (keep YAML as source of truth) |
| PDF generation | RenderCV | **RenderCV** (keep as-is, decoupled) |
| Deployment | GitHub Actions → Pages | **GitHub Actions → Vite build → Pages** |

### Key decisions to make

1. **Tailwind vs CSS Modules vs CSS-in-JS?** The IDD page uses inline styles exclusively. For a CV site, Tailwind gives rapid iteration with consistent design tokens. CSS Modules keeps things clean without a runtime cost.
2. **Keep RenderCV?** Yes — it handles PDF/PNG generation. But decouple the web version from RenderCV's Markdown output. Parse the YAML directly for the React site.
3. **Routing?** No. Single page, smooth scroll sections — like the IDD page.

---

## Design Direction

### Color Palette

Dark theme with a professional blue accent (evolving from the current `#004F90`):

| Token | Value | Usage |
|-------|-------|-------|
| `--bg-primary` | `#0D0D1A` | Page background |
| `--bg-surface` | `#131325` | Cards, elevated surfaces |
| `--bg-surface-hover` | `#1a1a35` | Card hover states |
| `--border` | `#222` | Card borders |
| `--text-primary` | `#E8E8E8` | Body text |
| `--text-secondary` | `#888` | Muted text, labels |
| `--accent-primary` | `#4A9EFF` | Links, primary highlights |
| `--accent-gradient` | `linear-gradient(135deg, #4A9EFF, #7C3AED)` | Hero heading gradient |
| `--accent-green` | `#2ECC71` | Skills, certifications |
| `--accent-orange` | `#F5A623` | Projects, highlights |
| `--accent-red` | `#E94560` | Open source contributions |
| `--accent-purple` | `#9B59B6` | Experience timeline |

### Layout Structure

```
┌─────────────────────────────────────────────────┐
│                    HERO                          │
│  [Photo]  Name (gradient text)                   │
│           Title · Location                       │
│           [GitHub] [LinkedIn] [Email] [PDF]      │
├─────────────────────────────────────────────────┤
│  [Summary] [Skills] [Experience] [Projects] ... │  ← sticky nav tabs
├─────────────────────────────────────────────────┤
│                                                  │
│  SUMMARY SECTION                                 │
│  Card with key highlights                        │
│                                                  │
├─────────────────────────────────────────────────┤
│                                                  │
│  SKILLS SECTION                                  │
│  Grid of skill category cards                    │
│  Each card: colored accent, tag chips            │
│                                                  │
├─────────────────────────────────────────────────┤
│                                                  │
│  OPEN SOURCE SECTION                             │
│  Cards per project with repo links               │
│  Contribution description + tech tags            │
│                                                  │
├─────────────────────────────────────────────────┤
│                                                  │
│  CERTIFICATIONS SECTION                          │
│  Grid of cert cards with issuer logos/badges     │
│  Credential links                                │
│                                                  │
├─────────────────────────────────────────────────┤
│                                                  │
│  EXPERIENCE TIMELINE                             │
│  Vertical timeline with expandable entries       │
│  Company → Role → Highlights                     │
│                                                  │
├─────────────────────────────────────────────────┤
│                                                  │
│  PROJECTS SECTION                                │
│  Filterable/expandable project cards             │
│  Tech stack tags, date ranges                    │
│                                                  │
├─────────────────────────────────────────────────┤
│  FOOTER                                          │
│  "Last updated DATE" · Subtle branding           │
└─────────────────────────────────────────────────┘
```

### Component Breakdown

```
App
├── Hero
│   ├── ProfilePhoto (circular, subtle glow/ring animation)
│   ├── GradientHeading
│   ├── Subtitle (title + location)
│   └── SocialLinks (icon buttons)
├── StickyNav (scroll-spy, smooth scroll)
├── Section (reusable wrapper: title, accent color, content)
├── SummarySection
│   └── HighlightCard
├── SkillsSection
│   └── SkillCategoryCard (discipline name + chip tags)
├── OpenSourceSection
│   └── ContributionCard (repo link, description, tech tags)
├── CertificationsSection
│   └── CertCard (name, issuer, date, credential link)
├── ExperienceSection
│   └── TimelineEntry (expandable: company → role → highlights)
├── ProjectsSection
│   └── ProjectCard (expandable: name, client, tech stack, details)
└── Footer
```

### Key Design Patterns (inspired by IDD page)

1. **Card-based everything** — consistent `border: 1px solid var(--border)`, `border-radius: 12px`, padding 16–20px
2. **Semantic accent colors per section** — each section gets a unique color for its numbered badges, borders, highlights
3. **Progressive disclosure** — experience entries and project cards expand on click to show details
4. **Gradient hero text** — name rendered with `background-clip: text` gradient
5. **Sticky navigation tabs** — horizontal pill buttons that highlight active section via IntersectionObserver
6. **Micro-interactions** — `transition: all 0.2s ease` on cards/buttons, subtle border color shifts on hover
7. **Typography scale** — hero 40–48px, section titles 24–28px, body 14–16px, labels 11–12px
8. **Max-width container** — 960px centered, generous padding on sides
9. **Tag chips** for skills/tech — small rounded pills with accent background at low opacity

### Responsive Strategy

- **Desktop (>960px)**: Full layout, multi-column grids for skills/certs
- **Tablet (600–960px)**: 2-column grids collapse, nav stays sticky
- **Mobile (<600px)**: Single column, hamburger nav or horizontal scroll tabs, cards stack vertically

---

## Data Flow

```
mattias_thalen__cv.yaml
        │
        ├──→ RenderCV → PDF, PNG (unchanged)
        │
        └──→ Vite build plugin (yaml-loader)
                  │
                  └──→ React components consume typed CV data
                            │
                            └──→ Static HTML + JS bundle → GitHub Pages
```

Keep the YAML as the single source of truth. A simple Vite plugin or build script parses the YAML into a typed TypeScript interface at build time. Components receive strongly-typed props.

### TypeScript interfaces (sketch)

```typescript
interface CV {
  cv: {
    name: string;
    location: string;
    email: string;
    phone: string;
    website: string;
    social_networks: SocialNetwork[];
    sections: {
      summary: string[];
      open_source_contributions: Entry[];
      certifications: Entry[];
      skills: SkillEntry[];
      featured_project: Entry[];
      project_history: Entry[];
      experience: Entry[];
    };
  };
}
```

---

## Migration Path

### Phase 1: Scaffold React app
- `npm create vite@latest` with React + TypeScript template
- Set up project structure, Tailwind/CSS config
- Configure Vite for GitHub Pages (`base: '/cv/'`)
- YAML loader for CV data

### Phase 2: Build components (parallelizable)
- Hero + StickyNav
- SummarySection + SkillsSection
- OpenSourceSection + CertificationsSection
- ExperienceSection + ProjectsSection
- Footer

### Phase 3: Polish
- Scroll-spy integration
- Expand/collapse animations
- Responsive breakpoints
- Accessibility (keyboard nav, ARIA labels, contrast ratios)

### Phase 4: CI/CD update
- Update GitHub Actions to build Vite instead of Jekyll
- Keep RenderCV step for PDF generation
- Deploy `dist/` to Pages
- Remove Jekyll dependencies (Gemfile, _config.yml, _layouts, _includes)

---

## Open Questions

1. **Tailwind vs CSS Modules?** Tailwind speeds up development, but CSS Modules are more explicit. Preference?
2. **Animation library?** Framer Motion for enter/exit animations? Or keep it CSS-only like the IDD page?
3. **Dark mode only or toggle?** The IDD page is dark-only. A toggle adds complexity. Dark-only fits the modern vibe.
4. **Keep profile photo prominent or minimize?** Current site has it large in hero. Modern trend is smaller or avatar-style.
5. **PDF download button style?** Prominent CTA in hero vs subtle link in nav?
