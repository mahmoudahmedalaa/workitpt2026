# WorkitPT Technical Recommendations

Date: 2026-05-15

Purpose: this document is the target-state recommendation set. It says what should exist when WorkitPT is elevated into a professional platform. The execution order lives in `docs/PLATFORM_ELEVATION_MASTER_PLAN.md`.

## How To Use This Document

For every implementation task:

1. Read the relevant section here.
2. Read `docs/PLATFORM_ELEVATION_MASTER_PLAN.md` for order and acceptance criteria.
3. Read `docs/COMPONENT_REVAMP_TASK_INDEX.md` for the exact component task.
4. Make one focused change.
5. Run verification.
6. Update docs if reality changes.

## Executive Recommendation

Keep Flutter/Dart. Do not rewrite mobile as the first move.

The professional upgrade is not a framework swap. It is a platform-hardening effort:

- Make the repo reproducible.
- Modernize mobile tooling and dependencies.
- Remove hardcoded environment coupling.
- Add API contracts and validation.
- Add tests.
- Redesign payments around Stripe-native flows and webhooks.
- Move transactional data toward PostgreSQL.
- Add Redis-backed queues, rate limits, locks, and realtime scaling.
- Add object storage.
- Add observability and security.
- Add CI/CD and release discipline.

## Target Architecture

```text
Mobile App
  Flutter/Dart
  BLoC or documented state pattern
  Typed API client generated or validated from OpenAPI
  Stripe mobile SDK / PaymentSheet
  Firebase Messaging
  Sentry or Crashlytics

Backend Platform
  TypeScript modular monolith
  Express now, NestJS/Fastify optional later by ADR
  Runtime validation with Zod or framework DTOs
  OpenAPI contract
  PostgreSQL for core transactional data
  Prisma or Drizzle migrations
  Redis for queue/cache/locks/rate limit/socket presence
  BullMQ workers
  Socket.IO Redis adapter
  Stripe webhooks and idempotent ledger
  S3/R2/GCS object storage
  Pino logs, OpenTelemetry traces, Sentry errors
```

## 1. Repository And Developer Experience

### Current Issues

- Historical files had been mixed with active source before cleanup.
- Root README and agent instructions were missing before this setup pass.
- Backend had duplicate package manager artifacts.
- Some local build artifacts exist locally but are ignored.

### Recommendations

- Keep this repo as the single active working foundation.
- Keep `archive/` local-only and ignored.
- Keep root `README.md`, `AGENTS.md`, `.clinerules`, workflows, and checklists current.
- Use Yarn 1 via Corepack for backend.
- Use Flutter lockfiles and Gradle wrapper for reproducibility.
- Add ADRs for all major architecture choices.

### Done Means

- A fresh clone can find setup instructions in `README.md`.
- CI runs backend build and mobile dependency/analyze checks.
- No active agent has to infer project structure from folder names.

## 2. Mobile Platform

### Current Stack

- Flutter 3.13.9 / Dart 3.1.5 local baseline.
- BLoC state management.
- `dio`, `flutter_rest_client`.
- `auto_route`.
- `freezed`, `json_serializable`, `injectable`, `get_it`.
- Firebase Core/Messaging.
- Google Maps.
- Socket.IO client.
- WebView payment flow.
- Vendored `place_picker-0.10.0`.

### Current Issues

- Flutter and many packages are old.
- Android compile/target SDK are old.
- Android Gradle Plugin and Gradle wrapper are old.
- Dev/UAT/prod currently point to the same backend URL in code.
- Static API gate secrets are embedded in mobile source.
- Socket URL is hardcoded in chat UI.
- `flutter analyze` has pre-existing info-level findings.
- No meaningful tests.

### Recommendations

- Keep Flutter, but modernize deliberately.
- Add FVM or equivalent version pinning.
- Upgrade Flutter in a controlled branch after CI is stable.
- Upgrade Android Gradle Plugin, Gradle, Kotlin, compileSdk, targetSdk.
- Decide Android min SDK intentionally.
- Convert all runtime configuration to build-time/env configuration.
- Remove static mobile API gate secrets as a security mechanism.
- Replace WebView-based card saving/checkout with Stripe Flutter SDK flows.
- Replace or isolate vendored `place_picker`.
- Add unit, widget, BLoC, and integration tests.
- Move toward stricter analyzer settings after legacy warnings are cleaned.

### Done Means

- App builds for dev, staging/UAT, and prod.
- No hardcoded prod/dev API URL in Dart code.
- No static secret in the mobile bundle is treated as security.
- Auth, booking, payment, and chat have test coverage.

## 3. Backend Platform

### Current Stack

- Node.js + TypeScript.
- Express.
- MongoDB/Mongoose.
- Stripe SDK.
- Firebase Admin.
- Socket.IO.
- Node-cron.
- Multer/local uploads.

### Current Issues

- No API contract.
- No runtime validation standard.
- No tests.
- Cron jobs run inside the API process.
- Local filesystem stores media.
- Payment flow is redirect/direct-retrieve heavy and card-saving accepts raw card details.
- TypeScript strictness and service boundaries need improvement.
- No structured logging, tracing, health checks, or production observability.

### Recommendations

- Keep TypeScript.
- Stabilize Express first; do not start with a broad framework rewrite.
- Add validation with Zod or equivalent.
- Generate OpenAPI.
- Introduce tests with Vitest/Jest + Supertest.
- Add `helmet`, strict CORS, rate limiting, and request IDs.
- Add Pino logging.
- Add health/readiness endpoints.
- Extract background jobs to BullMQ workers.
- Extract media upload to signed object storage.

### Done Means

- Every route has validation.
- OpenAPI contract exists.
- Backend builds and tests in CI.
- API can scale horizontally without duplicate cron side effects.

## 4. Database And Data Model

### Current State

- MongoDB/Mongoose models for users, trainer/customer embedded profile info, sessions, bookings, chats, notifications, wallet, withdrawals, and tokens.

### Current Issues

- User email lacks a unique index.
- Financial records are not modeled as an immutable ledger.
- Booking/payment/wallet updates span multiple collections without a mature transaction/idempotency model.
- Some fields have typos or inconsistent naming, such as `coordicates`.
- Reporting and analytics will get harder as data grows.

### Recommendation

Move core transactional data to PostgreSQL.

Use PostgreSQL for:

- users
- customer profiles
- trainer profiles
- sessions/classes
- bookings
- payment intents
- payment events
- refunds
- payouts
- ledger entries
- notifications
- chat thread/message metadata
- audit events

Use Prisma if AI-assisted implementation and schema clarity are priorities. Use Drizzle if the team wants SQL-first control.

### Done Means

- ADR for PostgreSQL is accepted.
- Schema, migrations, seed data, and rollback plan exist.
- Staging migration has been rehearsed.
- Payment and booking mutations are transactional.

## 5. Payments, Wallets, And Payouts

### Current Issues

- Backend accepts raw card details.
- Payment truth partly depends on redirect success endpoints.
- Wallet crediting is not clearly ledger-first.
- Trainer payouts/withdrawals need a professional compliance model.

### Recommendations

- Use Stripe PaymentIntents for payments.
- Use Stripe SetupIntents for saved cards.
- Use Stripe Flutter SDK PaymentSheet for mobile.
- Use Stripe webhooks as payment truth.
- Use idempotency keys for checkout creation and webhook processing.
- Add immutable ledger entries.
- Prefer Stripe Connect for trainer payouts.
- Model refunds, cancellations, disputes, and payout failures.

### Done Means

- Backend never sees card number/CVC.
- Webhook replay cannot double-credit a wallet.
- Every wallet balance can be rebuilt from ledger entries.
- Trainer payout flow has an ADR and test plan.

## 6. Authentication And Account Security

### Current Issues

- Static `x-key`/query secret gate exists.
- Password/JWT lifecycle needs review.
- Social auth exists but needs stronger verification and account-linking policy.
- Rate limiting is missing.

### Recommendations

- Remove static mobile app keys as security boundary.
- Use short-lived access tokens and refresh tokens.
- Add rate limits for login, register, OTP, forgot password, contact, upload, and payment.
- Normalize and uniquely constrain emails.
- Add audit events for sensitive account actions.
- Add device/session revocation model.
- Ensure delete-account flow is complete.

### Done Means

- Auth flows are documented and tested.
- Sensitive endpoints are rate-limited.
- Account deletion, password reset, and verification are covered.

## 7. API Contract And Client Integration

### Current Issues

- Flutter API models and backend responses can drift.
- No formal OpenAPI contract.
- Errors are not standardized enough.

### Recommendations

- Define route schemas.
- Generate OpenAPI.
- Use a consistent response envelope.
- Standardize error codes and messages.
- Add pagination standards.
- Generate or validate Flutter clients/models from the contract.

### Done Means

- Every endpoint is represented in OpenAPI.
- Flutter integration work can be performed without guessing payload shapes.
- Contract changes are reviewed in PRs.

## 8. Background Jobs

### Current Issues

- `completeBooking.cron.ts` and `upcommingBooking.cron.ts` run inside the API process.
- Horizontal scaling can duplicate scheduled jobs.
- There is no dead-letter/retry visibility.

### Recommendations

- Introduce Redis + BullMQ.
- Run workers as separate process.
- Make each job idempotent.
- Add scheduled jobs for reminders, booking completion, stale payment cleanup, payout reconciliation, and notification retries.

### Done Means

- API can scale independently from workers.
- Failed jobs are observable and retryable.
- Jobs do not duplicate side effects.

## 9. Realtime And Chat

### Current Issues

- Socket.IO exists but needs horizontal scaling support.
- Chat thread modeling should be explicit.
- Delivery/read state should be reliable.

### Recommendations

- Add Socket.IO Redis adapter.
- Model chat threads separately from messages.
- Persist message before broadcast.
- Add cursor pagination.
- Add read receipts and reporting/abuse controls.

### Done Means

- Multi-instance socket deployment works.
- Reconnect does not lose messages.
- Chat history is paginated and testable.

## 10. Notifications

### Current State

- Firebase Admin and Firebase Messaging are used.

### Recommendations

- Move Firebase Admin credentials to env/secret manager only.
- Store notification events and delivery attempts.
- Queue notification sends through workers.
- Add retry and dead-letter handling.
- Separate push, email, and in-app notification templates.

### Done Means

- Notification delivery is observable.
- Failed sends can be retried.
- Production credentials are not in git.

## 11. Media And File Uploads

### Current Issues

- Local filesystem/public uploads are not production-scale.
- File validation and scanning need hardening.

### Recommendations

- Use S3, Cloudflare R2, or Google Cloud Storage.
- Use signed upload URLs.
- Store file metadata in DB.
- Validate MIME type, extension, and size.
- Add image resizing/compression pipeline.
- Consider malware scanning for trainer certificates and uploads.

### Done Means

- Server filesystem is not required for production media.
- Uploads are safe, bounded, and auditable.

## 12. Admin And Moderation

### Current State

- Admin routes exist for user approval and migration-like endpoints.

### Recommendations

- Separate admin API permissions clearly.
- Remove or protect migration endpoints.
- Add audit logs for trainer approval, bans, payout decisions, and account deletion.
- Create an admin dashboard plan.
- Add RBAC tests.

### Done Means

- Admin actions are traceable.
- No dev/migration endpoint can be hit accidentally in production.

## 13. Observability

### Recommendations

- Backend: Pino logs, request IDs, Sentry, OpenTelemetry.
- Mobile: Sentry or Crashlytics, performance traces, release tagging.
- Dashboards:
  - API latency/error rate
  - payment success/failure
  - booking conversion
  - job failures
  - push notification failures
  - socket connections

### Done Means

- An engineer can debug a payment, booking, login, or crash from logs/traces without guessing.

## 14. CI/CD And Release

### Current State

- CI foundation exists.

### Recommendations

- Keep CI simple first.
- Add lint/test jobs once scripts exist.
- Add secret scanning.
- Add dependency audit.
- Add staging deploy.
- Add mobile internal distribution/TestFlight pipeline later.
- Use tags and release notes.

### Done Means

- Main branch is always buildable.
- Production deploys are repeatable and reversible.

## 15. Documentation And AI Enablement

### Current State

- Root README, AGENTS, workflows, checklists, MCP setup, and handover docs exist.

### Recommendations

- Keep docs close to reality.
- Add ADRs for major decisions.
- Use component task index for AI work.
- Each AI task should specify scope, forbidden changes, verification commands, and definition of done.

### Done Means

- New AI sessions can contribute safely without rediscovering the project.
