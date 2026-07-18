# Road Construction Monitoring Dashboard

Flutter assessment project built using flutter_bloc with an MVC style folder layout.

## How to run

1. Copy the `lib` folder and `pubspec.yaml` into a new Flutter project, or create a new project with `flutter create road_construction_app` and replace its `lib` folder and `pubspec.yaml` with these.
2. Run `flutter pub get`
3. Run `flutter run`

## Folder structure

- `core/` - theme, routing, responsive helper, debouncer, date formatter
- `models/` - plain Dart data classes with fromJson/toJson
- `data/local/mock_data.dart` - local dataset acting as the data source (15 projects, 5 districts, 5 authorities)
- `data/repository/` - repository layer between bloc and data source, simulates network delay, has a simulateError flag for testing error UI
- `controllers/` - one bloc (event, state, bloc) per screen
- `views/` - one folder per screen, each with its own `widgets/` folder for screen-specific UI pieces
- `widgets/` - shared widgets used across more than one screen

## Notes

- No authentication, as per the requirement.
- Navigation uses go_router with a bottom nav shell (Dashboard, Projects, Analytics, More). Compare, Authority Performance, and Notifications are opened from the More sheet.
- Dark mode toggle is in the app bar (sun/moon icon).
- Pull to refresh is available on Dashboard, Projects, and Authority screens.
- Search on Projects screen is debounced by 400ms.
- Skeleton loaders are shown while data loads, and every screen has an error state with retry.
