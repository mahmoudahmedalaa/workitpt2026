# Troubleshooting

Add real issues here as they are discovered.

## GitHub Push Rejected For Secret Scanning

Symptom: Push fails even after the current file no longer contains the secret.

Cause: The secret exists in an earlier commit.

Fix:

1. Remove the secret from tracked files.
2. Add ignore rules.
3. Rewrite or squash local history before the first remote push.
4. Rotate the leaked secret if it was real.

## Yarn Command Missing

Symptom: `yarn: command not found`.

Fix:

```bash
corepack enable
corepack yarn --version
```

Use `corepack yarn ...` in automation for consistency.
