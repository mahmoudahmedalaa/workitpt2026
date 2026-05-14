# AGENTS.md - WorkitPT AI Operating Manual

Read this before touching code. This repository is being prepared for a professional mobile marketplace launch, so AI agents must favor correctness, security, verification, and clear documentation over quick-looking changes.

## Project Context

| Field | Value |
|:------|:------|
| App | WorkitPT |
| Product | Fitness marketplace for customers and personal trainers |
| Mobile | Flutter/Dart in `workitpt/` |
| Backend | TypeScript/Express/Mongoose in `workitptproject/` |
| Architecture Direction | Keep Flutter, modernize; keep TypeScript; migrate transactional domain toward PostgreSQL; redesign payments with Stripe webhooks |
| Current Status | Clean foundation repo, legacy app/API awaiting hardening |

## Read Order

Before implementation, read these files in order:

1. `docs/TECHNICAL_RECOMMENDATIONS.md`
2. `docs/PLATFORM_ELEVATION_MASTER_PLAN.md`
3. `docs/COMPONENT_REVAMP_TASK_INDEX.md`
4. `docs/TECH_STACK_ELEVATION_PLAN.md`
5. `02-agent/AGENTS.md`
6. `02-agent/rules/AUTONOMY.md`
7. `02-agent/rules/CODE_QUALITY.md`
8. `02-agent/rules/SECURITY.md`
9. `03-workflows/DEVELOPMENT.md`
10. `03-workflows/TESTING.md`

## Non-Negotiables

- Do not move away from Flutter unless an ADR explicitly approves it.
- Do not commit secrets, `.env` files, keystores, service account private keys, or real credentials.
- Do not let the backend receive raw card numbers or CVC values.
- Do not treat frontend redirects as payment truth; payment truth must come from verified Stripe webhooks.
- Do not change database schema without a migration plan and rollback notes.
- Do not delete source folders or archived material unless the user explicitly asks.
- Do not commit generated build outputs, `node_modules`, `Pods`, `.dart_tool`, or `build`.
- Do not add major dependencies without explaining why and updating docs.
- Do not make broad rewrites when a narrow, verified change can move the project forward.

## Act Autonomously

Agents may act without asking when:

- Running verification commands.
- Fixing clear build or lint issues within the touched scope.
- Updating documentation to reflect verified project reality.
- Adding tests for existing behavior.
- Improving `.gitignore`, README, CI, or local setup files in a non-destructive way.
- Following patterns already present in the codebase.

## Explain Then Act

Agents should briefly explain before:

- Multi-file refactors.
- Dependency updates.
- CI/CD workflow changes.
- Mobile build tool upgrades.
- Backend validation, logging, or testing framework additions.

## Ask First

Agents must ask before:

- Changing the chosen mobile framework.
- Migrating database technology.
- Changing auth or payment architecture.
- Removing features.
- Touching production data.
- Force-pushing to a branch that other humans are actively using.

## Verification Expectations

Backend:

```bash
cd workitptproject
corepack yarn install --frozen-lockfile
corepack yarn build
```

Mobile:

```bash
cd workitpt
flutter pub get
flutter analyze --no-fatal-infos
```

If legacy debt makes a command fail, record the failure clearly and keep the change scoped. Never hide failing checks.

## Handover Rule

At the end of a substantial task, update or create a short handover note when useful:

- What changed.
- What was verified.
- What remains risky.
- Exact next recommended step.

Use `docs/AI_HANDOVER.md` for ongoing cross-agent continuity.
