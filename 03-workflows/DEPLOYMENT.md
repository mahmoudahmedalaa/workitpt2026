# Deployment Workflow

## Environments

| Environment | Purpose | Branch |
|:------------|:--------|:-------|
| Development | Local work | feature branches |
| Staging/UAT | Full verification before release | `develop` or release branch |
| Production | Real users | `main` release tag |

## Backend Target

The backend should eventually deploy as at least two processes:

- API process.
- Worker process for jobs/queues.

Do not deploy cron jobs inside every horizontally scaled API instance.

## Mobile Target

- iOS: TestFlight before App Store release.
- Android: Internal testing track before production.
- Signing credentials must be managed outside git.

## Release Gate

Before any production release:

- CI passes.
- Staging smoke test passes.
- Payment sandbox flow passes.
- Rollback plan exists.
- `05-checklists/MVP_LAUNCH.md` is reviewed.
