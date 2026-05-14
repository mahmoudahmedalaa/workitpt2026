# WorkitPT AI Prompting Guide

Use this structure when assigning work to Cline, DeepSeek, Codex, or another coding agent.

## Best Task Prompt

```text
Read AGENTS.md, docs/TECH_STACK_ELEVATION_PLAN.md, and the relevant workflow docs.

Task:
[One specific task]

Scope:
[Files/folders allowed]

Do not:
[Explicit exclusions]

Verification:
[Exact commands to run]

Definition of done:
[Observable result]
```

## Good Example

```text
Read AGENTS.md first.

Task: Add backend request validation for auth login/register only.
Scope: workitptproject/src/routes/v1/auth.routes.ts, controllers/services as needed, validation helper files.
Do not change payment, booking, or database schema.
Verification: corepack yarn build.
Definition of done: invalid payloads are rejected before auth service logic and build passes.
```

## Avoid

- "Fix everything."
- "Modernize the app" without a phase and scope.
- "Move to Postgres" without schema, migration, test, and rollback plan.
- "Make payments work" without Stripe webhook/idempotency requirements.
