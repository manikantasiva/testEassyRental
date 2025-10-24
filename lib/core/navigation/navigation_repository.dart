import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_constants.dart';

abstract class NavigationRepository {
  void navigateToOnboarding(BuildContext context);
  void navigateToLogin(BuildContext context);
  void navigateToHome(BuildContext context);
}

class NavigationRepositoryImpl implements NavigationRepository {
  NavigationRepositoryImpl();

  @override
  void navigateToOnboarding(BuildContext context) {
    context.go(AppConstants.onboardingRoute);
  }

  @override
  void navigateToLogin(BuildContext context) {
    context.go(AppConstants.loginRoute);
  }

  @override
  void navigateToHome(BuildContext context) {
    context.go(AppConstants.homeRoute);
  }
}
