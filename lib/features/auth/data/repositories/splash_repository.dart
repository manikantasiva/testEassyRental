import 'package:flutter/material.dart';
import '../../../../core/navigation/navigation_repository.dart';
import 'auth_repository.dart';

abstract class SplashRepository {
  Future<void> checkAuthAndNavigate(BuildContext context);
}

class SplashRepositoryImpl implements SplashRepository {
  final AuthRepository _authRepository;
  final NavigationRepository _navigationRepository;

  SplashRepositoryImpl({
    required AuthRepository authRepository,
    required NavigationRepository navigationRepository,
  }) : _authRepository = authRepository,
       _navigationRepository = navigationRepository;

  @override
  Future<void> checkAuthAndNavigate(BuildContext context) async {
    try {
      final user = await _authRepository.getCurrentUser();
      if (user != null) {
        if (context.mounted) {
          _navigationRepository.navigateToHome(context);
        }
      } else {
        await Future.delayed(const Duration(seconds: 2));
        if (context.mounted) {
          _navigationRepository.navigateToOnboarding(context);
        }
      }
    } catch (e) {
      await Future.delayed(const Duration(seconds: 2));
      if (context.mounted) {
        _navigationRepository.navigateToOnboarding(context);
      }
    }
  }
}
