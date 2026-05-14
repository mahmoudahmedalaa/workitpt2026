# WorkitPT MVP Launch Checklist

## Repository

- [ ] Root README is current.
- [ ] `AGENTS.md` and `.clinerules` are current.
- [ ] CI passes on `main`.
- [ ] No secrets are tracked.
- [ ] Archive/build/dependency folders are ignored.

## Mobile

- [ ] iOS dev build runs on physical device.
- [ ] Android dev build runs on physical device.
- [ ] App uses correct dev/staging/prod API URLs.
- [ ] Firebase configs are separated by environment.
- [ ] Crash reporting is configured.
- [ ] Core flows have tests.

## Backend

- [ ] API builds from a fresh clone.
- [ ] `.env.example` is complete.
- [ ] Runtime validation is present.
- [ ] Auth, booking, payment, chat, notifications have baseline tests.
- [ ] Health/readiness endpoints exist.
- [ ] Logs and error tracking are configured.

## Payments

- [ ] No raw card number/CVC touches backend.
- [ ] Stripe webhook endpoint verifies signatures.
- [ ] Payment finalization is idempotent.
- [ ] Ledger and wallet behavior is tested.
- [ ] Refund/cancellation rules are documented.

## Data

- [ ] Database choice ADR is approved.
- [ ] Migration plan exists.
- [ ] Backup/restore tested on staging.
- [ ] Unique constraints/indexes reviewed.

## Legal/App Store

- [ ] Privacy policy.
- [ ] Terms of service.
- [ ] Delete account flow.
- [ ] Support email.
- [ ] App Store/Play Store screenshots.

## Go/No-Go

Decision: `NO-GO` until every P0 item above is resolved.
