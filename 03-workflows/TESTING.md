# Testing Workflow

## Current Reality

The initial repo has almost no meaningful tests. That is a launch blocker. Do not treat the absence of tests as permission to continue without them.

## Target Test Pyramid

- Unit tests: business logic, validators, state transitions.
- Integration tests: API endpoints, repositories, database behavior.
- Mobile widget/BLoC tests: auth, booking, payment, profile flows.
- E2E/UAT: register, verify, login, trainer search, booking, payment, chat, notifications.

## Backend Commands

Current baseline:

```bash
cd workitptproject
corepack yarn build
```

Target future commands:

```bash
corepack yarn lint
corepack yarn test
corepack yarn test:integration
```

## Mobile Commands

Current baseline:

```bash
cd workitpt
flutter pub get
flutter analyze --no-fatal-infos
```

Target future commands:

```bash
flutter test
flutter test integration_test
```

## Critical Areas To Test First

- Backend `calculateCharge` and wallet ledger behavior.
- Booking add/list/status transitions.
- Auth login/register/verification/password reset.
- Stripe PaymentIntent and webhook finalization.
- Flutter session manager token persistence.
- Flutter booking and payment BLoCs.
