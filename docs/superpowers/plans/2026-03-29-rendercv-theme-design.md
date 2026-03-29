# RenderCV PDF Theme — Website Alignment Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Align the RenderCV PDF colors and typography with the website's visual identity.

**Architecture:** YAML-only changes to `mattias_thalen__cv.yaml` design section. No custom templates.

**Tech Stack:** RenderCV, YAML

---

### Task 1: Update colors

**Files:**
- Modify: `mattias_thalen__cv.yaml:195-203`

**Step 1: Update the color values**

Change the `design.colors` section to:

```yaml
  colors:
    body: rgb(30, 30, 30)
    name: rgb(74, 158, 255)
    headline: rgb(74, 158, 255)
    connections: rgb(74, 158, 255)
    section_titles: rgb(74, 158, 255)
    links: rgb(74, 158, 255)
    footer: rgb(136, 136, 136)
    top_note: rgb(136, 136, 136)
```

**Step 2: Commit**

```bash
git add mattias_thalen__cv.yaml
git commit -m "style(cv): update PDF colors to match website accent palette"
```

---

### Task 2: Update typography

**Files:**
- Modify: `mattias_thalen__cv.yaml:208-220`

**Step 1: Update all font_family entries**

Change the `design.typography.font_family` section to:

```yaml
    font_family:
      body: Merriweather
      name: Merriweather
      headline: Merriweather
      connections: Merriweather
      section_titles: Merriweather
```

**Step 2: Commit**

```bash
git add mattias_thalen__cv.yaml
git commit -m "style(cv): switch PDF font to Merriweather for print readability"
```

---

### Task 3: Generate and verify PDF

**Step 1: Run RenderCV to generate the updated PDF**

Run: `rendercv render mattias_thalen__cv.yaml`

Verify the output PDF in `rendercv_output/` looks correct — check that:
- Accent color is the website blue
- Merriweather renders correctly
- No layout issues from the font change (Merriweather is slightly wider than Source Sans 3)

**Step 2: If font causes layout issues, adjust font sizes**

Only if needed — Merriweather at the same point sizes may overflow. Reduce body to 9pt if necessary.

**Step 3: Commit any adjustments**

```bash
git add mattias_thalen__cv.yaml
git commit -m "fix(cv): adjust font sizes for Merriweather metrics"
```
