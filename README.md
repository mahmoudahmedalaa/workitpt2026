# WorkitPT

WorkitPT is a cross-platform fitness marketplace for iOS and Android. The current production candidate consists of a Flutter mobile app and a TypeScript/Express backend API.

This repository is the new clean working foundation for the 2026 rebuild and hardening effort. Old source drops, PDFs, zips, and vendor handoff files are preserved locally in `archive/` but are intentionally not tracked in git.

## Repository Map

```text
.
├── workitpt/                      # Flutter mobile app
├── workitptproject/               # TypeScript backend API
├── docs/                          # Architecture notes and technical plans
├── 02-agent/                      # AI-agent operating rules
├── 03-workflows/                  # Development, testing, deployment workflows
├── 04-prompting/                  # AI collaboration guidance
├── 05-checklists/                 # Launch and production readiness checklists
├── .github/workflows/             # CI checks
└── archive/                       # Local-only historical material, ignored by git
```

## Current Technical Direction

Read [docs/TECH_STACK_ELEVATION_PLAN.md](docs/TECH_STACK_ELEVATION_PLAN.md) before making architecture decisions.

The short version:

- Keep Flutter/Dart for the mobile app.
- Keep TypeScript for the backend.
- Modernize the Flutter app instead of rewriting it.
- Move core transactional data toward PostgreSQL.
- Add Redis for jobs, locks, rate limits, and realtime scale.
- Redesign payments around Stripe PaymentIntents, SetupIntents, webhooks, and preferably Stripe Connect for trainer payouts.
- Add OpenAPI contracts, tests, CI/CD, observability, and production security hardening before launch.

## Local Setup

### Prerequisites

- Flutter 3.13.9 for the current legacy app baseline.
- Dart 3.1.5, bundled with Flutter 3.13.9.
- Node.js 20 LTS for the backend.
- Corepack for Yarn.
- Xcode and CocoaPods for iOS builds.
- Android Studio/SDK for Android builds.

The repo currently tracks the Flutter lockfile and Android Gradle wrapper so other machines and AI agents have a reproducible starting point.

### Backend

```bash
cd workitptproject
corepack enable
corepack yarn install --frozen-lockfile
cp .env.example .env
# Fill .env with local/staging values.
corepack yarn build
corepack yarn dev
```

Important:

- Never commit `.env`, `.env.*`, credentials, keystores, or private service account files.
- The backend currently uses MongoDB/Mongoose and is planned for a PostgreSQL migration.
- `yarn.lock` is the canonical backend lockfile. Do not add `package-lock.json`.

### Mobile

```bash
cd workitpt
flutter pub get
flutter run --flavor dev --dart-define=flavor=dev
```

Build commands from the legacy project:

```bash
flutter build apk --flavor dev --dart-define=flavor=dev
flutter build appbundle --flavor prod --dart-define=flavor=prod
```

## AI Agent Instructions

Before any AI agent changes code, it must read:

1. [AGENTS.md](AGENTS.md)
2. [docs/TECH_STACK_ELEVATION_PLAN.md](docs/TECH_STACK_ELEVATION_PLAN.md)
3. [02-agent/AGENTS.md](02-agent/AGENTS.md)
4. [03-workflows/DEVELOPMENT.md](03-workflows/DEVELOPMENT.md)
5. [03-workflows/TESTING.md](03-workflows/TESTING.md)

For Cline/DeepSeek, also read [.clinerules](.clinerules).

## Verification Baseline

Run these before committing meaningful code changes:

```bash
# Backend
cd workitptproject
corepack yarn install --frozen-lockfile
corepack yarn build

# Mobile
cd ../workitpt
flutter pub get
flutter analyze --no-fatal-infos
```

The mobile baseline currently allows info-level analyzer findings because the legacy app has a few pre-existing generated/deprecated-code infos. The modernization plan should gradually turn this into a strict `flutter analyze` gate.

## Git Rules

- `main` is the clean foundation branch.
- Use feature branches for substantial work.
- Commit in small, reviewable chunks.
- Do not commit `archive/`, build outputs, `.env` files, keystores, or local IDE state.
- Do not rewrite the mobile framework, backend framework, database, payment architecture, or auth model without an ADR in `docs/architecture/`.

## Current Status

Foundation is clean and pushed to GitHub. The next engineering milestone is CI-backed build verification, followed by environment cleanup, OpenAPI contracts, tests, and payment/data hardening.
