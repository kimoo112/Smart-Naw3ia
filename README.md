# <img src="assets/images/light_mode_logo.png" width="40" height="40" alt="Smart Naw3ia Logo"> Smart Naw3ia

<div align="center">

[![Flutter Version](https://img.shields.io/badge/Flutter-3.2.3-blue.svg)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.2.3-blue.svg)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A modern Flutter application that provides a comprehensive set of features for managing daily tasks, notifications, and personal organization.

[Features](#features) • [Installation](#installation) • [Project Structure](#project-structure) • [Dependencies](#dependencies) • [Contributing](#contributing)

</div>

## ✨ Features

<table>
<tr>
<td width="50%">

### 🌙 Theme Support
- Dark/Light mode
- Custom color schemes
- Dynamic theme switching

### 🌍 Localization
- English & Arabic support
- Easy language switching
- RTL/LTR layout support

### 📅 Calendar
- Event management
- Task scheduling
- Reminder system

</td>
<td width="50%">

### 🔔 Notifications
- Smart notifications
- Custom notification sounds
- Priority levels

### 💬 Chat
- Real-time messaging
- File sharing
- Message history

### 🔍 Search
- Advanced search filters
- Quick access
- Search history

</td>
</tr>
</table>

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.2.3)
- Dart SDK (>=3.2.3)
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/smart-naw3ia.git
```

2. Navigate to the project directory:
```bash
cd smart-naw3ia
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── core/
│   ├── cache/          # Local storage and caching
│   ├── localization/   # Language and translations
│   ├── routes/         # Navigation and routing
│   ├── theme/          # App theming
│   └── utils/          # Utility functions
├── features/
│   ├── calendar/       # Calendar functionality
│   ├── chat/          # Chat system
│   ├── home/          # Home screen
│   ├── login/         # Authentication
│   ├── notifications/ # Notification handling
│   ├── onboarding/    # User onboarding
│   ├── profile/       # User profile
│   ├── search/        # Search functionality
│   ├── settings/      # App settings
│   └── splash/        # Splash screen
```

## 📦 Dependencies

### Core Dependencies

| Package | Version | Description |
|---------|---------|-------------|
| [awesome_notifications](https://pub.dev/packages/awesome_notifications) | ^0.9.2 | Advanced notification handling with custom features |
| [flutter_bloc](https://pub.dev/packages/flutter_bloc) | ^8.1.3 | State management using BLoC pattern |
| [flutter_localization](https://pub.dev/packages/flutter_localization) | ^0.3.2 | App localization and translations |
| [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) | ^5.9.0 | Responsive UI across different screen sizes |
| [go_router](https://pub.dev/packages/go_router) | ^13.0.0 | Declarative routing and navigation |

### UI Dependencies

| Package | Version | Description |
|---------|---------|-------------|
| [flutter_expandable_fab](https://pub.dev/packages/flutter_expandable_fab) | ^2.5.1 | Expandable floating action buttons |
| [flutter_iconly](https://pub.dev/packages/flutter_iconly) | ^1.0.2 | Beautiful icon collection |
| [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter) | ^10.8.0 | Font Awesome icons for Flutter |
| [flutter_staggered_animations](https://pub.dev/packages/flutter_staggered_animations) | ^1.1.1 | List and grid animations |
| [lottie](https://pub.dev/packages/lottie) | ^3.3.1 | Lottie animations support |

### Storage & Security

| Package | Version | Description |
|---------|---------|-------------|
| [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) | ^9.2.4 | Secure storage for sensitive data |
| [shared_preferences](https://pub.dev/packages/shared_preferences) | ^2.5.3 | Simple key-value storage |

### Additional Features

| Package | Version | Description |
|---------|---------|-------------|
| [table_calendar](https://pub.dev/packages/table_calendar) | ^3.0.9 | Calendar functionality |
| [intro_screen_onboarding_flutter](https://pub.dev/packages/intro_screen_onboarding_flutter) | ^1.0.0 | Onboarding screens |
| [url_launcher](https://pub.dev/packages/url_launcher) | ^6.2.4 | URL handling and deep links |

### Development Dependencies

| Package | Version | Description |
|---------|---------|-------------|
| [flutter_lints](https://pub.dev/packages/flutter_lints) | ^2.0.0 | Flutter coding standards |
| [flutter_test](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html) | latest | Flutter testing framework |

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
