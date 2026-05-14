# MCP Setup For WorkitPT

Use these MCPs/connectors/tools when available. If unavailable, continue with local code inspection and official docs.

## Essential

- GitHub: repository, branches, PRs, issues, CI status.
- Filesystem/local workspace: read/write project files.
- Browser/Playwright: verify web/admin/API docs/payment redirects where applicable.
- Stripe: inspect test PaymentIntents, Checkout Sessions, webhooks, customers, connected accounts, refunds.
- PostgreSQL/Supabase: future schema inspection, migrations, staging data checks.

## Strongly Recommended

- Firebase/Google Cloud: FCM config, Firebase apps, service account setup, Crashlytics.
- Sentry: crash/error/performance event inspection.
- Vercel or deployment provider: deployment logs, env vars, previews.
- Context/documentation MCP: current official docs for Flutter, Stripe, Prisma, Socket.IO, BullMQ, OpenTelemetry.

## Agent Skills Needed

- Flutter modernization and BLoC testing.
- TypeScript backend validation and API contracts.
- Stripe PaymentIntents, SetupIntents, webhooks, and Connect.
- PostgreSQL/Prisma migrations.
- Redis/BullMQ queues and idempotent workers.
- Socket.IO scaling with Redis adapter.
- GitHub Actions and mobile release automation.
- Security scanning and threat modeling.

## Rules

- Do not use MCP access to mutate production data unless explicitly approved.
- Prefer staging/test resources.
- When a connector exposes secrets or credentials, do not paste them into source files or chat logs.
- Document every MCP-dependent change in the final handover.
