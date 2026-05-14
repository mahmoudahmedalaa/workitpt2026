# AI Handover

## Current State

The repository has been cleaned into a working foundation and pushed to GitHub. Active code lives in:

- `workitpt/` - Flutter app.
- `workitptproject/` - TypeScript backend.
- `docs/` - architecture plan.

Local-only historical material lives in `archive/` and is ignored by git.

## Architecture Direction

Read `docs/TECH_STACK_ELEVATION_PLAN.md`.

Key decisions:

- Keep Flutter/Dart.
- Keep TypeScript backend.
- Modernize before rewriting.
- Move transactional platform toward PostgreSQL.
- Add Redis/BullMQ.
- Rework payments around Stripe webhooks and idempotency.

## Immediate Next Work

1. Make CI pass consistently.
2. Remove hardcoded mobile environment secrets/URLs.
3. Add backend validation and OpenAPI.
4. Add first tests around auth, booking, and payments.
5. Create ADRs before data/payment architecture changes.

## Known Risks

- Legacy mobile dependencies and Android/iOS build tooling are old.
- There are effectively no tests.
- Backend payment flow is not production-grade.
- MongoDB schema lacks several professional constraints/indexes.
- Cron jobs currently live inside the API process.

## 2026-05-15 Foundation Enablement Pass

Added root README, root `AGENTS.md`, `.clinerules`, AI rules, workflows, prompting guide, MVP checklist, GitHub Actions CI, MCP setup guide, and ADR-001.

Verification:

- `cd workitptproject && corepack yarn build` passed.
- `cd workitpt && flutter analyze --no-fatal-infos` passed with 6 pre-existing info-level findings.

Notes:

- Backend Firebase Admin config no longer imports a private `fbServices.json`; it builds from env-driven credentials.
- CI uses Flutter 3.13.9 and Node 20 as the current legacy baseline.
