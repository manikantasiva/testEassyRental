import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/navigation/presentation/screens/main_navigation_screen.dart';
import '../../features/cars/presentation/screens/cars_list_screen.dart';
import '../../features/cars/presentation/screens/car_details_screen.dart';
import '../../features/booking/presentation/screens/booking_form_screen.dart';
import '../../features/booking/presentation/screens/booking_confirmation_screen.dart';
import '../../features/booking/domain/entities/booking_entity.dart';
import '../constants/app_constants.dart';

class AppRouter {
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: AppConstants.splashRoute,
      routes: [
        GoRoute(
          path: AppConstants.splashRoute,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppConstants.onboardingRoute,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: AppConstants.loginRoute,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: AppConstants.homeRoute,
          builder: (context, state) => const MainNavigationScreen(),
        ),
        GoRoute(
          path: AppConstants.carsListRoute,
          builder: (context, state) => const CarsListScreen(),
        ),
        GoRoute(
          path: AppConstants.carDetailsRoute,
          builder: (context, state) {
            final carId = state.pathParameters['carId']!;
            return CarDetailsScreen(carId: carId);
          },
        ),
        GoRoute(
          path: AppConstants.bookingFormRoute,
          builder: (context, state) {
            final carId = state.pathParameters['carId']!;
            final carName = state.pathParameters['carName']!;
            return BookingFormScreen(carId: carId, carName: carName);
          },
        ),
        GoRoute(
          path: AppConstants.bookingConfirmationRoute,
          builder: (context, state) {
            final bookingId = state.pathParameters['bookingId']!;

            final booking = BookingEntity(
              id: bookingId,
              carId: 'car1',
              carName: 'Ferrari FF',
              customerName: 'John Doe',
              fromDate: DateTime.now(),
              toDate: DateTime.now().add(const Duration(days: 1)),
              fromTime: '09:00',
              toTime: '18:00',
              location: 'New York',
              totalPrice: 200.0,
              status: 'confirmed',
              createdAt: DateTime.now(),
            );
            return BookingConfirmationScreen(booking: booking);
          },
        ),
      ],
    );
  }
}
