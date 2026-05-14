# Lessons Learned

## 2026-05-15 Repository Foundation

- Historical zips and vendor handoff material should live in local `archive/` and stay out of git.
- GitHub can reject a push if a secret-like value exists in old commits, even if the current file is cleaned.
- Flutter/Gradle lock and wrapper files are important for reproducible builds and should be tracked.
- Backend should use one package manager. This repo keeps `yarn.lock` and ignores `package-lock.json`.
- Do not treat Flutter as the main risk. Backend payments, data consistency, tests, environments, and observability are bigger launch blockers.
