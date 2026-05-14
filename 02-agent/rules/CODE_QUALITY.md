# Code Quality Rules

## Flutter

- Keep the existing feature-first structure.
- Prefer BLoC patterns already present unless a documented refactor approves a change.
- Keep API calls behind repositories/controllers rather than directly in widgets.
- Use generated models consistently.
- Avoid adding new global state.
- Remove debug `print`/`debugPrint` from production paths as part of hardening.
- Do not hardcode API hosts, socket URLs, or secrets in Dart.

## Backend

- Keep controller logic thin.
- Put business rules in services or dedicated domain modules.
- Add runtime validation before service logic.
- Prefer typed request/response DTOs.
- Avoid `any`; use explicit interfaces or `unknown` with narrowing.
- Avoid financial state changes without idempotency and transaction thinking.
- Add indexes and migrations when changing persistence models.

## Testing Priority

Highest priority:

- Auth/session logic.
- Booking capacity and status transitions.
- Payment intent/webhook/ledger logic.
- Trainer/customer profile updates.
- Notification and chat delivery boundaries.

## Before Marking Work Done

- Run the relevant verification command.
- State what passed and what failed.
- Do not claim production readiness unless CI, tests, security, and environment separation are in place.
