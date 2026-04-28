# Daleel Mobile App (UI/UX Mock) — Flutter

Frontend-only UI/UX mock for the **Daleel** mobile application.  
No backend integration, no API calls, and all content is powered by **dummy/static data**.

## Tech

- Flutter (stable)
- Material 3 (Material UI only)
- Dummy repository layer (no networking)
- Localization readiness (EN/AR)

## Project structure

```
lib/
  app/            # App entry widgets (MaterialApp root)
  constants/      # Spacing, assets, misc constants
  models/         # Plain data models (Category, Business, User, Notification)
  repo/           # Dummy data + simple repository queries
  routing/        # Named routes + args
  screens/
    auth/         # 5 auth screens
    main/         # 10 main app screens
    settings/     # 5 settings/user screens
  theme/          # Centralized theme & colors
  widgets/
    common/       # Reusable UI components
    states/       # Empty/error state widgets
```

## Screens (20)

### Authentication (5)
- Splash
- Auth selection (WhatsApp / Email / Admin)
- OTP request (Phone/Email)
- OTP verification
- Admin login

### Main App (10)
- Home
- Categories list
- Businesses list (by category)
- Business details (images, description, rating, contact CTA)
- Search
- Search results
- Favorites
- Map view (UI only)
- Notifications
- Profile

### User & Settings (5)
- Settings
- Edit profile
- Language
- Notifications settings
- Privacy

## Design decisions

- **Centralized theme**: `lib/theme/app_theme.dart` controls spacing, shapes, and component themes to avoid scattered inline styling.
- **Reusable components**: cards, section headers, search field, and common empty/error states live in `lib/widgets/`.
- **Mobile-first layout**: safe areas, consistent paddings (`AppSpacing.pagePadding`), and readable typography.
- **No backend logic**: data comes from `lib/repo/dummy_data.dart` and query helpers in `lib/repo/daleel_repository.dart`.

## Run

```bash
cd daleel_app
flutter pub get
flutter run
```

# daleel_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
