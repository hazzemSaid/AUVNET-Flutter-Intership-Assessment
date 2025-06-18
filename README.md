# AUVNET Flutter E-commerce App

A modern e-commerce application built with Flutter, incorporating best practices and a robust architecture.

## 🌟 Features

- Authentication System
- E-commerce Functionality
- Responsive Design
- Dark/Light Theme Support
- Local Storage with Hive
- Firebase Integration
- BLoC Pattern State Management

## 🛠 Tech Stack

- **Framework**: Flutter
- **State Management**: BLoC Pattern
- **Backend**: Firebase
  - Firebase Core
  - Firebase Auth
  - Cloud Firestore
  - Firebase Storage
- **Local Storage**: Hive
- **Routing**: Go Router
- **Other Dependencies**:
  - flutter_bloc
  - get_it (Dependency Injection)
  - equatable
  - flutter_svg_provider

## 🏗 Architecture

The project follows a clean architecture approach with the following structure:

```
lib/
├── config/
│   ├── observing/
│   └── routes/
├── core/
│   ├── Dependency_injection/
│   └── constants/
└── features/
    └── auth/
        └── presentation/
            └── viewmodel/
                └── bloc/
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Firebase Project Setup
- Android Studio / VS Code

### Installation

1. Clone the repository:
```bash
git clone https://github.com/hazzemSaid/AUVNET-Flutter-Intership-Assessment.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Add your `google-services.json` for Android
   - Add your `GoogleService-Info.plist` for iOS
   - Ensure Firebase configuration matches `firebase_options.dart`

4. Run the app:
```bash
flutter run
```

## 📱 Supported Platforms

- Android
- iOS
- Web
- Linux
- (Other platforms may work but aren't officially supported)

## 🎨 Theming

The app supports both light and dark themes, configured in the `AppThemes` class. Theme mode is system-dependent by default.

## 📦 State Management

The app uses BLoC (Business Logic Component) pattern for state management:
- Separates business logic from UI
- Implements Observer pattern
- Uses Flutter Bloc for reactive state management

## 🔐 Authentication

Authentication is handled through Firebase Auth with features like:
- User registration
- Login
- Session management
- Secure storage of auth tokens

## 💾 Local Storage

The app uses Hive for local storage with two main boxes:
- `authBox`: Stores authentication-related data
- `homeBox`: Stores application data

## 🛣 Routing

Navigation is handled by Go Router, providing:
- Declarative routing
- Deep linking support
- Route guards

## 🎯 Dependencies

```yaml
dependencies:
  firebase_core: ^3.14.0
  bloc: ^9.0.0
  flutter_bloc: ^9.1.1
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  firebase_auth: ^5.6.0
  go_router: ^15.2.0
  equatable: ^2.0.7
  get_it: ^8.0.3
  flutter_svg_provider: ^1.0.7
  cloud_firestore: ^5.6.9
  firebase_storage: ^12.4.7
```

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check [issues page](https://github.com/hazzemSaid/AUVNET-Flutter-Intership-Assessment/issues).

## 📝 License

This project is under development as part of the AUVNET Flutter Internship Assessment.

## 👨‍💻 Author

**Hazzem Said**
