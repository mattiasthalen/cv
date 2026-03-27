# CI/CD Pipeline Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a single GitHub Actions workflow that lints, builds, validates, deploys to GitHub Pages, and creates GitHub Releases with PDF artifacts.

**Architecture:** Single workflow file with 5 jobs (lint → build → validate → deploy + release). PR events run the first 3 jobs; push-to-main runs all 5. Artifacts are shared between jobs to avoid redundant builds.

**Tech Stack:** GitHub Actions, Ruff, markdownlint-cli2, htmlproofer (Ruby gem), Jekyll, RenderCV, gh CLI

---

### Task 1: Create Gemfile for Jekyll

Jekyll needs a Gemfile to install dependencies in CI (and locally). The project currently has none.

**Files:**
- Create: `Gemfile`

**Step 1: Create the Gemfile**

```ruby
source "https://rubygems.org"

gem "jekyll-theme-midnight", "~> 0.2"
gem "github-pages", group: :jekyll_plugins
```

**Step 2: Generate Gemfile.lock**

Run: `bundle install`
Expected: `Gemfile.lock` is created

**Step 3: Commit**

```bash
git add Gemfile Gemfile.lock
git commit -m "build: add Gemfile for Jekyll dependencies"
```

---

### Task 2: Create markdownlint configuration

markdownlint needs to allow inline HTML (RenderCV generates it) and be tuned for the project's markdown style.

**Files:**
- Create: `.markdownlint.yml`

**Step 1: Create the config file**

```yaml
# Allow inline HTML (RenderCV generates HTML in markdown)
MD033: false

# Allow duplicate headings (CV sections may repeat patterns)
MD024: false

# Allow trailing punctuation in headings
MD026: false

# Don't enforce line length (generated content)
MD013: false
```

**Step 2: Verify markdownlint runs locally (optional)**

Run: `npx markdownlint-cli2 index.md README.md`
Expected: No errors (or only expected ones that the config handles)

**Step 3: Commit**

```bash
git add .markdownlint.yml
git commit -m "build: add markdownlint configuration"
```

---

### Task 3: Create the GitHub Actions workflow — lint job

**Files:**
- Create: `.github/workflows/ci.yml`

**Step 1: Create the workflow file with the lint job**

```yaml
name: CI/CD

on:
  pull_request:
    branches: [main]
  push:
    branches: [main]

permissions:
  contents: write
  pages: write
  id-token: write
  pull-requests: read

jobs:
  lint:
    name: Lint
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Install uv
        uses: astral-sh/setup-uv@v6

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - name: Run Ruff lint
        run: uvx ruff check .

      - name: Run Ruff format check
        run: uvx ruff format --check .

      - name: Run markdownlint
        uses: DavidAnson/markdownlint-cli2-action@v19
        with:
          globs: |
            index.md
            README.md
```

**Step 2: Commit**

```bash
git add .github/workflows/ci.yml
git commit -m "ci: add lint job with Ruff and markdownlint"
```

---

### Task 4: Add build job to workflow

**Files:**
- Modify: `.github/workflows/ci.yml`

**Step 1: Add the build job after the lint job**

Append to the `jobs:` section:

```yaml
  build:
    name: Build
    needs: lint
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Install uv
        uses: astral-sh/setup-uv@v6

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - name: Build CV
        run: make cv

      - name: Set up Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: "3.3"
          bundler-cache: true

      - name: Build Jekyll site
        run: bundle exec jekyll build
        env:
          JEKYLL_ENV: production

      - name: Upload site artifact
        uses: actions/upload-artifact@v4
        with:
          name: site
          path: _site/

      - name: Upload PDF artifact
        uses: actions/upload-artifact@v4
        with:
          name: cv-pdf
          path: "rendercv_output/Mattias_Thalén_CV.pdf"
```

**Step 2: Commit**

```bash
git add .github/workflows/ci.yml
git commit -m "ci: add build job with RenderCV and Jekyll"
```

---

### Task 5: Add validate job to workflow

**Files:**
- Modify: `.github/workflows/ci.yml`

**Step 1: Add the validate job after the build job**

Append to the `jobs:` section:

```yaml
  validate:
    name: Validate
    needs: build
    runs-on: ubuntu-latest
    steps:
      - name: Download site artifact
        uses: actions/download-artifact@v4
        with:
          name: site
          path: _site/

      - name: Set up Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: "3.3"

      - name: Install htmlproofer
        run: gem install html-proofer

      - name: Run htmlproofer
        run: |
          htmlproofer _site/ \
            --allow-missing-href \
            --ignore-status-codes "999" \
            --typhoeus '{"connecttimeout": 10, "timeout": 30}' \
            --hydra '{"max_concurrency": 5}' \
            --no-enforce-https \
            --swap-urls "^/cv/:/"
```

**Step 2: Commit**

```bash
git add .github/workflows/ci.yml
git commit -m "ci: add validate job with htmlproofer"
```

---

### Task 6: Add deploy job to workflow

**Files:**
- Modify: `.github/workflows/ci.yml`

**Step 1: Add concurrency and environment config, then the deploy job**

Add at the top level (after `permissions:`):

```yaml
concurrency:
  group: pages
  cancel-in-progress: false
```

Append to the `jobs:` section:

```yaml
  deploy:
    name: Deploy
    if: github.event_name == 'push'
    needs: validate
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - name: Download site artifact
        uses: actions/download-artifact@v4
        with:
          name: site
          path: _site/

      - name: Upload Pages artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: _site/

      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

**Step 2: Commit**

```bash
git add .github/workflows/ci.yml
git commit -m "ci: add deploy job for GitHub Pages"
```

---

### Task 7: Add release job to workflow

**Files:**
- Modify: `.github/workflows/ci.yml`

**Step 1: Add the release job after the deploy job**

Append to the `jobs:` section:

```yaml
  release:
    name: Release
    if: github.event_name == 'push'
    needs: validate
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Determine version bump
        id: version
        run: |
          # Get the merge commit message
          COMMIT_MSG=$(git log -1 --pretty=%B)

          # Get latest tag or default to v0.0.0
          LATEST_TAG=$(git tag --sort=-v:refname | head -n 1)
          if [ -z "$LATEST_TAG" ]; then
            LATEST_TAG="v0.0.0"
          fi

          # Parse semver
          VERSION=${LATEST_TAG#v}
          MAJOR=$(echo "$VERSION" | cut -d. -f1)
          MINOR=$(echo "$VERSION" | cut -d. -f2)
          PATCH=$(echo "$VERSION" | cut -d. -f3)

          # Determine bump type from commit message
          if echo "$COMMIT_MSG" | grep -q "BREAKING CHANGE"; then
            MAJOR=$((MAJOR + 1))
            MINOR=0
            PATCH=0
          elif echo "$COMMIT_MSG" | grep -qE "^feat(\(.*\))?!?:"; then
            MINOR=$((MINOR + 1))
            PATCH=0
          else
            PATCH=$((PATCH + 1))
          fi

          NEW_TAG="v${MAJOR}.${MINOR}.${PATCH}"
          echo "new_tag=$NEW_TAG" >> "$GITHUB_OUTPUT"
          echo "Version bump: $LATEST_TAG -> $NEW_TAG"

      - name: Download PDF artifact
        uses: actions/download-artifact@v4
        with:
          name: cv-pdf
          path: artifacts/

      - name: Create GitHub Release
        env:
          GH_TOKEN: ${{ github.token }}
        run: |
          git tag "${{ steps.version.outputs.new_tag }}"
          git push origin "${{ steps.version.outputs.new_tag }}"

          gh release create "${{ steps.version.outputs.new_tag }}" \
            --generate-notes \
            --title "${{ steps.version.outputs.new_tag }}" \
            artifacts/Mattias_Thalén_CV.pdf
```

**Step 2: Commit**

```bash
git add .github/workflows/ci.yml
git commit -m "ci: add release job with semver bump and PDF upload"
```

---

### Task 8: Configure GitHub Pages source

This is a manual repo settings change, not a code task.

**Step 1: Set Pages source to GitHub Actions**

Run:
```bash
gh api repos/mattiasthalen/cv/pages -X PUT -f build_type=workflow
```

If Pages is not yet enabled:
```bash
gh api repos/mattiasthalen/cv/pages -X POST -f build_type=workflow -f source='{"branch":"main","path":"/"}'
```

Expected: Pages source is set to "GitHub Actions"

**Step 2: Verify**

Run: `gh api repos/mattiasthalen/cv/pages | jq '.build_type'`
Expected: `"workflow"`

---

### Task 9: Verify the full pipeline

**Step 1: Push branch and open a draft PR**

```bash
git push origin chore/cicd-pipeline
gh pr create --draft --title "ci: add CI/CD pipeline" --body "Adds GitHub Actions workflow with lint, build, validate, deploy, and release jobs."
```

**Step 2: Verify PR checks run**

Run: `gh pr checks` and monitor for lint → build → validate to pass.
Deploy and release should be skipped (PR event, not push).

**Step 3: Fix any failures**

If any job fails, debug and fix. Commit fixes with appropriate conventional commit messages.
