# Remove Devcontainer Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Remove the unused devcontainer configuration from the repository.

**Architecture:** Delete `.devcontainer/` directory and clean up the reference in `_config.yml`.

**Tech Stack:** Git, Jekyll config (YAML)

---

### Task 1: Remove devcontainer and clean up config

**Files:**
- Delete: `.devcontainer/Dockerfile`
- Delete: `.devcontainer/devcontainer.json`
- Delete: `.devcontainer/.zshrc`
- Delete: `.devcontainer/post_install.py`
- Modify: `_config.yml:13` (remove `.devcontainer/` from exclude list)

**Step 1: Delete the `.devcontainer/` directory**

```bash
rm -rf .devcontainer/
```

**Step 2: Remove `.devcontainer/` from `_config.yml` exclude list**

In `_config.yml`, remove line 13:
```yaml
  - .devcontainer/
```

**Step 3: Verify no dangling references**

```bash
grep -r "devcontainer" . --include="*.yml" --include="*.yaml" --include="*.json" --include="*.md"
```

Expected: Only hits in `docs/superpowers/` (design doc and this plan).

**Step 4: Commit**

```bash
git add -A
git commit -m "chore: remove unused devcontainer configuration"
```

**Step 5: Open draft PR**

```bash
gh pr create --draft --title "chore: remove unused devcontainer" --body "Remove devcontainer setup — development happens on WSL directly."
```
