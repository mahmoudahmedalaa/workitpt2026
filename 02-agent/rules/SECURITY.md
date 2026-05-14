# Security Rules

## Secrets

- Never commit `.env`, `.env.*`, keystores, service account private keys, Stripe secret keys, JWT secrets, mail passwords, or database credentials.
- Keep only placeholder examples in `.env.example`.
- If a real secret is found, remove it from tracking and recommend rotation.

## Payments

- Backend must not accept raw card number or CVC.
- Use Stripe PaymentIntents/SetupIntents and verified webhooks.
- Webhook handlers must be idempotent.
- Wallet/ledger mutations must not double-run on webhook replay.

## API

- Add rate limits for auth, password reset, OTP, contact, payment, and upload endpoints.
- Validate all incoming payloads server-side.
- Do not rely on mobile-side checks as security.
- Do not use static mobile app keys as a real security boundary.

## Logging

- Never log passwords, tokens, card details, OTPs, private user health data, or raw credentials.
- Use request IDs and structured logs during backend modernization.
