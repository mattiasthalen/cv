# CV Project Restructuring Design

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add two new client projects and restructure the projects section with client-grouped naming.

**Architecture:** Edit the `projects` section of `mattias_thalen__cv.yaml`. Add two new `publication_entry` entries, rename one existing entry, and reorder all entries by date (newest first) with same-client entries adjacent.

**Tech Stack:** rendercv (YAML-based CV generator)

---

## Goal

Add two new client projects (Avarn Security migration, Löfbergs Coffee) and restructure the projects section so entries are grouped by client with descriptive assignment names for multi-project clients.

## Approach

Use the existing `publication_entry` structure with one entry per assignment. Multi-project clients get a `"Client — Assignment"` title format. Single-project clients keep just the client name. Entries are ordered by date (newest first), with same-client entries adjacent.

## New Entries

### Avarn Security — Qlik to Fabric Migration (2026)

- **Tech stack:** Microsoft Fabric, dlt, SQLMesh
- **Summary:** Migration of ELT processes from Qlik to Microsoft Fabric. Using dlt for ingestion and SQLMesh for transformation, following a medallion architecture. Qlik remains the BI layer.

### Löfbergs Coffee (2026)

- **Tech stack:** Microsoft Fabric, dlt, SQLMesh, Power BI
- **Summary:** Full migration from QlikView to Microsoft Fabric. Using dlt for ingestion and SQLMesh for transformation, following a medallion architecture. Power BI for consumption.

## Existing Entry Changes

- Rename `"Avarn Security"` → `"Avarn Security — Maintenance"` (keep date 2025, same tech/summary)

## Final Project Ordering

1. Avarn Security — Qlik to Fabric Migration (2026)
2. Löfbergs Coffee (2026)
3. Jaktia (2025)
4. Arctic Paper (2025)
5. Avarn Security — Maintenance (2025)
6. Volvohandlarförening (2025)
7. Swedish Government Agency (2024)
8. Life Science Corporation (2024)
9. Sveriges Kommuner & Regioner (2024)
10. Vinnova — Sweden's Innovation Agency (2023)
11. Internationella Engelska Skolan (2023)

## What Stays the Same

- All other entries unchanged
- YAML structure (publication_entry template)
- Single-project clients keep their current title (no suffix)

---

## Implementation Tasks

### Task 1: Add two new project entries and rename existing Avarn entry

**Files:**
- Modify: `mattias_thalen__cv.yaml:75-134` (the `projects:` section)

**Step 1: Rename existing Avarn Security entry**

Change line 91 from:
```yaml
      - title: Avarn Security
```
to:
```yaml
      - title: Avarn Security — Maintenance
```

**Step 2: Add two new entries at the top of the projects section**

Insert the following after line 75 (`projects:`) and before the Jaktia entry:

```yaml
      - title: Avarn Security — Qlik to Fabric Migration
        date: 2026
        authors:
          - Microsoft Fabric
          - dlt
          - SQLMesh
        summary: Migration of ELT processes from Qlik to Microsoft Fabric. Using dlt for ingestion and SQLMesh for transformation, following a medallion architecture. Qlik remains the BI layer.

      - title: Löfbergs Coffee
        date: 2026
        authors:
          - Microsoft Fabric
          - dlt
          - SQLMesh
          - Power BI
        summary: Full migration from QlikView to Microsoft Fabric. Using dlt for ingestion and SQLMesh for transformation, following a medallion architecture. Power BI for consumption.
```

**Step 3: Verify the final project order in the YAML**

The `projects:` section should now list entries in this order:
1. Avarn Security — Qlik to Fabric Migration (2026)
2. Löfbergs Coffee (2026)
3. Jaktia (2025)
4. Arctic Paper (2025)
5. Avarn Security — Maintenance (2025)
6. Volvohandlarförening (2025)
7. Swedish Government Agency (2024)
8. Life Science Corporation (2024)
9. Sveriges Kommuner & Regioner (2024)
10. Vinnova — Sweden's Innovation Agency (2023)
11. Internationella Engelska Skolan (2023)

**Step 4: Build the CV to verify**

Run: `cd /workspace && rendercv render mattias_thalen__cv.yaml`
Expected: Successful render with no errors. Check the output PDF/HTML for correct ordering and formatting.

**Step 5: Commit**

```bash
git add mattias_thalen__cv.yaml
git commit -m "feat: add Löfbergs Coffee and Avarn Security migration projects, restructure project naming"
```
