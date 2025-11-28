# Job Finder

Lightweight two-role Flutter demo app (Employer & Employee) demonstrating job posting, listing, saving and basic settings.

This repository contains a small Flutter project created as a demo: two modules (Employer and Employee) share a single in-memory application state so jobs posted by an employer are immediately visible to employees.

## Features
- Employer module
  - Jobs tab: create job posts (title, description, salary, location)
  - Posted Jobs list
  - Dashboard: basic stats (posted jobs count)
  - Profile: edit basic employer info
  - Settings: Dark Mode toggle, Language switch (English / Nepali)
- Employee module
  - Dashboard: lists all jobs posted by employers
  - Job detail: view, apply (demo), save/unsave
  - Saved Jobs: lists saved jobs
  - Profile: employee details
  - Settings: Dark Mode toggle, Language switch (English / Nepali)

## Architecture / Key files
- `lib/models/job.dart` — `Job` model
- `lib/services/app_state.dart` — single `AppState` (ChangeNotifier) used app-wide to store jobs, saved job IDs, theme and language. Provided via `AppStateProvider`.
- `lib/localization.dart` — lightweight localization helper `L10n.t(key, lang)` for English/ Nepali strings used in UI
- `lib/widgets/job_card.dart` — reusable job tile used across lists
- `lib/modules/employer/` — employer screens and navigation
- `lib/modules/employee/` — employee screens and navigation
- `lib/main.dart` — app entry, theme wiring, and role picker (choose Employer or Employee)

## State & Sync behavior
- Jobs are stored in-memory inside `AppState`. When an employer posts a job using `AppState.addJob(...)`, the `AppState` notifies listeners and Employee screens read the updated `state.jobs` list. This keeps the posting/listing in sync across modules without external services.
- Saved jobs are tracked as a set of job IDs in `AppState.savedJobIds`.
- Theme (dark mode) and language choices are also stored in `AppState` so settings persist while the app runs.

## Limitations & Notes
- No persistent storage: all data is in-memory. App restarts will clear jobs and saved state.
- No authentication or multi-employer accounts: `employerId` is a simple integer used to associate jobs with an employer (default is `1`).
- No external packages: uses only Flutter SDK widgets and a simple provider pattern via `InheritedNotifier`. This keeps the demo minimal and dependency-free.

## Run the app
1. Ensure Flutter SDK is installed and your environment is set up.
2. From the project root open PowerShell and run:

```powershell
flutter pub get
flutter run
```

Choose a device/emulator when prompted. The app launches to a role picker — tap `Employer` or `Employee` to enter the corresponding module.

## Quick developer notes
- To post a job as an employer: navigate Employer → Jobs → Create Job. After posting, the app will show the employer job list; employees see the new job in their Dashboard.
- To save/unsave a job: Employee Dashboard → tap the bookmark icon on a job card or use the Save button on the job detail page.
- To toggle language: open Settings in either module and switch between `English` and `नेपाली`.
- To toggle Dark Mode: use the Dark Mode switch in Settings.

## Next steps (optional)
- Add persistence (e.g., `shared_preferences` or a small local DB) to persist jobs and preferences across restarts.
- Add authentication and multi-employer support to manage multiple employers and candidate identities.
- Improve localization by integrating Flutter's official localization tools and ARB files.
- Add unit/widget tests and CI checks (`flutter analyze`, `flutter test`).

## Design update

- The UI was recently upgraded to a polished, professional blue theme:
  - Centralized `AppTheme` provides consistent colors, elevated button styles, and app bar styling.
  - Job list cards use avatars, excerpts and clear CTA buttons for better readability.
  - Forms and lists use consistent spacing and card layouts for improved UX.


---
If you want, I can add persistence, wire up authentication or run `flutter analyze` and fix any warnings. Which would you like next?
# gorkha_byte

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
