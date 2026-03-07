# Section Navigation Design: Sticky Sidebar TOC + Collapsible Sections

**Goal:** Add a sticky sidebar table of contents and collapsible sections to the CV site for modern, polished navigation. Uses Alpine.js for reactivity and smooth animations.

---

## Approach

Alpine.js (17KB, CDN-loaded) for declarative state management and transitions. IntersectionObserver for scroll-spy. Sections dynamically wrapped by JS since `index.md` is auto-generated and shouldn't be hand-edited.

## Layout

### Desktop (>=768px)

Sticky sidebar (~200px) on the left with TOC links. Main content on the right in a flex layout. Hero section spans full width above both.

```
+------------------------------------------+
|              Hero Section                |
+------------+-----------------------------+
|  Sidebar   |  Content Sections           |
|  (sticky)  |                             |
|  Summary   |  # Summary [expanded]       |
|  OS Contri |  # Open Source [collapsed]  |
|  Certs     |  # Certifications [collapsed]|
|  Skills    |  # Skills [expanded]        |
|  Projects  |  # Projects [collapsed]    |
|  Experience|  # Experience [collapsed]  |
+------------+-----------------------------+
```

### Mobile (<768px)

Sidebar hidden. Hamburger icon fixed top-left. Tapping opens sidebar as a slide-in overlay from the left. Tapping a link closes sidebar, scrolls to section, expands it. Tapping outside or hamburger again closes it.

## Collapsible Sections

### Default States

| Section | Default | Reason |
|---------|---------|--------|
| Summary | Expanded | Short, high-impact first impression |
| Skills | Expanded | Short, scannable at a glance |
| Open Source Contributions | Collapsed | List content |
| Certifications | Collapsed | List content |
| Projects | Collapsed | Longest section (11 projects) |
| Experience | Collapsed | List content |

### Behavior

- Chevron indicator on each section header (right-pointing when collapsed, down when expanded)
- Click header to toggle
- Smooth slide animation via Alpine.js `x-show` + `x-transition`
- TOC link click auto-expands target section and smooth-scrolls to it

## Sidebar TOC Details

- Styled to match midnight theme (dark background, light text)
- Clean list without bullets
- Active section highlighted with left border accent and brighter text
- Scroll-spy via IntersectionObserver updates active item as user scrolls

## Implementation

### Files Changed / Created

| File | Action | Purpose |
|------|--------|---------|
| `_layouts/default.html` | Modified | Add Alpine.js CDN, sidebar include, flex layout wrapper, `x-data` state |
| `_includes/sidebar.html` | New | Sidebar TOC markup with Alpine.js directives |
| `assets/css/style.scss` | New | Sidebar styles, collapsible sections, responsive breakpoints, hamburger |
| `assets/js/cv.js` | New | IntersectionObserver scroll-spy, dynamic section wrapping |
| `_includes/hero.html` | Unchanged | - |
| `index.md` | Unchanged | Auto-generated, no manual edits |
| `Makefile` | Unchanged | No pipeline changes |

### Dynamic Section Wrapping

Since `index.md` is auto-generated from rendercv, the JS in `cv.js` dynamically wraps each `<h1>` and its content into collapsible containers on page load. This keeps the rendercv pipeline clean.

### Alpine.js State

On `<body>` via `x-data`:
- `activeSection`: currently visible section (string)
- `sidebarOpen`: mobile sidebar visibility (boolean)
- `expanded`: object mapping section IDs to expanded state (boolean)

### Dependencies

- Alpine.js ~17KB via CDN (no build step change)
- No other new dependencies
