# Plan: Modern GitHub Pages CV — React Rebuild

## Reference

- Spec: `docs/superpowers/specs/2026-03-28-modern-github-pages-react.md`

## Phase 1: Scaffold (sequential — foundational)

1. Create Vite + React + TypeScript project in `website/` directory
2. Install Tailwind CSS v4 + PostCSS
3. Configure Vite: `base: '/cv/'`, YAML loader
4. Define TypeScript interfaces for CV data
5. Create YAML import and data hook

## Phase 2: Build Components (parallelizable per group)

### Group A: Hero + Nav
- `Hero` — avatar, gradient name, subtitle, social links, PDF CTA
- `StickyNav` — horizontal pill tabs, IntersectionObserver scroll-spy

### Group B: Content Sections
- `SummarySection` — highlight card
- `SkillsSection` — category cards with tag chips
- `OpenSourceSection` — contribution cards with repo links
- `CertificationsSection` — cert cards with credential links
- `ExperienceSection` — timeline with expandable entries
- `ProjectsSection` — expandable project cards with tech tags
- `Footer` — last updated date

## Phase 3: Polish (sequential — needs all components)

- Wire up scroll-spy to StickyNav
- Expand/collapse CSS transitions
- Responsive breakpoints (960px, 600px)
- Accessibility pass (ARIA, keyboard, contrast)

## Phase 4: CI/CD (sequential — needs working build)

- Update `.github/workflows/ci.yml`:
  - Replace Jekyll build with `npm run build` in `website/`
  - Upload `website/dist/` instead of `_site/`
  - Keep RenderCV + PDF artifact steps
  - Update htmlproofer or replace with build-only validation
- Remove Jekyll files: `Gemfile`, `Gemfile.lock`, `_config.yml`, `_layouts/`, `_includes/`, `assets/`, `index.md`

## Execution Order

```
Phase 1 (scaffold)
    │
    ├──→ Phase 2 Group A (hero + nav)
    ├──→ Phase 2 Group B (content sections)
    │
    ▼
Phase 3 (polish — after all components merged)
    │
    ▼
Phase 4 (CI/CD + cleanup)
```
