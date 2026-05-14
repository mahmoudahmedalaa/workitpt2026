# WorkitPT Component Revamp Task Index

Date: 2026-05-15

Purpose: use this as the checklist for improving every component area. Each item should become one focused AI task or GitHub issue.

Legend:

- P0: launch blocker
- P1: should complete before public launch
- P2: important but can follow once core is stable

## Task Prompt Template

```text
Read AGENTS.md, .clinerules, docs/TECHNICAL_RECOMMENDATIONS.md,
docs/PLATFORM_ELEVATION_MASTER_PLAN.md, and task [ID] from
docs/COMPONENT_REVAMP_TASK_INDEX.md.

Implement task [ID] only.
Do not change unrelated architecture.
Run verification commands.
Update docs if the task changes the plan.
```

## Foundation

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| FND-001 | P0 | ADRs | Add missing ADRs for backend framework, database, Stripe, storage, jobs/realtime | ADRs exist and are linked from README |
| FND-002 | P0 | CI | Add backend test and mobile test jobs after test scripts exist | CI fails on broken build/test |
| FND-003 | P0 | Secret scanning | Add GitHub secret scanning/dependency review workflow | Secret-like commits are blocked |
| FND-004 | P1 | Issue system | Convert this task index into GitHub issues/milestones | Every task has owner/status |
| FND-005 | P1 | Runbooks | Add rollback, incident, and release runbooks | Docs exist in `docs/runbooks/` |

## Backend Tooling

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| BE-001 | P0 | Test runner | Add Vitest/Jest + Supertest | `corepack yarn test` runs |
| BE-002 | P0 | Lint | Fix ESLint setup and add `lint` script | `corepack yarn lint` runs |
| BE-003 | P0 | Env validation | Add required env validation at boot | Production fails fast on missing critical env |
| BE-004 | P1 | TypeScript strictness | Plan strict mode tightening | ADR/task plan exists; no broad breakage |
| BE-005 | P1 | Health endpoints | Add liveness/readiness endpoints | API exposes health checks |

## API Contract

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| API-001 | P0 | Validation foundation | Add Zod validation middleware | One endpoint uses it successfully |
| API-002 | P0 | Auth schemas | Validate login/register/password flows | Bad payloads fail before service logic |
| API-003 | P0 | Booking schemas | Validate booking add/list/detail inputs | Tests cover invalid inputs |
| API-004 | P0 | Payment schemas | Validate payment intent/webhook inputs | Payment endpoints are schema-bound |
| API-005 | P1 | OpenAPI | Generate OpenAPI from schemas | Spec committed and CI checked |
| API-006 | P1 | Error standard | Standardize API errors | Flutter can map error codes |
| API-007 | P1 | Pagination | Standardize cursor/limit pagination | List endpoints are consistent |

## Authentication And Accounts

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| AUTH-001 | P0 | Email uniqueness | Normalize and uniquely constrain emails | Duplicate accounts blocked |
| AUTH-002 | P0 | Rate limits | Add rate limits for auth/OTP/reset | Abuse is bounded |
| AUTH-003 | P0 | Token lifecycle | Define access/refresh/revocation model | Tests cover expiration/revocation |
| AUTH-004 | P1 | Social auth | Audit Google/Apple/Facebook account linking | Linking rules documented/tested |
| AUTH-005 | P1 | Delete account | Verify full cleanup and App Store compliance | Tests and docs exist |
| AUTH-006 | P1 | Audit logs | Add account audit events | Sensitive changes are traceable |

## Users, Trainers, And Customers

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| USER-001 | P0 | Profile model | Normalize trainer/customer profile fields | Canonical schema documented |
| USER-002 | P0 | Trainer approval | Formalize verification status workflow | Admin/trainer states tested |
| USER-003 | P1 | Search filters | Validate trainer search inputs and indexes | Search is performant and bounded |
| USER-004 | P1 | Location data | Standardize coordinates/address fields | No misspelled/duplicate location fields |
| USER-005 | P1 | Medical data | Define privacy rules for sensitive profile fields | No sensitive data logged |

## Sessions And Booking

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| BOOK-001 | P0 | Session lifecycle | Define session statuses and transitions | State machine documented/tested |
| BOOK-002 | P0 | Booking lifecycle | Define active/pending/paid/cancelled/completed/no-show | State machine documented/tested |
| BOOK-003 | P0 | Capacity | Prevent overbooking and double booking | Concurrent tests pass |
| BOOK-004 | P0 | Timezones | Replace fragile string date/time handling | Timezone tests exist |
| BOOK-005 | P1 | Recurrence | Normalize recurring session model | Repeating sessions are predictable |
| BOOK-006 | P1 | Cancellation | Add cancellation/refund policy hooks | Payment/booking states stay consistent |
| BOOK-007 | P1 | Attendance | Define visited/no-show/completed behavior | Trainer/customer flows tested |

## Payments, Wallet, Payouts

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| PAY-001 | P0 | Stripe ADR | Document final Stripe architecture | ADR accepted |
| PAY-002 | P0 | Remove raw card handling | Delete backend raw card number/CVC flow | Backend never receives PAN/CVC |
| PAY-003 | P0 | PaymentIntent | Add create/retrieve PaymentIntent flow | Mobile can confirm payment safely |
| PAY-004 | P0 | SetupIntent | Add saved card flow via Stripe SDK | Backend stores only PM IDs |
| PAY-005 | P0 | Webhooks | Add verified Stripe webhook endpoint | Webhook tests pass |
| PAY-006 | P0 | Idempotency | Add idempotency for payment finalization | Replay cannot double-credit |
| PAY-007 | P0 | Ledger | Add immutable ledger model | Balance can be rebuilt |
| PAY-008 | P1 | Refunds | Add refund/cancellation handling | Refund tests pass |
| PAY-009 | P1 | Payouts | Decide and implement Stripe Connect or controlled withdrawals | Trainer payouts are compliant |

## Chat And Realtime

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| CHAT-001 | P1 | Thread model | Add explicit chat threads | Messages belong to threads |
| CHAT-002 | P1 | Persistence-first send | Persist before socket broadcast | Reconnect cannot lose message |
| CHAT-003 | P1 | Redis adapter | Add Socket.IO Redis adapter | Multi-instance sockets work |
| CHAT-004 | P1 | Read receipts | Add seen/delivered model | UI can show state |
| CHAT-005 | P2 | Moderation | Add report/block hooks | Abuse workflow exists |

## Notifications

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| NOTI-001 | P0 | Firebase credentials | Env-only Firebase Admin credentials | No service JSON in git |
| NOTI-002 | P1 | Queue sends | Send notifications from worker | Retryable delivery |
| NOTI-003 | P1 | Templates | Separate push/email/in-app templates | Consistent messaging |
| NOTI-004 | P1 | Delivery logs | Store attempts and failures | Failures visible |
| NOTI-005 | P2 | Preferences | User notification settings | Opt-outs respected |

## Jobs And Workers

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| JOB-001 | P0 | Redis | Add Redis config/client | Used by queues/rate limit |
| JOB-002 | P0 | BullMQ | Add worker process | Worker runs separately |
| JOB-003 | P0 | Complete booking job | Move from API cron to worker | Idempotent and tested |
| JOB-004 | P1 | Upcoming reminder job | Move reminders to worker | No duplicate notifications |
| JOB-005 | P1 | Stale payment job | Cleanup abandoned pending payments | Recoverable payment state |
| JOB-006 | P1 | Dead-letter queue | Failed jobs visible | Operators can retry/fix |

## Media And Uploads

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| MEDIA-001 | P0 | Storage ADR | Choose S3/R2/GCS | ADR accepted |
| MEDIA-002 | P0 | Signed uploads | Replace local multer production dependency | App uploads to object storage |
| MEDIA-003 | P1 | File metadata | Add metadata model | Files are auditable |
| MEDIA-004 | P1 | Validation | MIME/extension/size checks | Unsafe files rejected |
| MEDIA-005 | P1 | Image pipeline | Resize/compress avatars/session images | Stable media URLs |
| MEDIA-006 | P2 | Malware scanning | Decide certificate scanning strategy | Security decision documented |

## Mobile App Foundation

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| MOB-001 | P0 | Env config | Replace hardcoded API/socket config | Dev/UAT/prod are separate |
| MOB-002 | P0 | Remove mobile secrets | Remove static API gate keys | No app-bundled secret boundary |
| MOB-003 | P0 | Stripe SDK | Replace payment WebView/card forms | PaymentSheet works in test mode |
| MOB-004 | P1 | Flutter upgrade | Upgrade Flutter/toolchain in branch | App builds on iOS/Android |
| MOB-005 | P1 | Analyzer strictness | Fix 6 current info issues and tighten CI | `flutter analyze` strict passes |
| MOB-006 | P1 | Place picker | Replace/isolate vendored picker | Maintained maps integration |
| MOB-007 | P1 | Dependency audit | Upgrade risky/outdated packages | No blocked/deprecated critical deps |
| MOB-008 | P1 | App logging | Remove debug prints from release paths | No sensitive logs |

## Mobile Feature Areas

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| M-AUTH-001 | P0 | Auth UI/state | Login/register/OTP/reset/session tests | Critical auth flows tested |
| M-PROF-001 | P1 | Profile | Customer/trainer profile validation and errors | Profile update reliable |
| M-TRAIN-001 | P1 | Trainer discovery | Search/filter pagination and loading/error states | Search UX stable |
| M-SESS-001 | P0 | Sessions | Create/update/delete/session detail states | Trainer session flows tested |
| M-BOOK-001 | P0 | Booking | Booking lifecycle screens and payment handoff | Booking flow tested |
| M-PAY-001 | P0 | Payment | Stripe SDK integration and receipt state | Payment flow tested |
| M-CHAT-001 | P1 | Chat | Reconnect/history/read state | Chat does not lose messages |
| M-NOTI-001 | P1 | Notifications | Permission/token refresh/deep link handling | Push flow tested |
| M-WALLET-001 | P1 | Wallet | Balance/history/withdraw states | Financial UI matches ledger |
| M-HOME-001 | P2 | Home/dashboard | Analytics loading/error/empty states | No fragile dummy data |
| M-ONBD-001 | P2 | Onboarding | First-run/returning-user flow | Launch gate deterministic |

## Observability

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| OBS-001 | P0 | Backend errors | Add Sentry backend | Exceptions captured |
| OBS-002 | P1 | Mobile crashes | Add Sentry/Crashlytics | Crashes tied to release |
| OBS-003 | P1 | Logs | Add Pino/request IDs | Logs trace requests |
| OBS-004 | P1 | Metrics/traces | Add OpenTelemetry baseline | API latency visible |
| OBS-005 | P2 | Dashboards | Payment/booking/job dashboards | Ops can monitor platform |

## Admin And Ops

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| ADM-001 | P0 | RBAC audit | Verify all admin/trainer/user permissions | Tests cover forbidden actions |
| ADM-002 | P0 | Migration routes | Remove/guard dev migration endpoints | Not exposed in prod |
| ADM-003 | P1 | Approval workflow | Trainer approval states and audit | Admin actions traceable |
| ADM-004 | P1 | Payout review | Withdrawal/payout approval workflow | Financial ops safe |
| ADM-005 | P2 | Admin UI | Plan/build admin dashboard | Operators stop using raw endpoints |

## Documentation And Release

| ID | Priority | Component | Scope | Done Means |
|:---|:---|:---|:---|:---|
| DOC-001 | P0 | README | Keep setup and verification current | Fresh clone setup works |
| DOC-002 | P0 | Handover | Update `docs/AI_HANDOVER.md` after major tasks | Next AI has context |
| DOC-003 | P1 | App Store checklist | Add detailed iOS/Android store checklist | Launch requirements known |
| DOC-004 | P1 | Legal docs | Privacy policy/terms/delete account references | Store compliance ready |
| REL-001 | P1 | Staging deploy | Add staging backend deploy | UAT environment exists |
| REL-002 | P1 | Mobile internal builds | Add TestFlight/Play internal process | QA can test real builds |
| REL-003 | P1 | Rollback runbook | Backend/mobile rollback docs | Incidents have playbook |
