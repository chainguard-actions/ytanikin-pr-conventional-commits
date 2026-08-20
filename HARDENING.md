<!-- markdownlint-disable -->

# Hardening Report: ytanikin--pr-conventional-commits/1.4.1

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **ytanikin--pr-conventional-commits/1.4.1** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Both workflow files reference actions using mutable version tags instead of pinned 40-character SHA commit hashes. This exposes the workflow to supply-chain attacks if the upstream action tag is moved or compromised.

Failing references:
- .github/workflows/pr_conventional_commits.yml: `uses: actions/checkout@v2`
- .github/workflows/test.yml: `uses: actions/checkout@v3`
- .github/workflows/test.yml: `uses: actions/setup-node@v3`

Each should be replaced with a full SHA pin, e.g. `actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v4`.

Locations:

- `.github/workflows/pr_conventional_commits.yml:10`
- `.github/workflows/test.yml:13`
- `.github/workflows/test.yml:17`

### missing-permissions (severity: medium)

Neither workflow file declares a top-level `permissions:` key, and no job in either file declares its own `permissions:` block. Without explicit permissions, the GITHUB_TOKEN is granted its default (often broad) permissions, violating the principle of least privilege.

Locations:

- `.github/workflows/pr_conventional_commits.yml:1`
- `.github/workflows/test.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, missing-permissions

**Notes:**

Fixed all three unpinned action references by resolving their full SHA hashes: actions/checkout@v2 → @0717577d45739eb3c851188b29f50ed6c0b2194e, actions/checkout@v3 → @a37ce9120846195fa4ece8f58b268e6043cb2f26, actions/setup-node@v3 → @3235b876344d2a9aa001b8d1453c930bba69e610. Added top-level permissions blocks to both workflow files: pr_conventional_commits.yml gets 'contents: read' and 'pull-requests: write' (needed for label management), while test.yml gets only 'contents: read' (sufficient for checkout and npm operations).

