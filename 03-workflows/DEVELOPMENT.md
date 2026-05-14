# Development Workflow

## Branching

- `main` is the clean foundation branch.
- Use feature branches for meaningful work:
  - `feature/payment-webhooks`
  - `fix/flutter-env-config`
  - `refactor/backend-validation`
  - `docs/architecture-adrs`

## Commit Style

Use conventional-style messages:

```text
docs: add agent operating guide
chore: add CI foundation
fix: remove committed env files
feat: add payment webhook handler
```

## Local Backend Loop

```bash
cd workitptproject
corepack enable
corepack yarn install --frozen-lockfile
corepack yarn build
corepack yarn dev
```

## Local Mobile Loop

```bash
cd workitpt
flutter pub get
flutter analyze --no-fatal-infos
flutter run --flavor dev --dart-define=flavor=dev
```

## Working With Legacy Debt

The app and API are old. If a baseline check fails:

1. Capture the exact command and failure.
2. Decide whether the failure is caused by your change.
3. If caused by your change, fix it before committing.
4. If pre-existing, document it and create a follow-up task.

## Before Commit

```bash
git status --short
git diff --check
```

Then run the relevant backend/mobile checks.
