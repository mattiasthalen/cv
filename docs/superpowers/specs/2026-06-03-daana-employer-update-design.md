# Daana Employer Update — Design

**Date:** 2026-06-03
**Status:** Approved (pending spec review)

## Context

As of 26 May 2026, Mattias works at **Daana** (getdaana.com) as a **Data Engineer
& Architect**, not at **Enqore**. The CV must reflect the employer change, add the
new Daana client engagement (**Perspetivo**), and surface the new technologies in
use. Two stray, untracked `.docx` files left in the repo root must also be removed.

The CV is YAML-driven with two sources of truth that must stay identical:

- **Root** `mattias_thalen__cv.yaml` → RenderCV → `README.md` + PDF (via `make cv`).
- **`website/mattias_thalen__cv.yaml`** → React site (imported by `website/src/App.tsx`).

No CV data is hardcoded in the React components — they read the YAML — so the edits
are confined to the two YAML files plus the generated `README.md`/PDF outputs.

## Goals

- Reflect the Enqore → Daana employer change effective May 2026.
- Add the Perspetivo engagement under Daana.
- Update Technologies to include the new stack.
- Remove the two untracked `.docx` files.
- Keep both YAML files identical and regenerate downstream outputs.

## Non-Goals

- No change to the summary (keeps its current Qlik → Microsoft Fabric positioning).
- No change to website layout, components, styling, or any other section
  (open source, certifications, personal projects, education, skills disciplines/
  methodologies/languages).
- No restructuring of Epical or Cytiva entries.

## Design

### 1. Cleanup

Delete the two untracked files from the repo root:

- `Kompetensmatris - 2 BI-utveckling och förvaltning - Mattias Thalén (ifylld).docx`
- `Kompetenssammanställning - Senior Power BI-Specialist Arkitekt - Mattias Thalén.docx`

### 2. Experience section (both YAML files, kept identical)

**New top entry — Daana**

- `company: Daana`
- `position: Data Engineer & Architect`
- `start_date: 2026-05`
- `end_date: present`
- Highlights:
  - **Perspetivo** — newly joined (~1 week in), barely started. A team of six, two
    of whom are from Daana driving the framework work. Building a declarative,
    AI-generated data platform on Daana's framework ([daana.dev](https://daana.dev))
    and the Unified Star Schema. Ingestion through Airbyte; the bulk of the modeling
    is generated via daana-cli, with light transformation in Dataform on BigQuery.
    Tech tag: `(BigQuery, daana-cli, Airbyte, Dataform)`.

  Proposed wording:
  > **Perspetivo** (BigQuery, daana-cli, Airbyte, Dataform): Joining a team of six —
  > two of us from Daana driving the framework work — to build a declarative,
  > AI-generated data platform on Daana's framework ([daana.dev](https://daana.dev))
  > and the Unified Star Schema. Ingestion runs through Airbyte, with the bulk of the
  > modeling generated via daana-cli and light transformation in Dataform on BigQuery.

**Enqore** (existing entry, now closed)

- `start_date: 2025` (unchanged)
- `end_date: 2026-05` (was `present`)
- `position: Analytics Consultant` (unchanged)
- Highlights: **keep all five** — Avarn Security, Löfbergs Coffee, Jaktia,
  Arctic Paper, Volvohandlarförening. (Avarn stays under Enqore; it did **not** move
  to Daana.)
- **Tense:** shift the two formerly-ongoing engagements to past tense, since the role
  has ended:
  - **Avarn Security:** "...Serving as architect and Qlik/Fabric SME alongside Atea
    Norway, designing the migration..." → "...Served as architect and Qlik/Fabric SME
    alongside Atea Norway, designing the migration of the ETL layer for their P&L
    solution (~15 data sources) from Qlik into Microsoft Fabric. A pilot Power BI app
    was built in parallel to validate the new platform for end users."
  - **Löfbergs Coffee:** "...As lead developer in a team of six, I define the
    architecture and mentor other developers while migrating..." → "...As lead
    developer in a team of six, I defined the architecture and mentored other
    developers, migrating ~20 QlikView apps across finance, operations, and sales into
    Microsoft Fabric with Power BI. The new platform enabled self-service analytics
    and ML/AI capabilities that were not possible on QlikView."
  - Jaktia, Arctic Paper, Volvohandlarförening: unchanged (already past tense).

### 3. Date granularity

Use month precision **only** on the two dates affected by the transition:

- Enqore `end_date: 2026-05`
- Daana `start_date: 2026-05`

These render as "May 2026" via the existing `single_date: MONTH_ABBREVIATION YEAR`
template. All older entries keep their year-only dates — a deliberate convention
(recent roles dated more precisely). Time spans (`show_time_spans_in: [experience]`)
recompute automatically.

### 4. Skills

Add **BigQuery, Dataform, Airbyte** to the Technologies line. daana-cli is internal
framework tooling and is not added to the public Technologies list (it appears in the
Perspetivo highlight instead).

- Before: `Microsoft Fabric, Qlik Sense, Azure Data Factory, dbt, SQLMesh, dlt, DuckDB`
- After: `Microsoft Fabric, BigQuery, Qlik Sense, Azure Data Factory, dbt, SQLMesh, dlt, Dataform, Airbyte, DuckDB`

### 5. Regenerate & ship

- Run `make cv` to rebuild `README.md` and the RenderCV PDF output from the root YAML.
- Ship via the `feat/daana-employer-update` branch and a **draft** PR, following the
  repo workflow (conventional commits, push every commit, regular merge commit on
  ready).

## Verification

- Both YAML files parse and contain the Daana entry, the closed Enqore entry, and the
  updated Technologies line.
- The two YAML files are byte-identical in the changed sections.
- `make cv` regenerates `README.md` without error; README shows Daana → Enqore →
  Cytiva in order with "May 2026" dates.
- Website builds (`npm run build` in `website/`) without type errors.
- The two `.docx` files are gone.
