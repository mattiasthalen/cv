# CI/CD Pipeline Design

## Overview

A single GitHub Actions workflow that handles PR validation, GitHub Pages deployment, and GitHub Releases with PDF artifacts for the CV project.

## Triggers

- `pull_request` targeting `main` — runs lint, build, validate
- `push` to `main` (PR merge) — runs lint, build, validate, then deploy + release in parallel

## Job Dependency Graph

```
lint ──→ build ──→ validate ──→ deploy (Pages)
                            └──→ release (GitHub Release + PDF)
```

- `lint`, `build`, `validate` run on both PR and push
- `deploy` and `release` only run on push to main
- `deploy` and `release` run in parallel after validate passes

## Jobs

### Lint

1. Checkout code
2. Install Python 3.12 + uv
3. Run **Ruff** (lint + format check) on Python files
4. Run **markdownlint** on `index.md` and `README.md`

Notes:
- Ruff runs in check-only mode (no auto-fix in CI)
- markdownlint uses `.markdownlint.yml` config to allow HTML in markdown and tune rules
- Both tools fail fast — downstream jobs don't run on failure

### Build

1. Checkout code
2. Install Python 3.12 + uv
3. Run `make cv` (RenderCV renders YAML → markdown, HTML, PDF, PNG)
4. Install Ruby + Jekyll dependencies
5. Run `jekyll build` to produce the static site in `_site/`
6. Upload `_site/` as an artifact (used by validate + deploy jobs)
7. Upload `rendercv_output/Mattias_Thalén_CV.pdf` as a separate artifact (used by release job)

Notes:
- Build artifact is shared across downstream jobs — no redundant builds
- PDF artifact preserved independently for release attachment

### Validate

1. Download the `_site/` artifact from the build job
2. Run **htmlproofer** on `_site/` to validate:
   - Internal links (no broken anchors or page links)
   - HTML structure validity
   - External links (with sensible timeout + retry)

Notes:
- Configured with `--allow-missing-href` and `--ignore-status-codes "999"` (LinkedIn blocks bots) plus retry
- Validates exactly what gets deployed
- Blocks merge on failure

### Deploy

**Condition:** Only on push to main.

1. Download the `_site/` artifact from the build job
2. Use `actions/upload-pages-artifact` to package the site
3. Use `actions/deploy-pages` to deploy to GitHub Pages

Notes:
- Repo Pages setting must be configured for "GitHub Actions" as the source
- Uses the `github-pages` environment for deployment protection

### Release

**Condition:** Only on push to main.

1. Checkout code (needed for git tag operations)
2. Determine next version — fetch latest git tag, parse semver, bump patch (or minor/major based on conventional commit prefix)
3. Create and push the git tag (e.g., `v1.0.1`)
4. Download the PDF artifact from the build job
5. Create a GitHub Release via `gh release create` with:
   - The new tag
   - Auto-generated release notes
   - PDF attached as a release asset

Notes:
- First release starts at `v1.0.0` if no tags exist
- Version bump logic: `feat:` → minor, `fix:`/everything else → patch, `BREAKING CHANGE` → major
- Uses `gh` CLI for release creation

## Permissions & Configuration

### Workflow-level permissions

```yaml
permissions:
  contents: write    # git tags + releases
  pages: write       # deploy to Pages
  id-token: write    # Pages OIDC token
  pull-requests: read
```

### Repo configuration (one-time)

- GitHub Pages source set to "GitHub Actions" (Settings → Pages)
- No secrets needed — everything uses `GITHUB_TOKEN`

### Concurrency

- Deploy job uses `concurrency: { group: "pages", cancel-in-progress: false }` to prevent overlapping deploys

## Versioning

- Semantic versioning (e.g., v1.0.0)
- Default bump: patch
- `feat:` commit prefix → minor bump
- `BREAKING CHANGE` → major bump
- Derived from the merge commit message on push to main

## Tools

| Tool | Purpose |
|------|---------|
| Ruff | Python linting + format check |
| markdownlint | Markdown validation |
| htmlproofer | HTML validation + link checking |
| RenderCV | YAML → CV rendering (markdown, HTML, PDF, PNG) |
| Jekyll | Static site generation |
| gh CLI | GitHub Release creation |
