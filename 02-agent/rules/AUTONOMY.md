# Autonomy Rules

## Act Without Asking

- Run local checks, builds, installs, and tests.
- Add missing documentation.
- Fix clear type/build errors in files already being changed.
- Add `.env.example` placeholders.
- Improve `.gitignore` for local junk, build outputs, and secrets.
- Add tests for existing behavior.

## Explain Then Act

- Add or update CI workflows.
- Add lint/test scripts.
- Refactor multiple files.
- Upgrade Flutter, Android Gradle Plugin, Kotlin, Node, or major packages.
- Introduce a new library.

## Ask First

- Rewrite Flutter to another framework.
- Change database technology in implementation.
- Change auth, payments, or payout architecture.
- Delete folders or features.
- Touch production credentials or production data.
- Force push a shared branch.

## Stop Conditions

Stop and ask if:

- The same verification failure remains after 3 focused attempts.
- A fix requires changing architecture not covered in docs.
- You discover real secrets committed to remote history.
- You cannot tell whether a file is active source or historical archive.
