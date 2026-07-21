# 7-Zip (personal fork)

MSVC Windows builds of 7-Zip with dark-mode File Manager support.

## Engineering standards

Follow AppBase `docs/org-standards/` with personal-repo overrides (`personal-repos.md`):

- Runners: `ubuntu-latest` / `windows-latest`
- Checkout: `actions/checkout@v7`
- Release track B: manual `.github/workflows/release.yml`
- Quality gate: `scripts/validate.ps1` (nmake PLATFORM=x64; needs MSVC)

## OpenWiki

This repository has documentation located in the /openwiki directory.

Start here:

- [OpenWiki quickstart](openwiki/quickstart.md)

OpenWiki includes repository overview, architecture notes, workflows, domain concepts, operations, integrations, testing guidance, and source maps.

When working in this repository, read the OpenWiki quickstart first, then follow its links to the relevant architecture, workflow, domain, operation, and testing notes.
