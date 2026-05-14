# WorkitPT Agent Guide

This folder contains the project-specific operating rules for AI agents.

## Source Of Truth

- Product/platform direction: `docs/TECH_STACK_ELEVATION_PLAN.md`
- Root onboarding: `README.md`
- Agent boot file: `AGENTS.md`
- Development workflow: `03-workflows/DEVELOPMENT.md`
- Testing workflow: `03-workflows/TESTING.md`
- Launch readiness: `05-checklists/MVP_LAUNCH.md`

## Current Priorities

1. Keep the repo clean, buildable, and easy for agents to reason about.
2. Establish CI and local verification.
3. Remove secrets and hardcoded environment coupling.
4. Add API contracts and tests.
5. Redesign payments and data consistency before production launch.

## Decision Policy

When in doubt:

- Read the docs first.
- Inspect the existing code.
- Prefer a small reversible change.
- Verify with commands.
- Document what changed.

Do not use the template files as generic truth. WorkitPT has its own stack: Flutter, Dart, TypeScript, Express, MongoDB today, PostgreSQL target, Stripe, Firebase Messaging, Socket.IO.
