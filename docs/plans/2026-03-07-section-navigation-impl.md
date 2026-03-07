# Section Navigation Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a sticky sidebar TOC and collapsible sections to the CV site using Alpine.js.

**Architecture:** Alpine.js (CDN) manages expand/collapse state and sidebar visibility. A vanilla JS script (`cv.js`) runs on DOMContentLoaded to dynamically wrap auto-generated `<h1>` sections into collapsible containers and sets up IntersectionObserver scroll-spy. The layout uses CSS flexbox for the sidebar + content arrangement.

**Tech Stack:** Jekyll (midnight theme), Alpine.js 3.x (CDN), SCSS, vanilla JS

---

### Task 1: Add `cv.js` — Dynamic Section Wrapping

**Files:**
- Create: `assets/js/cv.js`

**Step 1: Create `cv.js` with section wrapping logic**

This script runs on DOMContentLoaded. It finds all `<h1>` elements inside the content area, wraps each heading + its following siblings (until the next `<h1>`) into a `<div class="cv-section">`. It also sets `id` attributes on each section div derived from the heading text (slugified), and adds chevron spans + click handlers via Alpine.js attributes.

```js
document.addEventListener('DOMContentLoaded', function () {
  const content = document.querySelector('.cv-content');
  if (!content) return;

  const headings = Array.from(content.querySelectorAll(':scope > h1'));
  if (headings.length === 0) return;

  // Sections that should be expanded by default
  const expandedByDefault = ['summary', 'skills'];

  headings.forEach(function (heading) {
    // Collect all siblings until next h1
    const siblings = [];
    let next = heading.nextElementSibling;
    while (next && next.tagName !== 'H1') {
      siblings.push(next);
      next = next.nextElementSibling;
    }

    // Create section wrapper
    const sectionId = heading.textContent
      .trim()
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/(^-|-$)/g, '');

    const isExpanded = expandedByDefault.includes(sectionId);

    const wrapper = document.createElement('div');
    wrapper.className = 'cv-section';
    wrapper.id = sectionId;
    wrapper.setAttribute('x-data', '{ open: ' + isExpanded + ' }');

    // Create clickable header
    const header = document.createElement('div');
    header.className = 'cv-section-header';
    header.setAttribute('x-on:click', 'open = !open');

    const chevron = document.createElement('span');
    chevron.className = 'chevron';
    chevron.setAttribute('x-text', "open ? '\\u25BC' : '\\u25B6'");

    header.appendChild(chevron);
    header.appendChild(heading.cloneNode(true));

    // Create collapsible body
    const body = document.createElement('div');
    body.className = 'cv-section-body';
    body.setAttribute('x-show', 'open');
    body.setAttribute('x-transition:enter', 'transition-enter');
    body.setAttribute('x-transition:enter-start', 'transition-enter-start');
    body.setAttribute('x-transition:enter-end', 'transition-enter-end');
    body.setAttribute('x-transition:leave', 'transition-leave');
    body.setAttribute('x-transition:leave-start', 'transition-leave-start');
    body.setAttribute('x-transition:leave-end', 'transition-leave-end');

    siblings.forEach(function (el) {
      body.appendChild(el);
    });

    wrapper.appendChild(header);
    wrapper.appendChild(body);

    // Replace original heading with wrapper
    heading.parentNode.replaceChild(wrapper, heading);
  });

  // Initialize scroll-spy
  initScrollSpy();
});

function initScrollSpy() {
  const sections = document.querySelectorAll('.cv-section');
  const navLinks = document.querySelectorAll('.sidebar-nav a');

  if (sections.length === 0 || navLinks.length === 0) return;

  const observer = new IntersectionObserver(
    function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          const id = entry.target.id;
          navLinks.forEach(function (link) {
            link.classList.toggle('active', link.getAttribute('href') === '#' + id);
          });
        }
      });
    },
    { rootMargin: '-20% 0px -60% 0px' }
  );

  sections.forEach(function (section) {
    observer.observe(section);
  });
}

function navigateToSection(sectionId) {
  const section = document.getElementById(sectionId);
  if (!section) return;

  // Expand the section via Alpine
  const alpineData = Alpine.$data(section);
  if (alpineData) {
    alpineData.open = true;
  }

  // Smooth scroll
  setTimeout(function () {
    section.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }, 50);
}
```

**Step 2: Commit**

```bash
git add assets/js/cv.js
git commit -m "feat: add cv.js for dynamic section wrapping and scroll-spy"
```

---

### Task 2: Create Sidebar Include

**Files:**
- Create: `_includes/sidebar.html`

**Step 1: Create sidebar markup with Alpine.js directives**

The sidebar contains a TOC with links to each section. On mobile, it's toggled by a hamburger button. Each link calls `navigateToSection()` to expand and scroll.

```html
<!-- Hamburger button (mobile only) -->
<button class="hamburger" x-on:click="sidebarOpen = !sidebarOpen"
  x-bind:aria-expanded="sidebarOpen" aria-label="Toggle navigation">
  <span x-text="sidebarOpen ? '&times;' : '&#9776;'"></span>
</button>

<!-- Sidebar overlay (mobile) -->
<div class="sidebar-overlay" x-show="sidebarOpen" x-on:click="sidebarOpen = false"
  x-transition:enter="transition-enter" x-transition:enter-start="opacity-0"
  x-transition:enter-end="opacity-100" x-transition:leave="transition-leave"
  x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"></div>

<!-- Sidebar -->
<aside class="sidebar" x-bind:class="{ 'sidebar-open': sidebarOpen }">
  <nav class="sidebar-nav">
    <a href="#summary" x-on:click.prevent="navigateToSection('summary'); sidebarOpen = false">Summary</a>
    <a href="#open-source-contributions" x-on:click.prevent="navigateToSection('open-source-contributions'); sidebarOpen = false">Open Source</a>
    <a href="#certifications" x-on:click.prevent="navigateToSection('certifications'); sidebarOpen = false">Certifications</a>
    <a href="#skills" x-on:click.prevent="navigateToSection('skills'); sidebarOpen = false">Skills</a>
    <a href="#projects" x-on:click.prevent="navigateToSection('projects'); sidebarOpen = false">Projects</a>
    <a href="#experience" x-on:click.prevent="navigateToSection('experience'); sidebarOpen = false">Experience</a>
  </nav>
</aside>
```

**Step 2: Commit**

```bash
git add _includes/sidebar.html
git commit -m "feat: add sidebar TOC include with Alpine.js directives"
```

---

### Task 3: Update Layout — Add Alpine.js, Sidebar, and Flex Wrapper

**Files:**
- Modify: `_layouts/default.html` (all 40 lines)

**Step 1: Update `default.html`**

Replace the current layout with the new structure. Key changes:
1. Add Alpine.js CDN script in `<head>`
2. Add `x-data` on `<body>` for sidebar state
3. Include sidebar partial
4. Wrap content in flex layout with `cv-content` class
5. Load `cv.js` at the bottom

```html
<!doctype html>
<html lang="{{ site.lang | default: "en-US" }}">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    {% seo %}
    <link rel="stylesheet" href="{{ '/assets/css/style.css?v=' | append: site.github.build_revision | relative_url }}">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
    <script src="{{ '/assets/js/respond.js' | relative_url }}"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <!--[if lt IE 9]>
      <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="{{ '/assets/css/ie.css' | relative_url }}">
    <![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    {% include head-custom.html %}
  </head>
  <body x-data="{ sidebarOpen: false }">
    <div id="header">
      <nav>
        <ul>
          <li class="fork"><a href="{{ site.github.repository_url }}">View On GitHub</a></li>
        </ul>
      </nav>
    </div>

    <div class="wrapper">
      <section>
        <div id="title">
          {% include hero.html %}
          <hr>
        </div>
      </section>

      <div class="content-with-sidebar">
        {% include sidebar.html %}

        <section class="cv-content">
          {{ content }}
        </section>
      </div>
    </div>

    <script src="{{ '/assets/js/cv.js' | relative_url }}"></script>
  </body>
</html>
```

**Step 2: Commit**

```bash
git add _layouts/default.html
git commit -m "feat: update layout with Alpine.js, sidebar, and flex wrapper"
```

---

### Task 4: Add Styles — Sidebar, Collapsible Sections, Responsive

**Files:**
- Modify: `assets/css/style.scss` (existing, 50 lines)

**Step 1: Read current file then append new styles**

Add all new styles after the existing hero styles. Keep all existing hero CSS intact.

Append to `assets/css/style.scss`:

```scss
// --- Content + Sidebar Layout ---

.content-with-sidebar {
  display: flex;
  gap: 0;
  position: relative;
}

.cv-content {
  flex: 1;
  min-width: 0;
}

// --- Sidebar ---

.sidebar {
  width: 200px;
  flex-shrink: 0;
  position: sticky;
  top: 0;
  height: 100vh;
  padding: 20px 0;
  overflow-y: auto;
}

.sidebar-nav {
  display: flex;
  flex-direction: column;

  a {
    color: #999;
    text-decoration: none;
    padding: 8px 16px;
    border-left: 3px solid transparent;
    font-size: 0.9em;
    transition: color 0.2s, border-color 0.2s;

    &:hover {
      color: #fff;
    }

    &.active {
      color: #79b8ff;
      border-left-color: #79b8ff;
    }
  }
}

// --- Hamburger Button ---

.hamburger {
  display: none;
  position: fixed;
  top: 12px;
  left: 12px;
  z-index: 1001;
  background: #1f2428;
  border: 1px solid #444;
  color: #fff;
  font-size: 1.5em;
  width: 44px;
  height: 44px;
  cursor: pointer;
  border-radius: 6px;
  line-height: 1;
}

// --- Sidebar Overlay (mobile) ---

.sidebar-overlay {
  display: none;
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.5);
  z-index: 999;
}

// --- Collapsible Sections ---

.cv-section {
  margin-bottom: 20px;
}

.cv-section-header {
  display: flex;
  align-items: center;
  cursor: pointer;
  user-select: none;
  gap: 10px;

  &:hover h1 {
    color: #79b8ff;
  }

  h1 {
    margin: 0;
    transition: color 0.2s;
  }

  .chevron {
    font-size: 0.7em;
    color: #79b8ff;
    min-width: 16px;
  }
}

// --- Transitions ---

.transition-enter {
  transition: all 0.3s ease-out;
}

.transition-enter-start {
  opacity: 0;
  max-height: 0;
  overflow: hidden;
}

.transition-enter-end {
  opacity: 1;
  max-height: 2000px;
}

.transition-leave {
  transition: all 0.2s ease-in;
}

.transition-leave-start {
  opacity: 1;
  max-height: 2000px;
}

.transition-leave-end {
  opacity: 0;
  max-height: 0;
  overflow: hidden;
}

// --- Opacity helpers for overlay ---

.opacity-0 { opacity: 0; }
.opacity-100 { opacity: 1; }

// --- Mobile Responsive ---

@media (max-width: 768px) {
  .content-with-sidebar {
    flex-direction: column;
  }

  .hamburger {
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .sidebar {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    width: 250px;
    background: #1f2428;
    z-index: 1000;
    padding-top: 60px;
    border-right: 1px solid #444;
  }

  .sidebar-open {
    display: block;
  }

  .sidebar-overlay {
    display: block;
  }
}
```

**Step 2: Commit**

```bash
git add assets/css/style.scss
git commit -m "feat: add sidebar, collapsible section, and responsive styles"
```

---

### Task 5: Manual Testing and Fixes

**Step 1: Build the Jekyll site locally to check for errors**

Run: `cd /workspace && bundle exec jekyll build 2>&1 | head -30`

If `bundle` isn't available, check with: `which bundle || gem install bundler && bundle install`

Alternatively, if using the devcontainer, check if there's a simpler serve command in the Makefile:

Run: `cat Makefile`

**Step 2: Verify generated HTML structure**

Run: `cat _site/index.html | head -60` (or inspect the built output to confirm Alpine.js script tag, sidebar include, cv-content wrapper, and cv.js script tag are all present)

**Step 3: Open in browser and verify**

Check the following manually:
- [ ] Hero section displays correctly above sidebar + content
- [ ] Sidebar shows on desktop with 6 TOC links
- [ ] Summary and Skills sections are expanded by default
- [ ] Other 4 sections are collapsed by default
- [ ] Clicking a section header toggles expand/collapse with animation
- [ ] Clicking a sidebar link expands and scrolls to the section
- [ ] Active section is highlighted in sidebar while scrolling
- [ ] On mobile viewport: hamburger button appears, sidebar is hidden
- [ ] Hamburger opens sidebar as overlay, links work, clicking outside closes it

**Step 4: Fix any issues found**

Address layout, styling, or behavior bugs.

**Step 5: Final commit**

```bash
git add -A
git commit -m "fix: polish section navigation layout and behavior"
```
