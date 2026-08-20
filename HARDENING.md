<!-- markdownlint-disable -->

# Hardening Report: ytanikin--pr-conventional-commits/1.4.2

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **ytanikin--pr-conventional-commits/1.4.2** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### missing-permissions (severity: medium)

Neither workflow file has a top-level `permissions:` key, and neither job within them has a job-level `permissions:` key. Without explicit permissions, workflows inherit the repository's default token permissions (which may be `write-all`), granting unnecessarily broad access. Each workflow should declare minimal required permissions (e.g., `permissions: contents: read`) at the top level or per job.

Locations:

- `.github/workflows/pr_conventional_commits.yml:1`
- `.github/workflows/test.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** missing-permissions

**Notes:**

Added top-level `permissions:` blocks to both workflow files:
- `.github/workflows/pr_conventional_commits.yml`: Added `contents: read` and `pull-requests: write` (the action validates PR titles and adds labels, requiring write access to pull requests).
- `.github/workflows/test.yml`: Added `contents: read` only (the workflow just checks out code and runs npm tests/builds, requiring no elevated permissions).

