# Jekyll Dark CV Site Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Set up a Jekyll-powered GitHub Pages site with the midnight dark theme, a hero section, and a Makefile that auto-generates `index.md` from rendercv output.

**Architecture:** Jekyll with `jekyll-theme-midnight` on GitHub Pages. The hero section lives in `_includes/hero.html` and is injected via a custom `_layouts/default.html`. The Makefile runs rendercv and assembles `index.md` (front matter + stripped CV markdown). GitHub Pages builds and deploys from `main` branch automatically.

**Tech Stack:** Jekyll, GitHub Pages, jekyll-theme-midnight, Make, rendercv

---

### Task 1: Create Jekyll config

**Files:**
- Create: `_config.yml`

**Step 1: Create `_config.yml`**

```yaml
theme: jekyll-theme-midnight
title: Mattias Thalén - Senior Data Engineer
description: CV and portfolio of Mattias Thalén, Senior Data Engineer based in Uppsala, Sweden.
baseurl: /cv
url: https://mattiasthalen.github.io
exclude:
  - mattias_thalen__cv.yaml
  - pyproject.toml
  - uv.lock
  - Makefile
  - rendercv_output/
  - .venv/
  - .devcontainer/
```

**Step 2: Commit**

```bash
git add _config.yml
git commit -m "feat: add Jekyll config with midnight theme"
```

---

### Task 2: Create hero include

**Files:**
- Create: `_includes/hero.html`

**Step 1: Create `_includes/hero.html`**

```html
<div class="hero">
  <img src="{{ site.baseurl }}/mattias_thalen.jpg" alt="Mattias Thalén" class="hero-photo" />
  <h1 class="hero-name">Mattias Thalén</h1>
  <p class="hero-subtitle">Senior Data Engineer</p>
  <p class="hero-location">Uppsala, Sweden</p>
  <div class="hero-links">
    <a href="mailto:mattias.thalen@me.com">Email</a>
    <a href="https://linkedin.com/in/mattias-thalén">LinkedIn</a>
    <a href="https://github.com/mattiasthalen">GitHub</a>
  </div>
</div>
```

**Step 2: Commit**

```bash
git add _includes/hero.html
git commit -m "feat: add hero section include"
```

---

### Task 3: Create custom layout

**Files:**
- Create: `_layouts/default.html`

**Step 1: Create `_layouts/default.html`**

This overrides the midnight theme's default layout. The midnight theme structure uses a `header` element with the repo name/description, a `div#main_content_wrap` with `section.main-content`, and a footer. We override to insert the hero and remove the repo-specific header content.

Reference the midnight theme's default layout: https://github.com/pages-themes/midnight/blob/master/_layouts/default.html

```html
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{ page.title | default: site.title }}</title>
    <meta name="description" content="{{ site.description }}">

    <link rel="stylesheet" href="{{ '/assets/css/style.css?v=' | append: site.github.build_revision | relative_url }}">

    <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <header>
      <div class="inner">
        {% include hero.html %}
      </div>
    </header>

    <div id="content-wrapper">
      <div class="inner clearfix">
        <section id="main-content">
          {{ content }}
        </section>
      </div>
    </div>
  </body>
</html>
```

**Step 2: Commit**

```bash
git add _layouts/default.html
git commit -m "feat: add custom layout with hero section"
```

---

### Task 4: Create CSS overrides

**Files:**
- Create: `assets/css/style.scss`

**Step 1: Create `assets/css/style.scss`**

The file must start with two lines of triple dashes (Jekyll front matter) to be processed.

```scss
---
---

@import "jekyll-theme-midnight";

.hero {
  text-align: center;
  padding: 20px 0;
}

.hero-photo {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid #79b8ff;
}

.hero-name {
  font-size: 2em;
  margin: 15px 0 5px;
  color: #fff;
}

.hero-subtitle {
  font-size: 1.2em;
  color: #79b8ff;
  margin: 0 0 5px;
}

.hero-location {
  font-size: 0.95em;
  color: #999;
  margin: 0 0 10px;
}

.hero-links {
  margin-top: 10px;

  a {
    color: #79b8ff;
    text-decoration: none;
    margin: 0 10px;
    font-size: 0.95em;

    &:hover {
      text-decoration: underline;
    }
  }
}
```

**Step 2: Commit**

```bash
git add assets/css/style.scss
git commit -m "feat: add CSS overrides for hero section"
```

---

### Task 5: Create Makefile

**Files:**
- Create: `Makefile`

**Step 1: Create `Makefile`**

The Makefile has a single `cv` target that:
1. Runs rendercv render
2. Strips lines 1-7 from the markdown output (the `# Name's CV` header and contact bullet list)
3. Prepends Jekyll front matter
4. Writes to `index.md`

```makefile
.PHONY: cv

cv:
	rendercv render mattias_thalen__cv.yaml
	@echo '---' > index.md
	@echo 'layout: default' >> index.md
	@echo 'title: Mattias Thalén - Senior Data Engineer' >> index.md
	@echo '---' >> index.md
	@echo '' >> index.md
	@tail -n +9 "rendercv_output/Mattias_Thalén_CV.md" >> index.md
	@echo "index.md generated successfully"
```

Note: `tail -n +9` skips the first 8 lines of the markdown output, which are the title (`# Mattias Thalén's CV`), the contact info bullet list, and trailing blank lines. The hero section handles this content instead.

**Step 2: Commit**

```bash
git add Makefile
git commit -m "feat: add Makefile for CV build pipeline"
```

---

### Task 6: Generate initial `index.md` and verify

**Files:**
- Create: `index.md` (auto-generated)

**Step 1: Run `make cv`**

```bash
cd /workspace && make cv
```

Expected: rendercv renders successfully, `index.md` is created with front matter followed by CV content starting at `# Summary`.

**Step 2: Verify `index.md` content**

Check that:
- First 5 lines are the Jekyll front matter block
- Line 6 is blank
- Line 7 starts with `# Summary`
- No contact info header (hero handles it)

**Step 3: Add `index.md` to `.gitignore` note and commit**

Since `index.md` is auto-generated, add a comment at the top of the file noting this. Actually, `index.md` should be committed so GitHub Pages can serve it — it just shouldn't be edited by hand.

```bash
git add index.md
git commit -m "feat: add auto-generated index.md for GitHub Pages"
```

---

### Task 7: Update `.gitignore`

**Files:**
- Modify: `.gitignore`

**Step 1: Add Jekyll build artifacts to `.gitignore`**

Append the following to `.gitignore`:

```
# Jekyll
_site/
.sass-cache/
.jekyll-cache/
.jekyll-metadata
```

**Step 2: Commit**

```bash
git add .gitignore
git commit -m "chore: add Jekyll build artifacts to gitignore"
```

---

### Task 8: Test locally (optional) and final verification

**Step 1: Verify all files exist**

Run: `ls -la _config.yml _includes/hero.html _layouts/default.html assets/css/style.scss Makefile index.md`

Expected: All 6 files listed.

**Step 2: Verify `index.md` starts correctly**

Run: `head -10 index.md`

Expected:
```
---
layout: default
title: Mattias Thalén - Senior Data Engineer
---

# Summary
```

**Step 3: Verify no broken references**

- `mattias_thalen.jpg` exists in repo root (used by hero)
- `_config.yml` has correct `baseurl: /cv`

**Step 4: Final commit if any adjustments needed, then push**

```bash
git push origin main
```

After push, GitHub Pages will build the Jekyll site and deploy to `mattiasthalen.github.io/cv/`.
