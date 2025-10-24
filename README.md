# TestEasyRental 🚗

A modern car rental application built with Flutter, featuring a clean architecture, state management with BLoC/Cubit, and a beautiful user interface.

## 📱 Features

### 🔐 Authentication
- **Splash Screen** - App initialization and loading
- **Onboarding Screen** - Welcome introduction for new users
- **Login Screen** - User authentication with mock data
- **OTP Verification** - Secure phone number verification

### 🏠 Home & Navigation
- **Home Screen** - Featured cars and quick access
- **Bottom Navigation** - Easy app navigation
- **Profile Screen** - User account management

### 🚙 Car Management
- **Car List Screen** - Browse all available cars
- **Car Details Screen** - Detailed car information with features
- **Car Search & Filter** - Find cars by brand, price, etc.

### 📅 Booking System
- **Booking Form** - Car rental booking with date/time selection
- **Booking Confirmation** - Booking success and details
- **Booking History** - View past and current bookings

## 🏗️ Architecture

### Clean Architecture Pattern
```
lib/
├── core/                    # Core utilities and configurations
│   ├── constants/          # App constants and colors
│   ├── router/             # Go Router configuration
│   ├── services/           # API and storage services
│   ├── storage/            # Secure storage implementation
│   └── theme/              # App theme and styles
├── features/               # Feature-based modules
│   ├── auth/               # Authentication feature
│   ├── cars/               # Car management feature
│   ├── booking/            # Booking feature
│   ├── home/               # Home feature
│   └── navigation/         # Navigation feature
└── shared/                 # Shared utilities and models
```

### State Management
- **BLoC/Cubit Pattern** - Predictable state management
- **Repository Pattern** - Data abstraction layer
- **Entity Models** - Clean data models

## 🛠️ Tech Stack

### Core Technologies
- **Flutter** - Cross-platform mobile development
- **Dart** - Programming language
- **BLoC/Cubit** - State management
- **Go Router** - Declarative routing

### Key Dependencies
- `flutter_bloc: ^8.1.6` - State management
- `go_router: ^14.2.7` - Navigation routing
- `dio: ^5.7.0` - HTTP client for API calls
- `flutter_secure_storage: ^9.2.2` - Secure data storage
- `equatable: ^2.0.5` - Value equality

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd test_easy_rental
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Project Structure
```
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart      # Color definitions
│   │   └── app_constants.dart   # App-wide constants
│   ├── router/
│   │   └── app_router.dart      # Route configuration
│   ├── services/
│   │   ├── api_service.dart     # HTTP client setup
│   │   └── cars_mock_service.dart # Mock data service
│   ├── storage/
│   │   └── secure_storage_service.dart # Secure storage
│   └── theme/
│       └── app_theme.dart       # Theme configuration
├── features/
│   ├── auth/
│   │   ├── data/repositories/   # Auth repository
│   │   ├── domain/entities/     # User entity
│   │   └── presentation/
│   │       ├── bloc/           # Auth state management
│   │       └── screens/        # Auth screens
│   ├── cars/
│   │   ├── data/repositories/   # Car repository
│   │   ├── domain/entities/     # Car entity
│   │   └── presentation/
│   │       ├── bloc/           # Car state management
│   │       ├── screens/        # Car screens
│   │       └── widgets/        # Car widgets
│   ├── booking/
│   │   ├── data/repositories/   # Booking repository
│   │   ├── domain/entities/   # Booking entities
│   │   └── presentation/
│   │       ├── bloc/           # Booking state management
│   │       └── screens/        # Booking screens
│   └── home/
│       └── presentation/
│           └── screens/        # Home screens
└── shared/
    └── models/                 # Shared data models
```

### Mock Data
The app currently uses mock JSON data for:
- **5 Demo Users** - Pre-configured user accounts
- **Car Inventory** - Sample car data with details
- **Booking Data** - Mock booking information

### API Integration Ready
- **Dio HTTP Client** - Configured for API calls
- **Repository Pattern** - Easy to switch from mock to real API
- **Error Handling** - Comprehensive error management

## 🧪 Testing

### Widget Tests
- **CarCard Widget Tests** - Comprehensive widget testing
- **User Interaction Tests** - Tap and gesture testing
- **UI State Tests** - Loading and error state testing

```

## 📱 Screenshots

### Authentication Flow
- Splash Screen with app branding
- Onboarding with feature highlights
- Login with Username Password 

### Main App Flow
- Home screen with featured cars
- Car list 
- Detailed car information
- Booking form with date/time selection
- Booking confirmation screen


