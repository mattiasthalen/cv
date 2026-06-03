# Daana Employer Update Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Update the CV to show Daana as the current employer (from May 2026) with the Perspetivo engagement, close out Enqore, refresh the Technologies line, and remove two stray `.docx` files.

**Architecture:** The CV is YAML-driven. Two identical source files must both be edited — root `mattias_thalen__cv.yaml` (feeds RenderCV → `README.md` + PDF) and `website/mattias_thalen__cv.yaml` (feeds the React site, imported by `website/src/App.tsx`). No CV data is hardcoded in React components. After editing, `make cv` regenerates `README.md` and the PDF.

**Tech Stack:** RenderCV (Python, via `uv`), YAML, Vite + React + TypeScript (website).

**Spec:** `docs/superpowers/specs/2026-06-03-daana-employer-update-design.md`

**Working directory:** worktree at `.worktrees/daana-employer-update` on branch `feat/daana-employer-update` (already created; the spec is already committed there).

---

## File Structure

- **Modify:** `mattias_thalen__cv.yaml` — experience + skills sections (root source for PDF/README).
- **Modify:** `website/mattias_thalen__cv.yaml` — same edits, byte-identical in changed regions.
- **Regenerate:** `README.md` and `rendercv_output/*` via `make cv`.
- **Delete (untracked, in the primary checkout — not the worktree):**
  `Kompetensmatris - 2 BI-utveckling och förvaltning - Mattias Thalén (ifylld).docx`,
  `Kompetenssammanställning - Senior Power BI-Specialist Arkitekt - Mattias Thalén.docx`.

All shell commands assume cwd is the worktree root:
`/Users/mattiasthalen/Repos/mattiasthalen/cv/.worktrees/daana-employer-update`.

---

## Task 1: Add Daana entry and close out Enqore (root YAML)

**Files:**
- Modify: `mattias_thalen__cv.yaml` (experience section, ~lines 18–28)

- [ ] **Step 1: Apply the edit**

Replace this exact block:

```yaml
    experience:
      - company: Enqore
        position: Analytics Consultant
        start_date: 2025
        end_date: present
        highlights:
          - "**Avarn Security** (Microsoft Fabric, dlt, dbt): The client wanted to future-proof their data platform for ML/AI capabilities. Serving as architect and Qlik/Fabric SME alongside Atea Norway, designing the migration of the ETL layer for their P&L solution (~15 data sources) from Qlik into Microsoft Fabric. A pilot Power BI app is being built in parallel to validate the new platform for end users."
          - "**Löfbergs Coffee** (Microsoft Fabric, dlt, SQLMesh, Power BI): An international coffee company facing QlikView end-of-life needed a full platform migration. As lead developer in a team of six, I define the architecture and mentor other developers while migrating ~20 QlikView apps across finance, operations, and sales into Microsoft Fabric with Power BI. The new platform enables self-service analytics and ML/AI capabilities that were not possible on QlikView."
```

with:

```yaml
    experience:
      - company: Daana
        position: Data Engineer & Architect
        start_date: 2026-05
        end_date: present
        highlights:
          - "**Perspetivo** (BigQuery, daana-cli, Airbyte, Dataform): Joining a team of six — two of us from Daana driving the framework work — to build a declarative, AI-generated data platform on Daana's framework ([daana.dev](https://daana.dev)) and the Unified Star Schema. Ingestion runs through Airbyte, with the bulk of the modeling generated via daana-cli and light transformation in Dataform on BigQuery."

      - company: Enqore
        position: Analytics Consultant
        start_date: 2025
        end_date: 2026-05
        highlights:
          - "**Avarn Security** (Microsoft Fabric, dlt, dbt): The client wanted to future-proof their data platform for ML/AI capabilities. Served as architect and Qlik/Fabric SME alongside Atea Norway, designing the migration of the ETL layer for their P&L solution (~15 data sources) from Qlik into Microsoft Fabric. A pilot Power BI app was built in parallel to validate the new platform for end users."
          - "**Löfbergs Coffee** (Microsoft Fabric, dlt, SQLMesh, Power BI): An international coffee company facing QlikView end-of-life needed a full platform migration. As lead developer in a team of six, I defined the architecture and mentored other developers, migrating ~20 QlikView apps across finance, operations, and sales into Microsoft Fabric with Power BI. The new platform enabled self-service analytics and ML/AI capabilities that were not possible on QlikView."
```

This: (a) inserts the new Daana entry above Enqore, (b) changes Enqore `end_date` from `present` to `2026-05`, (c) past-tenses the Avarn highlight (`Serving`→`Served`, `is being built`→`was built`), and (d) past-tenses the Löfbergs highlight (`I define...and mentor...while migrating`→`I defined...and mentored, migrating`, `enables`→`enabled`). The Jaktia, Arctic Paper, and Volvohandlarförening highlights are untouched.

- [ ] **Step 2: Verify the YAML still parses and shows the new structure**

Run:
```bash
uv run python -c "import yaml; d=yaml.safe_load(open('mattias_thalen__cv.yaml')); exp=d['cv']['sections']['experience']; print([(e['company'], e.get('start_date'), e.get('end_date')) for e in exp])"
```
Expected output:
```
[('Daana', datetime.date(2026, 5, 1), 'present'), ('Enqore', 2025, datetime.date(2026, 5, 1)), ('Epical', 2023, 2025), ('Cytiva', 2010, 2023)]
```
(Daana first, Enqore closed at 2026-05; no parse error.)

- [ ] **Step 3: Commit**

```bash
git add mattias_thalen__cv.yaml
git commit -m "feat(cv): move current employer from Enqore to Daana

Add Daana (Data Engineer & Architect, from May 2026) with the Perspetivo
engagement, close out Enqore at May 2026, and past-tense the Avarn and
Löfbergs highlights now that the Enqore role has ended."
git push
```

---

## Task 2: Update the Technologies line (root YAML)

**Files:**
- Modify: `mattias_thalen__cv.yaml` (skills section, ~line 130)

- [ ] **Step 1: Apply the edit**

Replace this exact line:

```yaml
        details: Microsoft Fabric, Qlik Sense, Azure Data Factory, dbt, SQLMesh, dlt, DuckDB
```

with:

```yaml
        details: Microsoft Fabric, BigQuery, Qlik Sense, Azure Data Factory, dbt, SQLMesh, dlt, Dataform, Airbyte, DuckDB
```

- [ ] **Step 2: Verify**

Run:
```bash
uv run python -c "import yaml; d=yaml.safe_load(open('mattias_thalen__cv.yaml')); t=[s['details'] for s in d['cv']['sections']['skills'] if s['label']=='Technologies'][0]; assert 'BigQuery' in t and 'Dataform' in t and 'Airbyte' in t, t; print(t)"
```
Expected: prints the line containing BigQuery, Dataform, and Airbyte (no AssertionError).

- [ ] **Step 3: Commit**

```bash
git add mattias_thalen__cv.yaml
git commit -m "feat(cv): add BigQuery, Dataform, and Airbyte to technologies"
git push
```

---

## Task 3: Mirror both edits into the website YAML

**Files:**
- Modify: `website/mattias_thalen__cv.yaml`

The website YAML is identical to the root in these regions. Apply the **same two edits** from Task 1 Step 1 and Task 2 Step 1 to `website/mattias_thalen__cv.yaml`.

- [ ] **Step 1: Apply the Task 1 edit** to `website/mattias_thalen__cv.yaml` (same old/new block as Task 1 Step 1).

- [ ] **Step 2: Apply the Task 2 edit** to `website/mattias_thalen__cv.yaml` (same old/new line as Task 2 Step 1).

- [ ] **Step 3: Verify the two YAML files are identical**

Run:
```bash
diff mattias_thalen__cv.yaml website/mattias_thalen__cv.yaml && echo "IDENTICAL"
```
Expected: `IDENTICAL` (no diff output). If a pre-existing difference exists outside the changed regions, confirm it is unrelated to this change; the experience and Technologies regions must match exactly.

- [ ] **Step 4: Verify the website still type-checks/builds**

Run:
```bash
cd website && npm ci --silent && npm run build && cd ..
```
Expected: build completes with no TypeScript errors (Daana renders as the top experience entry — no schema change, so types are unaffected).

- [ ] **Step 5: Commit**

```bash
git add website/mattias_thalen__cv.yaml
git commit -m "feat(website): mirror Daana employer update into website CV data"
git push
```

---

## Task 4: Remove the two stray `.docx` files

**Files:**
- Delete (untracked, in the **primary checkout**, not the worktree):
  `~/Repos/mattiasthalen/cv/Kompetensmatris - 2 BI-utveckling och förvaltning - Mattias Thalén (ifylld).docx`
  `~/Repos/mattiasthalen/cv/Kompetenssammanställning - Senior Power BI-Specialist Arkitekt - Mattias Thalén.docx`

These files are untracked and live only in the primary working copy, so this is filesystem cleanup with **no commit**.

- [ ] **Step 1: Delete them**

```bash
rm -f ~/Repos/mattiasthalen/cv/*.docx
```

- [ ] **Step 2: Verify they are gone**

```bash
ls ~/Repos/mattiasthalen/cv/*.docx 2>/dev/null && echo "STILL PRESENT" || echo "REMOVED"
```
Expected: `REMOVED`.

---

## Task 5: Regenerate README and PDF

**Files:**
- Regenerate: `README.md`, `rendercv_output/*`

- [ ] **Step 1: Run the render**

```bash
make cv
```
Expected: RenderCV renders without error and `README.md` is overwritten from `rendercv_output/Mattias_Thalén_CV.md`. If `uv`/RenderCV is unavailable locally, skip this task and note that CI's "render CV outputs" job will regenerate on push.

- [ ] **Step 2: Verify the regenerated README**

```bash
grep -n "Daana\|Perspetivo\|May 2026" README.md | head
```
Expected: matches showing the Daana entry, the Perspetivo highlight, and "May 2026" dates.

- [ ] **Step 3: Commit the regenerated outputs**

```bash
git add README.md rendercv_output
git commit -m "chore(cv): render CV outputs for Daana update"
git push
```

---

## Task 6: Open the draft PR

- [ ] **Step 1: Create the draft PR**

```bash
gh pr create --draft \
  --title "feat(cv): update current employer to Daana" \
  --body "$(cat <<'EOF'
## Summary
- Current employer changed from Enqore to Daana (Data Engineer & Architect, from May 2026).
- Added the Perspetivo engagement (declarative, AI-generated data platform on Daana's framework; BigQuery, daana-cli, Airbyte, Dataform).
- Closed Enqore at May 2026; Avarn + Löfbergs highlights shifted to past tense.
- Added BigQuery, Dataform, Airbyte to Technologies.
- Regenerated README + PDF; removed two stray .docx files.

## Spec & Plan
- Spec: docs/superpowers/specs/2026-06-03-daana-employer-update-design.md
- Plan: docs/superpowers/plans/2026-06-03-daana-employer-update.md
EOF
)"
```
Expected: a draft PR is created against `main`.

- [ ] **Step 2: Report the PR URL** back for review. Do **not** mark ready or enable auto-merge (per repo workflow — that happens during the finishing-a-development-branch step).

---

## Self-Review (completed during planning)

- **Spec coverage:** §1 cleanup → Task 4; §2 experience (Daana + Perspetivo + Enqore close + Avarn/Löfbergs tense) → Task 1 (root) + Task 3 (website); §3 date granularity → Task 1 (`2026-05` on both dates); §4 skills → Task 2 + Task 3; §5 regenerate & ship → Task 5 + Task 6; verification items → Steps across Tasks 1–5. No gaps.
- **Placeholder scan:** No TBDs; every edit shows exact old/new content and every verification shows the exact command + expected output.
- **Consistency:** Company name `Daana`, position `Data Engineer & Architect`, dates `2026-05`, and the Technologies after-state are used identically across root and website tasks.
