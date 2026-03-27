# Rules

- NEVER write rules as "do X". Always phrase rules as "NEVER do Y" to clearly define what to avoid.

# Git Workflow

- NEVER commit directly to main.
- NEVER use non-conventional commit formats. See .claude/rules/conventional-commits.md
- NEVER leave commits unpushed.
- NEVER use raw git for remote operations when a CLI is available for the remote platform (e.g., `gh` for GitHub, `az repos` for Azure DevOps).
- NEVER rely on global git email. Before committing, check `git config --local user.email`. If not set, prompt the user.
- NEVER open PRs as ready. Always open as draft (e.g., `gh pr create --draft`).
- NEVER enable auto-merge on draft PRs. Enable auto-merge only after the PR is marked as ready (e.g., `gh pr ready` then `gh pr merge --auto --merge`).
- NEVER enable auto-merge on PRs from external contributors. Only repo admins/owners may use auto-merge.
- NEVER use squash or rebase merges. Always use regular merge commits (`--merge`).

# Repo Setup

- NEVER leave the default branch unprotected. Require PRs (no direct pushes) with at least one approving review. Admins may bypass.
- NEVER leave auto-merge disabled on a new repo.
- NEVER leave auto-delete of merged branches disabled on a new repo.

# Superpowers

- NEVER store plans and design specs in `docs/plans/`. Store plans in `docs/superpowers/plans/` and design specs in `docs/superpowers/specs/`.
- NEVER default plans to sequential execution. Optimize for parallelization.
- NEVER dispatch parallel subagents into the same worktree. Each subagent MUST work in its own isolated worktree (via `using-git-worktrees`).
- NEVER use `isolation: "worktree"` when the parent is on a non-main branch — it branches from main, not the parent branch. Create worktrees manually from the current branch (via `using-git-worktrees`) instead.
