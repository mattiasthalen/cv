# Remove Devcontainer

## Context

The devcontainer ("Claude Code Sandbox") is no longer used — development happens directly on WSL. It adds maintenance burden with no benefit.

## Changes

1. Delete `.devcontainer/` directory (Dockerfile, devcontainer.json, .zshrc, post_install.py)
2. Remove `.devcontainer/` entry from `_config.yml` exclude list

## Not affected

- No CI workflows reference the devcontainer
- No other files depend on it
- Local development (WSL) is unaffected
