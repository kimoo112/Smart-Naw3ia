# <img src="assets/images/light_mode_logo.png" width="40" height="40" alt="Smart Naw3ia Logo"> Smart Naw3ia


<div align="center">

[![Flutter Version](https://img.shields.io/badge/Flutter-3.2.3-blue.svg)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.2.3-blue.svg)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A modern Flutter application that provides a comprehensive set of features for managing daily tasks, notifications, and personal organization.

<img src="https://github.com/user-attachments/assets/c1871d6f-0b54-413a-965c-6ba4caaa3de7" width="100%" alt="Smart Naw3ia Cover" />

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

---

## 🖼️ Screenshots

<table>
<tr>
<td align="center"><strong>🟡 Splash Screen</strong><br>
<img src="https://github.com/user-attachments/assets/a73cfc22-162d-4626-9121-e10238507dfd" width="260" />
</td>
<td align="center"><strong>🏠 Home Screen</strong><br>
<img src="https://github.com/user-attachments/assets/d226d009-cc30-4019-b59d-38813cd4cef3" width="260" />
</td>
</tr>
<tr>
<td align="center"><strong>🧠 AI Chatbot</strong><br>
<img src="https://github.com/user-attachments/assets/80214eb7-8ea8-454a-8290-8a99b73ba9cd" width="260" />
</td>
<td align="center"><strong>📅 Calendar View</strong><br>
<img src="https://github.com/user-attachments/assets/d9bdf93b-c3fd-4848-bd18-e3ab26b3be55" width="260" />
</td>
</tr>
<tr>
<td align="center"><strong>📊 Exams Table</strong><br>
<img src="https://github.com/user-attachments/assets/8cd065c4-8064-405c-b057-acbbaeccbf15" width="260" />
</td>
<td align="center"><strong>👤 Profile Screen</strong><br>
<img src="https://github.com/user-attachments/assets/525bbe73-a97b-4cfb-8dd4-0ae88856c8ad" width="260" />
</td>
</tr>
<tr>
<td align="center"><strong>🔍 Search Screen</strong><br>
<img src="https://github.com/user-attachments/assets/151045d9-6a66-45c4-9826-d9977a902051" width="260" />
</td>
<td align="center"><br></td>
</tr>
</table>

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.2.3)
- Dart SDK (>=3.2.3)
- Android Studio / VS Code
- Git

### Installation

```bash
git clone https://github.com/yourusername/smart-naw3ia.git
cd smart-naw3ia
flutter pub get
flutter run
```

### Build and Release

```bash
# For Android
flutter build apk --release

# For iOS
flutter build ios --release
```

---

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
│   ├── chat/           # Chat system
│   ├── home/           # Home screen
│   ├── login/          # Authentication
│   ├── notifications/  # Notification handling
│   ├── onboarding/     # User onboarding
│   ├── profile/        # User profile
│   ├── search/         # Search functionality
│   ├── settings/       # App settings
│   └── splash/         # Splash screen
```

---

## 📦 Dependencies

### Core Dependencies

| Package | Version | Description |
|---------|---------|-------------|
| awesome_notifications | ^0.9.2 | Advanced notification handling |
| flutter_bloc | ^8.1.3 | State management |
| flutter_localization | ^0.3.2 | App localization |
| flutter_screenutil | ^5.9.0 | Responsive UI |
| go_router | ^13.0.0 | Declarative navigation |

### UI & Animation

| Package | Version | Description |
|---------|---------|-------------|
| flutter_expandable_fab | ^2.5.1 | Expandable FAB |
| flutter_iconly | ^1.0.2 | Icon collection |
| font_awesome_flutter | ^10.8.0 | Font Awesome icons |
| flutter_staggered_animations | ^1.1.1 | UI animations |
| lottie | ^3.3.1 | Lottie animation support |

### Storage & Security

| Package | Version | Description |
|---------|---------|-------------|
| flutter_secure_storage | ^9.2.4 | Encrypted storage |
| shared_preferences | ^2.5.3 | Local key-value store |

### Additional

| Package | Version | Description |
|---------|---------|-------------|
| table_calendar | ^3.0.9 | Calendar UI |
| intro_screen_onboarding_flutter | ^1.0.0 | Onboarding screens |
| url_launcher | ^6.2.4 | Launch URLs and deep links |

---

## 🤝 Contributing

1. Fork the repository  
2. Create your feature branch (`git checkout -b feature/YourFeature`)  
3. Commit your changes (`git commit -m 'Add your feature'`)  
4. Push to the branch (`git push origin feature/YourFeature`)  
5. Open a Pull Request  

---

## 📄 License

This project is licensed under the [MIT License](LICENSE)
