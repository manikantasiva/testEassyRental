class AppConstants {
  //  ####=>API Configuration
  static const String baseUrl = 'https://api.example.com';
  static const String apiVersion = '/v1';

  //  ####=>Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userEmailKey = 'user_email';
  static const String userNameKey = 'user_name';
  static const String isLoggedInKey = 'is_logged_in';

  //  ####=>Route Names
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String carsListRoute = '/cars-list';
  static const String carDetailsRoute = '/car-details/:carId';
  static const String bookingFormRoute = '/booking-form/:carId/:carName';
  static const String bookingConfirmationRoute =
      '/booking-confirmation/:bookingId';
  //  ####=>API Endpoints
  static const String sendOtpEndpoint = '/auth/send-otp';

  //  ####=>App Configuration
  static const String appName = 'TestEasyRental';
}
