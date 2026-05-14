# WorkitPT Technical Stack Elevation Plan

Date: 2026-05-15

Scope: technology stack only. This document intentionally focuses on programming languages, frameworks, database choices, infrastructure, testing, CI/CD, security tooling, payments, realtime systems, and AI implementation workflow. It does not evaluate product strategy, visual design, copywriting, or feature desirability except where those choices affect architecture.

## Executive Decision

Do not rewrite the mobile app away from Flutter as the first move.

Flutter is still a valid professional choice for an iOS and Android marketplace app. The current implementation is old and needs modernization, but the programming language choice is not the main bottleneck. The platform risk comes from the surrounding engineering system: outdated mobile tooling, no meaningful tests, no API contract, hardcoded secrets and URLs, weak environment separation, no CI/CD, payment flow design, MongoDB used without enough transactional guardrails, cron jobs running inside the API server, local file uploads, missing observability, and incomplete security controls.

The recommended path is:

1. Keep Flutter and Dart for the customer/trainer mobile app.
2. Upgrade Flutter, Dart constraints, Android/iOS build tooling, dependencies, and architecture discipline.
3. Keep TypeScript on the backend, but refactor the API into a professional service architecture.
4. Move the core transactional domain to PostgreSQL unless there is a strong reason to remain document-first.
5. Use Redis for queues, locks, cache, and rate limiting.
6. Use Stripe-native marketplace/payment primitives, ideally Stripe Connect for trainer payouts.
7. Move background jobs out of the API process.
8. Introduce OpenAPI, tests, CI/CD, observability, infrastructure-as-code, and security scanning before major feature expansion.

If budget and timeline allow only one big technical correction, prioritize backend/data/payments reliability over a mobile rewrite.

## Current Stack Inventory

### Mobile App

Location: `workitpt/`

Current stack:

- Flutter/Dart.
- BLoC state management.
- `get_it` plus `injectable` dependency injection.
- `dio` and `flutter_rest_client` for HTTP.
- `auto_route` for routing.
- `freezed` and `json_serializable` for generated immutable models and JSON.
- Firebase Core and Firebase Messaging.
- Google Maps.
- Socket.IO client.
- Stripe/payment UI through backend URLs and WebView.
- Flutter secure storage and shared preferences.
- Vendored local package: `place_picker-0.10.0`.
- Dev/UAT/prod flavors exist, but they currently point to the same API host.

Important observations:

- Dart SDK constraint starts at `>=2.19.0-0`, which is old for a professional 2026 baseline.
- Android uses compile SDK 33 and target SDK 33.
- Android Gradle Plugin is 7.1.3 and Gradle wrapper is 7.4.
- Flutter official supported deployment platform data currently lists Android 24-36 and iOS 13-26 as supported ranges. The app declares Android min SDK 21, so the product must decide whether to keep old Android devices at additional engineering cost or raise the support floor.
- There are 497 Dart files under `lib/`, 423 excluding common generated suffixes, and zero app tests.
- The app has useful layering by feature, but it also has unfinished interfaces, hardcoded secrets, debug prints, inconsistent error handling, and direct URL usage in chat.

Code evidence:

- `workitpt/pubspec.yaml` defines old SDK/dependency baselines and a vendored `place_picker` package.
- `workitpt/lib/config/app_env.dart` hardcodes one backend URL for all environments and includes static API gate secrets.
- `workitpt/lib/core/network/custom_interceptor.dart` injects static API secrets into every request.
- `workitpt/android/build.gradle` and `workitpt/android/app/build.gradle` show old Android build tooling and SDK values.

### Backend API

Location: `workitptproject/`

Current stack:

- Node.js + TypeScript.
- Express.
- Socket.IO.
- MongoDB through Mongoose.
- Stripe SDK.
- Firebase Admin for push notifications.
- Nodemailer/React Email.
- PDFKit.
- Node-cron inside the API process.
- Multer/local public uploads.

Important observations:

- TypeScript is good, but strictness and runtime validation are not strong enough.
- Express can scale if disciplined, but this codebase currently lacks contracts, validation, tests, service boundaries, observability, and deployment hardening.
- There are 108 TypeScript/TSX source files and zero backend tests.
- There is no OpenAPI/Swagger contract.
- There is no Dockerfile, docker-compose, or visible CI workflow.
- The API imports and starts cron jobs from `server.ts`, which means every API instance can run the same jobs unless deployment carefully prevents it.
- Payment success depends partly on redirect/success endpoints and direct Stripe retrieval; there is no visible webhook-first ledger design.
- Card saving accepts raw card number/CVC on the backend. That is not acceptable for a professional platform unless the company intentionally accepts much heavier PCI scope. Use Stripe client SDKs/Elements/PaymentSheet/SetupIntents instead.
- User email is required but not unique in the Mongoose schema.
- Many schemas lack compound indexes aligned to production query patterns.
- Several financial and booking operations update multiple collections without a consistent transaction/idempotency model.

Code evidence:

- `workitptproject/package.json` shows Express, Mongoose, Stripe, Firebase Admin, Socket.IO, node-cron, but no Jest/Vitest, Supertest, OpenAPI tooling, Helmet, rate limit package, queue, Redis, or observability dependency.
- `workitptproject/src/server.ts` starts Express, Socket.IO, and cron jobs in one process.
- `workitptproject/src/models/user.model.ts` lacks a unique email index.
- `workitptproject/src/services/stripe.services.ts` creates payment methods from raw card details and uses redirect-based success flows.
- `workitptproject/src/cronjobs/*.cron.ts` scan paid bookings on intervals inside the server runtime.
- `workitptproject/src/routes/v1/session.routes.ts` has trainer role checks commented out for session mutation endpoints.

## Is Flutter The Right Choice?

### Recommendation

Keep Flutter for now.

Flutter is not inherently amateur, unscalable, or unsuitable for a professional iOS/Android company. It is a strong fit when:

- The same product experience should ship on both iOS and Android.
- The team wants one UI codebase.
- The app is not dominated by platform-specific native modules.
- The company needs fast iteration across both platforms.
- The app can tolerate a Flutter-rendered UI rather than requiring every native control to behave exactly like a platform-native app.

WorkitPT fits that profile.

### When To Move Away From Flutter

Consider rewriting mobile only if at least two of these become true:

- You hire a senior native iOS and Android team and want independent native release velocity.
- The app requires deep HealthKit, Google Fit/Health Connect, watchOS/Wear OS, advanced Bluetooth, background location, or native media pipelines where Flutter plugins become a recurring blocker.
- You need the highest possible platform-native polish and are willing to pay for two codebases.
- The current Flutter code is so brittle that incremental modernization costs more than a rewrite.

That is not proven by this repository. The current pain is technical debt, not Flutter itself.

### Flutter vs React Native vs Native

Recommended ranking for WorkitPT:

1. Flutter: best near-term choice because code already exists and the app is cross-platform.
2. Native Swift/Kotlin: best ultimate polish, highest cost, highest team complexity.
3. React Native: reasonable if the company has a strong React team, but rewriting from Flutter to React Native does not automatically solve backend, data, test, payment, or ops problems.
4. Kotlin Multiplatform: interesting for shared business logic, but not the best rescue path for this app.

## Database Decision

### Current Choice: MongoDB

MongoDB can work for marketplaces, but it must be designed carefully:

- Query-based indexes must be created deliberately.
- Multi-document operations need transactions or a compensating design.
- Data shape must be stable enough to avoid inconsistent embedded profile structures.
- Financial records need immutable ledger modeling.

Current usage is not mature enough for a professional payments/booking marketplace.

### Recommended Choice: PostgreSQL For Core Domain

Move the core transactional domain to PostgreSQL:

- users
- trainer profiles
- customer profiles
- sessions/classes
- bookings
- payments
- refunds
- payouts
- wallet ledger entries
- notifications metadata
- audit events

Use MongoDB only if you specifically want document flexibility for non-critical content. If simplicity matters, do not use MongoDB and PostgreSQL together long term; use PostgreSQL plus JSONB where flexible fields are needed.

Why PostgreSQL is better here:

- Bookings, payments, wallets, payouts, and users are relational.
- Constraints matter: unique email, unique booking references, non-negative balances, one active booking per slot, immutable ledger entries.
- Transactions are central to payment and booking correctness.
- Reporting and analytics are easier.
- Migrations are explicit.
- AI agents can reason about relational schemas more safely.

Recommended ORM/query layer:

- Prisma if Cline/deepseek will implement much of the migration and you value type-safe schema clarity.
- Drizzle if you want lighter SQL-first TypeScript.
- TypeORM is less recommended for a new cleanup.

Recommended managed Postgres:

- Supabase Postgres, Neon, AWS RDS, or Google Cloud SQL.
- Use Supabase if you want the Supabase MCP and dashboard to help AI inspect schemas, run migrations, and manage data.
- Use RDS/Cloud SQL if you want more traditional cloud ownership.

### Required Redis Layer

Add Redis for:

- rate limiting
- session/socket presence
- job queues
- idempotency locks
- cache for read-heavy trainer search
- distributed locks for booking slots and payment finalization

Recommended options:

- Upstash Redis for serverless/simple managed Redis.
- AWS ElastiCache/MemoryDB if using AWS.
- Redis Cloud if cloud-neutral.

## Backend Architecture Target

### Recommended Backend Stack

Keep TypeScript.

Recommended shape:

- Runtime: Node.js LTS.
- API framework: NestJS or Fastify.
- If minimizing rewrite: keep Express initially, add structure, validation, tests, OpenAPI, and observability.
- If doing a professional refactor: move to NestJS with modules for Auth, Users, Sessions, Bookings, Payments, Notifications, Chat, Admin, Files, and Jobs.
- Database: PostgreSQL with Prisma.
- Cache/queue: Redis + BullMQ.
- Realtime: Socket.IO with Redis adapter, or managed realtime service if scaling globally.
- Object storage: S3, Cloudflare R2, or Google Cloud Storage.
- API contract: OpenAPI generated from Zod schemas or framework decorators.
- Runtime validation: Zod or class-validator depending on framework.
- Logging: Pino.
- Metrics/tracing: OpenTelemetry.
- Error tracking: Sentry.

### Service Boundaries

Start as a modular monolith. Do not split into microservices yet.

Modules:

- Auth module: login, register, token refresh, social auth, password reset, account deletion.
- User module: customer/trainer/admin profile management.
- Session module: trainer-created sessions/classes.
- Booking module: booking lifecycle, capacity, attendance, cancellation.
- Payment module: Stripe PaymentIntents/Checkout, webhooks, refunds.
- Payout module: Stripe Connect payouts or trainer withdrawal workflow.
- Wallet/Ledger module: immutable accounting records.
- Notification module: push/email/in-app notification delivery.
- Chat module: message persistence and realtime delivery.
- Media module: signed uploads, image processing, public URLs.
- Admin module: moderation, approvals, reporting.
- Jobs module: reminders, booking completion, cleanup.

## Payment Architecture Target

This is one of the highest-priority changes.

### Current Problem

The backend accepts raw card fields and creates Stripe payment methods. That is not the professional path. Stripe should collect card details through Stripe-hosted or Stripe SDK UI so the backend never sees PAN/CVC values.

Stripe's current guidance centers on PaymentIntents for dynamic payment flows, SetupIntents for saving cards, idempotency, and webhooks for final server-side confirmation.

### Recommended Payment Flow

For mobile:

1. App requests `POST /payments/intents` with booking IDs.
2. API validates booking ownership, price, availability, and creates/reuses one PaymentIntent per checkout.
3. API returns only the PaymentIntent client secret, publishable key config, and ephemeral customer key if using Stripe mobile SDK.
4. Flutter uses Stripe PaymentSheet or native Stripe SDK package to confirm payment.
5. Stripe calls API webhook.
6. Webhook verifies signature, checks idempotency, records immutable ledger entries, marks booking paid, credits trainer pending balance.
7. App polls or receives push/realtime update.

For saved cards:

1. Use SetupIntent from backend.
2. Flutter confirms SetupIntent through Stripe SDK.
3. Backend stores only Stripe customer ID and payment method ID.

For trainer payouts:

- Prefer Stripe Connect if trainers are being paid as marketplace sellers.
- Store payout status from Stripe, not custom bank account details unless legally and compliance-reviewed.

Required payment tables:

- `payment_intents`
- `payment_events`
- `ledger_entries`
- `refunds`
- `trainer_payout_accounts`
- `payouts`

Required guarantees:

- All webhook handlers idempotent.
- All booking-payment transitions transactional.
- No wallet balance update without an immutable ledger entry.
- No direct card number/CVC ever touches WorkitPT servers.

## Mobile Architecture Target

### Keep

- Flutter.
- BLoC if the team already understands it.
- Feature-first folder structure.
- `freezed`/code generation concept.
- `dio`, if wrapped behind a clean API client.
- Firebase Messaging.

### Replace Or Upgrade

- Upgrade Flutter/Dart to current stable.
- Raise Dart SDK constraint to the stable baseline required by the chosen Flutter version.
- Upgrade Android Gradle Plugin, Gradle, Kotlin, compileSdk, targetSdk.
- Decide Android minimum support:
  - Recommended professional default: min SDK 24 unless business needs require older devices.
  - If keeping min SDK 21, document why and test it explicitly.
- Replace vendored `place_picker-0.10.0` with a maintained maps/place solution or own thin integration.
- Replace raw payment WebViews with Stripe Flutter SDK PaymentSheet unless using Stripe Checkout intentionally.
- Replace hardcoded API URLs/secrets with build-time env config.
- Replace direct socket URL strings with env-driven config.
- Remove `flutter_rest_client` if it limits maintainability; use typed repositories built over Dio, or generate clients from OpenAPI.
- Replace broad `print/debugPrint` usage with structured app logging that is disabled or redacted in release.

### Mobile Required Work

1. Add test structure:
   - unit tests for repositories, BLoCs, validators, session manager
   - widget tests for auth, booking, payment, session creation
   - integration tests for login, trainer search, booking, checkout happy path
2. Add static quality:
   - modern `flutter_lints` or `very_good_analysis`
   - dependency audit job
   - `dart format`
   - generated code verification in CI
3. Improve networking:
   - central API client
   - typed errors
   - retry only for safe idempotent requests
   - token refresh flow
   - no static API gate keys in app bundle
4. Improve storage:
   - secure storage for access/refresh tokens only
   - shared preferences for non-sensitive settings only
   - remove user secrets as pseudo-auth if possible
5. Improve observability:
   - Sentry/Crashlytics for crashes
   - performance traces for cold start, API latency, checkout, booking
6. Improve release:
   - Fastlane or Codemagic/GitHub Actions
   - dev/UAT/prod Firebase apps
   - app signing stored in CI secret manager
   - store metadata in repo

## Backend Required Work

### Phase 0: Freeze And Baseline

Deliverables:

- Put `workitpt/` and `workitptproject/` into a real git repository or monorepo.
- Add `.nvmrc`, pinned package manager, and documented Flutter version through FVM.
- Add `.env.example` for backend and mobile build env.
- Remove committed service account/private config files from source if they contain real secrets; rotate leaked secrets.
- Add baseline CI that runs:
  - backend install/build/lint
  - mobile `flutter pub get`
  - mobile `flutter analyze`
  - generated code check

Acceptance criteria:

- A fresh machine can build backend and mobile from documented commands.
- No environment secrets are hardcoded in Dart source.
- No backend secret values are committed.

### Phase 1: API Contract And Validation

Deliverables:

- Add Zod DTOs or NestJS/class-validator DTOs for every endpoint.
- Generate OpenAPI spec.
- Use OpenAPI to generate or verify mobile API models.
- Create a consistent response envelope and error codes.
- Add request IDs.
- Add pagination standard: `limit`, `cursor`, `nextCursor`.

Acceptance criteria:

- Every route has request/response schema.
- Invalid payloads fail before service logic.
- Cline can update mobile clients from OpenAPI without guessing endpoint shapes.

### Phase 2: Database Replatform

Recommended target: PostgreSQL + Prisma.

Deliverables:

- Create Prisma schema for:
  - users
  - customer_profiles
  - trainer_profiles
  - trainer_documents
  - sessions
  - session_locations
  - bookings
  - booking_status_events
  - payment_intents
  - payment_events
  - ledger_entries
  - payouts
  - notifications
  - chat_threads
  - chat_messages
  - uploaded_files
  - audit_events
- Create migrations.
- Write Mongo-to-Postgres migration scripts.
- Add read-only dual-read verification scripts.
- Define unique constraints and indexes.

Critical indexes:

- users: unique lowercased email, role, status
- trainers: verification status, specialization, country/state, current location
- sessions: trainer ID, status, date range, location type, price, difficulty
- bookings: user ID + status + date, session ID + status, payment status, unique reference
- chat: thread ID + createdAt
- notifications: user ID + seen + createdAt
- ledger: user/trainer ID + createdAt, payment ID, booking ID

Acceptance criteria:

- Data can be migrated repeatably in staging.
- Production migration has rollback and reconciliation steps.
- Booking payment finalization is transactional.

If PostgreSQL is deferred:

- Keep MongoDB temporarily.
- Add unique indexes, compound indexes, schema version fields, migration scripts, and Mongoose transactions for payment/booking/wallet operations.
- This is acceptable only as a bridge, not the ideal professional end state.

### Phase 3: Payments And Ledger

Deliverables:

- Remove raw card handling from backend.
- Add Stripe webhook endpoint with signature verification.
- Add idempotency keys to checkout creation and webhook handling.
- Add immutable ledger model.
- Add PaymentIntent and SetupIntent flows.
- Add Stripe Connect architecture decision for trainer payouts.
- Add refund and cancellation state machine.

Acceptance criteria:

- Backend never receives raw card number/CVC.
- Payment success is based on verified webhook events.
- Replaying a webhook does not double-credit wallets.
- Failed/abandoned payments leave bookings in a recoverable state.

### Phase 4: Background Jobs

Deliverables:

- Move `node-cron` out of `server.ts`.
- Add BullMQ worker process.
- Add scheduled jobs:
  - booking reminders
  - booking completion
  - payout reconciliation
  - notification retries
  - stale pending payment cleanup
- Add job idempotency and dead-letter handling.

Acceptance criteria:

- Scaling API instances does not duplicate scheduled work.
- Jobs can be retried safely.
- Failed jobs are visible in monitoring.

### Phase 5: Realtime And Chat

Deliverables:

- Model chat threads explicitly.
- Add Socket.IO Redis adapter.
- Persist messages before broadcasting.
- Add delivery/read receipts with clear state.
- Add pagination and retention rules.
- Add abuse/reporting controls.

Acceptance criteria:

- Multiple API instances can serve socket traffic.
- User reconnects do not lose messages.
- Chat history loads by cursor.

### Phase 6: Files And Media

Deliverables:

- Replace local `/public` uploads with S3/R2/GCS.
- Use signed upload URLs.
- Store file metadata in DB.
- Add virus scanning or at least MIME/extension validation and size limits.
- Add image resizing/compression pipeline for avatars/session images.

Acceptance criteria:

- App uploads directly to object storage.
- API stores only metadata and signed/public URLs.
- Local server filesystem is not a production dependency.

### Phase 7: Security

Deliverables:

- Remove static `x-key` and query secret as a security mechanism.
- Use normal authenticated API access, refresh tokens, and server-side rate limits.
- Add Helmet or equivalent secure headers.
- Add CORS allowlist by environment.
- Add rate limits for auth, OTP, password reset, contact, payment endpoints.
- Add account lockout/step-up rules.
- Add audit logging for admin, trainer approval, payment, payout, deletion.
- Add dependency scanning.
- Add secret scanning.
- Add SAST.
- Add threat model for payments, chat, admin, and file upload.

Acceptance criteria:

- No secret in mobile app source is treated as a security boundary.
- All high-risk endpoints are rate-limited and audited.
- CI fails on known critical vulnerabilities.

### Phase 8: Observability And Operations

Deliverables:

- Pino JSON logs.
- Request IDs through API, jobs, and mobile error reports.
- Sentry backend + mobile.
- OpenTelemetry traces.
- Metrics dashboard:
  - API latency
  - error rate
  - payment success/failure
  - booking conversion
  - job failures
  - socket connections
  - notification delivery
- Health endpoints:
  - liveness
  - readiness
  - DB connectivity
  - Redis connectivity
  - queue health

Acceptance criteria:

- On-call/debugging can answer: what failed, who was affected, which request/job/payment caused it, and whether money moved.

### Phase 9: CI/CD And Release

Recommended:

- GitHub Actions for CI.
- Fastlane for iOS/Android release automation.
- EAS/Codemagic/Bitrise are also acceptable if preferred.
- Backend deploy to Cloud Run/Fly.io/Render/AWS ECS/Vercel serverless only if socket/job constraints are handled.
- Use separate environments: dev, staging/UAT, prod.

Required pipelines:

- Pull request:
  - backend install/build/lint/test
  - mobile format/analyze/test
  - OpenAPI diff check
  - dependency/security scan
- Main branch:
  - deploy backend to staging
  - run migrations
  - run smoke tests
  - build mobile internal distribution
- Release:
  - tag
  - changelog
  - production migration
  - backend deploy
  - app store/play store submission

Acceptance criteria:

- No manual production deploys.
- Rollback procedure documented and tested.

## Recommended Repository Structure

Use a monorepo unless the team strongly prefers separate repos.

Recommended structure:

```text
workitpt/
  apps/
    mobile/              # Flutter app
    admin-web/           # future admin panel, if needed
  services/
    api/                 # TypeScript API
    worker/              # BullMQ workers
  packages/
    api-contract/        # OpenAPI/Zod shared contract if used
    shared-types/        # generated types only, not business logic dumping ground
  infra/
    terraform/           # cloud resources
    docker/
  docs/
    architecture/
    runbooks/
    decisions/
  .github/
    workflows/
```

If keeping two repos:

- `workitpt-mobile`
- `workitpt-platform-api`
- `workitpt-infra`
- `workitpt-docs`

The monorepo is better for AI-assisted implementation because Cline can inspect API and mobile contract changes together.

## AI Implementation Setup For Cline + DeepSeek

### MCPs To Provide

Minimum MCP/tooling setup:

- GitHub MCP: issues, branches, PRs, code review comments, CI status.
- Filesystem/project MCP: read/write the local monorepo.
- PostgreSQL/Supabase MCP: inspect schema, run safe queries, manage migrations in staging.
- Stripe MCP: inspect payment objects, webhook events, customers, connected accounts, test payments.
- Browser/Playwright MCP: run web admin/API docs checks and any browser-based payment redirects.
- Firebase/Google Cloud tooling or MCP if available: FCM, app configs, service accounts, Crashlytics.
- Sentry MCP if available: inspect errors/performance events.
- Vercel/Cloud provider MCP if that is the deployment target.
- Context/documentation MCP such as Context7 if available: fetch current library docs.

### Skills Cline Should Have

Give the implementation AI explicit skills or pinned instructions for:

- Flutter modernization.
- Dart BLoC testing.
- Flutter flavors and CI signing.
- Node.js TypeScript API architecture.
- NestJS or Express refactor patterns.
- Prisma/PostgreSQL migrations.
- Stripe PaymentIntents, SetupIntents, webhooks, and Connect.
- Redis/BullMQ job design.
- Socket.IO scaling with Redis adapter.
- OpenAPI generation and client generation.
- Security review and threat modeling.
- Sentry/OpenTelemetry instrumentation.
- GitHub Actions and Fastlane.

### Repositories/References To Give Cline

Use official docs as primary references:

- Flutter supported platforms: https://docs.flutter.dev/reference/supported-platforms
- React Native current architecture only if comparing rewrite options: https://reactnative.dev/
- MongoDB indexing and schema design: https://www.mongodb.com/docs/manual/indexes/
- Stripe PaymentIntents: https://docs.stripe.com/payments/payment-intents
- Stripe SetupIntents: https://docs.stripe.com/payments/setup-intents
- Stripe webhooks: https://docs.stripe.com/webhooks
- Prisma docs: https://www.prisma.io/docs
- BullMQ docs: https://docs.bullmq.io/
- Socket.IO Redis adapter docs: https://socket.io/docs/v4/redis-adapter/
- OpenTelemetry JS docs: https://opentelemetry.io/docs/languages/js/
- Fastlane docs: https://docs.fastlane.tools/

### Rules For Cline

Give Cline these non-negotiable rules:

1. Do not rewrite Flutter to another framework unless an ADR explicitly approves it.
2. Do not change database schema without a migration and rollback note.
3. Do not implement payment success from frontend redirects alone.
4. Do not let backend receive raw card number or CVC.
5. Do not introduce new endpoints without OpenAPI/schema updates.
6. Do not add business logic directly in controllers.
7. Do not use local filesystem uploads for production media.
8. Do not add secrets to source code.
9. Do not mark work complete without tests or a written reason tests cannot be added.
10. Do not perform broad refactors in the same PR as payment/data migration work.

## Implementation Roadmap

### Milestone 1: Stabilize Existing Stack

Goal: make the current app buildable, analyzable, and safe to change.

Tasks:

- Create monorepo or clean git repo.
- Pin Flutter version with FVM.
- Pin Node version with `.nvmrc`.
- Choose one package manager for backend: yarn or npm, not both lockfiles.
- Add backend `.env.example`.
- Add mobile env template.
- Remove hardcoded secrets and URLs from Flutter source.
- Add GitHub Actions baseline.
- Add Flutter analyze.
- Add TypeScript build.
- Add initial unit tests around auth/session/payment price calculation.
- Add OpenAPI skeleton.

Done when:

- Cline can run one command to validate backend.
- Cline can run one command to validate mobile.
- CI is green.

### Milestone 2: Mobile Modernization

Goal: keep Flutter, but make it current and maintainable.

Tasks:

- Upgrade Flutter stable and Dart SDK constraint.
- Upgrade Android Gradle Plugin, Gradle, Kotlin, compileSdk, targetSdk.
- Update iOS deployment target intentionally.
- Replace deprecated/unmaintained dependencies.
- Remove vendored `place_picker` or isolate it behind an adapter before replacement.
- Move all environment config to `--dart-define-from-file` or equivalent.
- Centralize socket/API/payment URLs.
- Add typed app error model.
- Add BLoC/repository tests for critical flows.

Done when:

- App builds for dev/UAT/prod.
- No hardcoded environment host is required in Dart code.
- At least auth, booking, and payment client flows have tests.

### Milestone 3: Backend Contract And Safety

Goal: turn the API from route/service code into a contract-driven system.

Tasks:

- Add validation middleware.
- Add DTO schemas.
- Generate OpenAPI.
- Add integration tests with a test database.
- Add rate limiting and security headers.
- Add structured logging and request IDs.
- Add health/readiness endpoints.
- Fix role enforcement for session mutation.
- Remove unauthenticated test/destructive routes from production builds.

Done when:

- Every route has validation.
- API docs can be generated automatically.
- Tests cover auth, session CRUD permissions, booking creation, payment intent creation.

### Milestone 4: Payment Redesign

Goal: make money movement trustworthy.

Tasks:

- Add Stripe webhook endpoint.
- Add payment intent table/model.
- Add immutable ledger.
- Replace raw card endpoint with SetupIntent/PaymentSheet.
- Add idempotency keys.
- Add refund/cancel state machine.
- Decide Stripe Connect.

Done when:

- Test card payment succeeds through Stripe SDK flow.
- Webhook marks booking paid.
- Replayed webhook does not duplicate ledger entries.
- Backend never receives card number/CVC.

### Milestone 5: Data Platform Migration

Goal: move from informal Mongo documents to professional transactional data.

Tasks:

- Create PostgreSQL schema.
- Write migration scripts.
- Backfill staging.
- Run reconciliation reports.
- Dual-write or maintenance-window migrate depending on production state.
- Remove or freeze old Mongo models after migration.

Done when:

- Staging can run on PostgreSQL.
- Data reconciliation passes.
- Production migration plan has rehearsed rollback.

### Milestone 6: Jobs, Realtime, Media

Goal: make scale-out safe.

Tasks:

- Add Redis.
- Add BullMQ worker.
- Move cron logic to jobs.
- Add Socket.IO Redis adapter.
- Move uploads to object storage.
- Add notification retry/dead-letter handling.

Done when:

- Multiple API instances can run without duplicate cron side effects.
- Socket users can connect through more than one API instance.
- Uploads survive redeploys and horizontal scaling.

### Milestone 7: Observability, Security, Release Excellence

Goal: operate like a company, not a demo.

Tasks:

- Add Sentry mobile/backend.
- Add OpenTelemetry.
- Add dashboards and alerts.
- Add dependency/security scanning.
- Add Fastlane mobile release.
- Add production runbooks.
- Add ADRs for Flutter, PostgreSQL, Stripe Connect, deployment platform.

Done when:

- A production issue can be diagnosed from logs/traces/errors.
- Release process is repeatable.
- Security checks run on every PR.

## Architecture Decision Records To Create

Create these ADR files before major implementation:

- `docs/architecture/ADR-001-keep-flutter.md`
- `docs/architecture/ADR-002-backend-framework.md`
- `docs/architecture/ADR-003-postgresql-vs-mongodb.md`
- `docs/architecture/ADR-004-stripe-payment-architecture.md`
- `docs/architecture/ADR-005-realtime-chat-architecture.md`
- `docs/architecture/ADR-006-file-storage.md`
- `docs/architecture/ADR-007-ci-cd-release.md`

Each ADR must contain:

- Context
- Decision
- Alternatives considered
- Consequences
- Migration plan
- Rollback plan

## Final Technology Recommendation

Target stack:

- Mobile: Flutter/Dart, BLoC or Riverpod only if a deliberate refactor is approved, Dio or generated OpenAPI client, Stripe Flutter SDK, Firebase Messaging, Sentry/Crashlytics.
- Backend: TypeScript, preferably NestJS modular monolith or disciplined Express/Fastify, Zod/class-validator, OpenAPI, Pino, OpenTelemetry, Sentry.
- Database: PostgreSQL for core business data, Prisma migrations, Redis for queues/cache/locks.
- Payments: Stripe PaymentIntents, SetupIntents, Webhooks, Connect for trainer payouts.
- Realtime: Socket.IO with Redis adapter.
- Jobs: BullMQ workers.
- Media: S3/R2/GCS signed uploads.
- CI/CD: GitHub Actions + Fastlane.
- Infrastructure: managed Postgres, managed Redis, object storage, containerized API/worker, staging/prod separation.

The masterpiece version of WorkitPT is not created by swapping Flutter for another frontend framework. It is created by keeping the good parts, modernizing them, and building the professional platform layer underneath: contracts, tests, transactions, observability, secure payments, real environments, and repeatable releases.

