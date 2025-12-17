# Epsilon v7 - Science Olympiad Platform

A comprehensive Flutter-based mobile and web application built for managing the Epsilon Science Olympiad, a city-wide STEM competition that brought together **4,000+ students** from across the region.

## About Epsilon

Epsilon is a premier city-wide science olympiad that challenges students across multiple STEM disciplines. This application served as the central platform for team registration, module selection, payment tracking, and competition management for the entire event.

### Event Impact
- **4,000+ participating students**
- **Multiple competition modules** spanning various STEM fields
- **Cross-platform accessibility** (mobile, web, desktop)
- **Real-time team management** and module registration

## Competition Modules

The platform supports 11 distinct STEM competition modules:

1. **Autocode** - Programming and algorithmic challenges
2. **Euclid's Elements** - Mathematical problem-solving
3. **Sceptical Chymist** - Chemistry competitions
4. **Robosonic** - Robotics and engineering
5. **Voltaic** - Electronics and circuit design
6. **Escherian Stairwell** - Physics and mechanics
7. **Area 51** - Space and astronomy
8. **Cicada 3301** - Cryptography and code-breaking
9. **Cerebral Labyrinth** - Neuroscience and psychology
10. **Carson's Conundrum** - Environmental science
11. **Psychosphere** - Cognitive and behavioral sciences

## Features

### For Participants
- **Team Registration** - Register teams with up to 7 members (1 head delegate + 6 members)
- **Module Selection** - Choose from 11 STEM competition modules
- **Payment Management** - Upload payment proofs and track payment status
- **Team Dashboard** - View team information, module details, and competition updates
- **Module Changes** - Request module changes with verification

### For Organizers
- **Centralized Data Management** - All team and participant data in one platform
- **Real-time Updates** - Instant synchronization across all devices
- **Payment Tracking** - Monitor payment submissions and approvals
- **Scalable Architecture** - Successfully handled 4,000+ concurrent users

## Technical Stack

### Framework & Language
- **Flutter** - Cross-platform UI framework
- **Dart** (SDK >=2.18.4 <3.0.0)

### State Management
- **Provider** pattern with centralized `AppStateManager`
- **SharedPreferences** for persistent storage
- Reactive state updates across the entire app

### Key Dependencies
- **HTTP Client**: Dio, http
- **UI Components**: card_swiper, flip_card, dropdown_button2, custom_radio_grouped_button
- **Form Management**: intl_phone_number_input, dropdown_search
- **Image Handling**: image_picker, path_provider
- **Notifications**: fluttertoast, simple_fontellico_progress_dialog

### Architecture
- **Declarative Routing** using Flutter's RouterDelegate pattern
- **RESTful API Integration** with backend at epsilon.net.pk
- **Material Design 3** with custom branding
- **Responsive Design** for all screen sizes

## Project Structure

```
lib/
├── main.dart                      # Application entry point
├── navigation/
│   └── app_router.dart            # Routing logic
├── models/
│   ├── app_state-manager.dart     # Central state management (~1100 lines)
│   ├── epsilonPages.dart          # Route definitions
│   └── models.dart                # Model exports
├── screens/                       # UI screens
│   ├── splash_screen.dart         # Loading screen
│   ├── landingPage.dart           # Welcome page
│   ├── loginScreen.dart           # Authentication
│   ├── registerPageUpdate.dart    # Team registration
│   ├── portal.dart                # Main dashboard
│   ├── modulePage.dart            # Module details
│   ├── teamPage.dart              # Team information
│   ├── paymentPage.dart           # Payment management
│   └── forgotPage1-3.dart         # Password recovery
└── components/                    # Reusable widgets
    ├── Cards.dart                 # Module cards
    ├── Member1.dart               # Member entry forms
    ├── moduleSelection.dart       # Module selector
    └── phone.dart                 # Phone input widget
```

## Getting Started

### Prerequisites
- Flutter SDK (>=2.18.4)
- Dart SDK (>=2.18.4 <3.0.0)
- Android Studio / Xcode (for mobile development)
- A code editor (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd epsilon
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For mobile (iOS/Android)
   flutter run

   # For web
   flutter run -d chrome

   # For desktop
   flutter run -d macos    # macOS
   flutter run -d windows  # Windows
   ```

### Building for Production

```bash
# Android APK
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# macOS
flutter build macos --release

# Windows
flutter build windows --release
```

## Configuration

### Backend API
The app connects to the Epsilon backend at `https://www.epsilon.net.pk/query.php`. Update the API endpoint in `lib/models/app_state-manager.dart` if needed.

### App Icons
App icons are generated using `flutter_launcher_icons`. Source icon: `assets/e2.png`

To regenerate icons:
```bash
flutter pub run flutter_launcher_icons
```

### Custom Fonts
The app uses three custom font families:
- **Anton** - Display headers
- **Poppins** - Body text
- **Syne** - Alternative headings

## Features Breakdown

### Authentication System
- User login with email/password
- Registration with team details
- Password recovery (3-step verification)
- Session management with secure token storage

### Team Management
- Head delegate and up to 6 additional members
- Individual profiles (name, email, phone, institution)
- Team overview dashboard
- Member information editing

### Module System
- Browse 11 STEM competition modules
- Detailed module descriptions with imagery
- Module selection during registration
- Post-registration module change requests

### Payment Tracking
- Payment status monitoring
- Payment proof upload (image capture/gallery)
- Payment verification workflow

## Performance & Scale

Successfully deployed for the city-wide Epsilon Science Olympiad with:
- ✅ **4,000+ concurrent student users**
- ✅ **Cross-platform support** (iOS, Android, Web)
- ✅ **Real-time data synchronization**
- ✅ **Stable performance** under high load
- ✅ **Responsive UI** across all device sizes

## Design

### Branding
- **Primary Color**: Deep Purple (#361553)
- **Design System**: Material Design 3
- **Typography**: Anton, Poppins, Syne, Open Sans

### UI Patterns
- Card-based module selection
- Hero animations for smooth transitions
- Tab-based navigation
- Toast notifications for feedback
- Loading dialogs for async operations

## Code Statistics

- **Total Dart files**: 26
- **Lines of code**: ~7,700+
- **Screens**: 10
- **Reusable components**: 7
- **Supported platforms**: 6 (iOS, Android, Web, macOS, Windows, Linux)

## Contributing

This project was developed for the Epsilon Science Olympiad event. For inquiries or contributions, please contact the Epsilon organizing team.

## License

Copyright © Epsilon Science Olympiad

---

**Built with Flutter** 💙 | **Powered by Dart** 🎯 | **Made for 4,000+ Students** 🎓
