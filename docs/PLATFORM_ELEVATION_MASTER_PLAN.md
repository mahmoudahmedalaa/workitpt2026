# WorkitPT Platform Elevation Master Plan

Date: 2026-05-15

Purpose: this is the step-by-step execution plan for elevating WorkitPT from legacy handoff code into a professional production platform.

Use this with:

- `docs/TECHNICAL_RECOMMENDATIONS.md`
- `docs/COMPONENT_REVAMP_TASK_INDEX.md`
- `AGENTS.md`
- `.clinerules`

## Operating Instructions For AI Agents

For every task:

```text
Read AGENTS.md, .clinerules, docs/TECHNICAL_RECOMMENDATIONS.md,
docs/PLATFORM_ELEVATION_MASTER_PLAN.md, and the relevant task in
docs/COMPONENT_REVAMP_TASK_INDEX.md.

Implement only the requested component.
Do not broaden scope.
Run the listed verification.
Update docs if the implementation changes the plan.
```

## Phase 0: Foundation Lock

Goal: make the repo safe, understandable, and verifiable before product changes.

Status: mostly complete.

### Completed

- Clean root git repository exists.
- `archive/` is local-only and ignored.
- Root README exists.
- Root `AGENTS.md` exists.
- `.clinerules` exists.
- AI workflow docs exist.
- CI foundation exists.
- Backend builds from a clean tracked source without private `fbServices.json`.
- Backend `.env.example` exists.
- Flutter dependency/analyze baseline exists.
- ADR-001 keeps Flutter.

### Remaining Tasks

1. Add `docs/architecture/ADR-002-backend-framework.md`.
2. Add `docs/architecture/ADR-003-postgresql-vs-mongodb.md`.
3. Add `docs/architecture/ADR-004-stripe-payment-architecture.md`.
4. Add `docs/architecture/ADR-005-file-storage.md`.
5. Add `docs/architecture/ADR-006-realtime-and-jobs.md`.
6. Add issue/task tracking in GitHub.

### Verification

```bash
cd workitptproject && corepack yarn build
cd ../workitpt && flutter analyze --no-fatal-infos
```

## Phase 1: Baseline Quality Gates

Goal: create a safety net before deeper changes.

### Tasks

1. Add backend test runner.
   - Recommended: Vitest or Jest + Supertest.
   - Add scripts: `test`, `test:watch`, `test:integration`.
2. Add backend lint script that actually runs.
   - Existing ESLint config has old peer dependency risks; modernize carefully.
3. Add mobile test baseline.
   - Start with `flutter test`.
   - Add one smoke widget test if possible.
4. Add CI jobs for backend tests and mobile tests once they exist.
5. Add secret scanning workflow.
6. Add dependency audit workflow.

### Acceptance Criteria

- CI has separate backend and mobile jobs.
- Tests can run even with minimal coverage.
- Failing tests fail CI.
- Secret-like files remain ignored.

## Phase 2: Environment And Configuration Cleanup

Goal: stop relying on hardcoded URLs and app-bundled secrets.

### Mobile Tasks

1. Replace hardcoded base URLs in `workitpt/lib/config/app_env.dart`.
2. Replace hardcoded API gate keys in `workitpt/lib/core/network/custom_interceptor.dart`.
3. Replace hardcoded socket URL in chat.
4. Use `--dart-define-from-file` or equivalent env JSON per flavor.
5. Add documented env examples for dev, staging, prod.
6. Ensure dev/UAT/prod actually point to different services.

### Backend Tasks

1. Validate required env variables at boot.
2. Fail fast in production when critical env is missing.
3. Add `.env.example` coverage for all required keys.
4. Separate Firebase, Stripe, DB, JWT, mail, and app config.

### Acceptance Criteria

- No prod/dev host is hardcoded in source.
- No mobile static key is treated as authentication.
- App can run dev/staging/prod from documented commands.

## Phase 3: API Contract And Validation

Goal: make the API explicit and safe.

### Tasks

1. Choose validation library: Zod recommended for incremental Express refactor.
2. Add request validation middleware.
3. Add response envelope standard.
4. Add error code catalog.
5. Add schemas for auth endpoints first.
6. Add schemas for session endpoints.
7. Add schemas for booking endpoints.
8. Add schemas for payment endpoints.
9. Add schemas for wallet/withdraw endpoints.
10. Add schemas for chat/notification/upload endpoints.
11. Generate OpenAPI.
12. Add OpenAPI diff/check in CI.

### Acceptance Criteria

- Invalid payloads are rejected before service logic.
- Every route has a schema.
- Flutter team can integrate from contract, not guesswork.

## Phase 4: Auth And Account Security Revamp

Goal: make account access production-grade.

### Tasks

1. Audit login/register/social auth flows.
2. Normalize emails and add uniqueness rules.
3. Define token lifecycle.
4. Add refresh token strategy.
5. Add rate limits for auth endpoints.
6. Add OTP/password reset rate limits and expiry policy.
7. Add session revocation.
8. Add delete-account verification and cleanup.
9. Add audit events for sensitive actions.
10. Add tests.

### Acceptance Criteria

- Auth endpoints are validated and rate-limited.
- Session expiration/revocation behavior is documented.
- Delete-account flow is App Store safe.

## Phase 5: Payment, Wallet, Ledger, And Payout Redesign

Goal: make money movement safe before launch.

### Tasks

1. Create ADR-004 for Stripe architecture.
2. Remove raw card details from backend APIs.
3. Add PaymentIntent creation endpoint.
4. Add SetupIntent endpoint for saved cards.
5. Add Stripe webhook endpoint with signature verification.
6. Add idempotency table/model.
7. Add immutable ledger model.
8. Add wallet balance read model.
9. Convert booking finalization to webhook-driven state.
10. Add refund/cancellation state machine.
11. Decide Stripe Connect for trainer payouts.
12. Replace mobile WebView/card forms with Stripe Flutter SDK flow.
13. Add unit and integration tests.

### Acceptance Criteria

- Backend never receives card number/CVC.
- Webhook replay cannot double-credit ledger.
- Every balance can be rebuilt from ledger entries.
- Payment success does not depend on frontend redirect alone.

## Phase 6: Data Model And PostgreSQL Migration

Goal: move core transactional data into a schema that supports scale and correctness.

### Tasks

1. Create ADR-003 for database choice.
2. Define canonical relational schema.
3. Choose Prisma or Drizzle.
4. Add migrations.
5. Add seed data.
6. Add migration scripts from Mongo.
7. Add staging reconciliation scripts.
8. Add backup and rollback plan.
9. Migrate users/profiles.
10. Migrate sessions/bookings.
11. Migrate payments/wallet/withdrawals.
12. Migrate chat/notifications metadata.

### Acceptance Criteria

- Staging migration can run repeatedly.
- Reconciliation reports match source data.
- Production cutover plan is documented.

## Phase 7: Booking And Session Domain Revamp

Goal: make scheduling, capacity, location, recurrence, and status reliable.

### Tasks

1. Define session lifecycle.
2. Define booking lifecycle.
3. Define cancellation/no-show/refund rules.
4. Fix role permissions for trainer session mutation.
5. Normalize date/time/timezone handling.
6. Replace string times with explicit datetime rules.
7. Add capacity locking.
8. Add recurrence model.
9. Add booking conflict prevention.
10. Add tests for edge cases.

### Acceptance Criteria

- Double booking is prevented.
- Booking status transitions are deterministic.
- Timezone handling is documented and tested.

## Phase 8: Jobs And Notifications

Goal: move time-based and retryable work out of the API process.

### Tasks

1. Add Redis.
2. Add BullMQ.
3. Create worker process.
4. Move upcoming booking reminder job.
5. Move complete booking job.
6. Add stale payment cleanup job.
7. Add notification retry job.
8. Add dead-letter handling.
9. Add worker health checks and logs.

### Acceptance Criteria

- Scaling API instances does not duplicate jobs.
- Jobs are idempotent.
- Failed jobs are visible.

## Phase 9: Realtime Chat Revamp

Goal: make chat reliable across devices and server instances.

### Tasks

1. Model chat threads.
2. Model message delivery/read state.
3. Add Socket.IO Redis adapter.
4. Persist messages before broadcast.
5. Add cursor pagination.
6. Add reconnect behavior.
7. Add abuse/reporting hooks.
8. Add tests for send/list/read flows.

### Acceptance Criteria

- Multi-instance sockets work.
- No message is lost on reconnect.
- Chat history is paginated.

## Phase 10: Media And File Storage

Goal: remove local filesystem dependency.

### Tasks

1. Create ADR-005 for storage provider.
2. Add signed upload flow.
3. Add file metadata model.
4. Migrate avatar/session/certificate uploads to object storage.
5. Add MIME/extension/size validation.
6. Add image resizing.
7. Add malware scanning decision for certificates.

### Acceptance Criteria

- Production media survives deploys and horizontal scaling.
- Uploads are bounded and auditable.

## Phase 11: Mobile Modernization

Goal: upgrade the existing Flutter app without a risky rewrite.

### Tasks

1. Pin Flutter version with FVM or documented toolchain.
2. Upgrade Flutter in a dedicated branch.
3. Upgrade Android Gradle Plugin/Gradle/Kotlin/SDK.
4. Upgrade iOS pods/deployment target deliberately.
5. Replace deprecated APIs.
6. Clean analyzer issues and make `flutter analyze` strict.
7. Replace vendored `place_picker`.
8. Replace payment UI with Stripe Flutter SDK.
9. Add BLoC tests.
10. Add widget/integration tests for P0 flows.

### Acceptance Criteria

- App builds on iOS and Android.
- Analyzer runs strict.
- Critical flows are tested.

## Phase 12: Admin, Moderation, And Operations

Goal: make internal operations safe.

### Tasks

1. Audit admin endpoints.
2. Remove or guard migration endpoints.
3. Add RBAC tests.
4. Add audit logs.
5. Define trainer approval workflow.
6. Define ban/suspension workflow.
7. Define payout approval workflow if not using Connect automation.
8. Plan admin web/dashboard.

### Acceptance Criteria

- Admin actions are auditable.
- No destructive endpoint is exposed accidentally.

## Phase 13: Observability

Goal: make the platform debuggable.

### Tasks

1. Add request IDs.
2. Add Pino logging.
3. Add Sentry backend.
4. Add Sentry/Crashlytics mobile.
5. Add OpenTelemetry tracing.
6. Add health/readiness endpoints.
7. Add dashboards and alerts.

### Acceptance Criteria

- Payment, booking, login, and crash issues can be traced.
- Production support does not rely on guesswork.

## Phase 14: Release And Launch Hardening

Goal: prepare for real users.

### Tasks

1. Complete `05-checklists/MVP_LAUNCH.md`.
2. Add app store checklist.
3. Add privacy policy and terms.
4. Add support email.
5. Add staging smoke tests.
6. Add release tags and changelog.
7. Add rollback runbooks.
8. Run physical device UAT.

### Acceptance Criteria

- Go/no-go decision is evidence-based.
- Production deploy and rollback are rehearsed.

## Recommended Execution Order

Do this order unless an urgent bug forces a short detour:

1. Phase 1: quality gates.
2. Phase 2: environment cleanup.
3. Phase 3: API contract.
4. Phase 5: payments.
5. Phase 7: booking/session domain.
6. Phase 8: jobs.
7. Phase 10: media.
8. Phase 11: mobile modernization.
9. Phase 6: database migration, when schema is clear.
10. Phase 13 and 14 continuously.

Reason: payment and booking correctness should be designed before the final database migration, otherwise you risk migrating flawed models.
