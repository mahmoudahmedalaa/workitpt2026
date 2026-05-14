# Production Hardening

Before launch, WorkitPT must pass these gates.

## Environment

- [ ] Dev, staging, and production use separate API URLs.
- [ ] Dev, staging, and production use separate Firebase projects/apps.
- [ ] No hardcoded mobile API secrets remain.
- [ ] `.env` files are not committed.
- [ ] Signing credentials live only in secure local/CI secret storage.

## Backend

- [ ] Runtime validation exists for every endpoint.
- [ ] OpenAPI contract exists and is reviewed.
- [ ] Auth, payment, booking, upload, and admin endpoints are rate-limited.
- [ ] Security headers and strict CORS are configured.
- [ ] Structured logging, request IDs, and error tracking are configured.
- [ ] Background jobs do not run inside every API instance.

## Payments

- [ ] Backend never receives card number/CVC.
- [ ] Stripe webhook signature verification is implemented.
- [ ] Payment finalization is idempotent.
- [ ] Ledger entries are immutable.
- [ ] Refund/cancellation behavior is documented and tested.
- [ ] Stripe Connect decision is documented for trainer payouts.

## Mobile

- [ ] Flutter tooling is upgraded or intentionally pinned.
- [ ] Debug prints/logs are removed or guarded.
- [ ] Payment flow uses Stripe-native SDK/PaymentSheet or a documented safe Checkout flow.
- [ ] Crash reporting is enabled.
- [ ] Physical iOS and Android devices have been tested.

## Data

- [ ] Database backup and restore are tested.
- [ ] Migration scripts are repeatable.
- [ ] Unique constraints/indexes exist for user email, bookings, payment IDs, and ledger references.
