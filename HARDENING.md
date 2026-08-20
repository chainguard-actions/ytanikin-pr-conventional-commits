<!-- markdownlint-disable -->

# Hardening Report: ytanikin--pr-conventional-commits/1.5.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **ytanikin--pr-conventional-commits/1.5.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### missing-permissions (severity: medium)

The workflow file .github/workflows/test.yml has no top-level `permissions:` key and no job-level `permissions:` key on its only job (`build-and-test`). Without explicit permissions, the workflow runs with the default repository permissions, which may be overly broad (e.g., write access to contents and pull-requests). A minimal permissions block such as `permissions: contents: read` should be added.

Locations:

- `.github/workflows/test.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** missing-permissions

**Notes:**

Added `permissions: contents: read` at the top level of `.github/workflows/test.yml`. The workflow only needs read access to the repository contents (checkout, npm install, npm test, docker build), so no additional permissions are required.

