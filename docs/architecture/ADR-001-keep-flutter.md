# ADR-001: Keep Flutter For The Mobile App

Date: 2026-05-15

## Status

Accepted.

## Context

WorkitPT targets iOS and Android users. The existing mobile app is already built in Flutter/Dart with a feature-first structure, BLoC state management, Firebase Messaging, maps, chat, payments, and generated models.

The app is old and needs modernization, but the largest launch risks are not caused by Flutter itself. The larger risks are backend payments, data consistency, missing tests, missing API contracts, hardcoded environment configuration, outdated mobile tooling, missing CI/CD, and missing observability.

## Decision

Keep Flutter/Dart as the mobile platform for the next phase.

Modernize the existing app instead of rewriting it into native Swift/Kotlin or React Native.

## Alternatives Considered

- Native Swift + Kotlin: best native polish, but highest cost and still does not solve backend/data/payment risks.
- React Native: viable if the company becomes React-first, but rewriting would not automatically improve architecture or launch readiness.
- Kotlin Multiplatform: interesting for shared logic but not the right rescue path for this codebase today.

## Consequences

- Engineering effort can focus on platform reliability, payments, data, tests, and operations.
- One mobile codebase remains responsible for both iOS and Android.
- Flutter dependencies and native build tooling must be upgraded carefully.
- Deep future native integrations should be evaluated case by case.

## Revisit If

- The company hires separate senior native iOS and Android teams.
- The product becomes heavily dependent on HealthKit, Health Connect, wearables, Bluetooth hardware, or advanced background sensors.
- Flutter plugin limitations become a recurring blocker after modernization.
