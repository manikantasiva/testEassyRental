import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/entities/user_entity.dart';
import '../../../../core/navigation/navigation_repository.dart';
import '../../../navigation/presentation/bloc/navigation_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final NavigationRepository _navigationRepository;

  AuthCubit({
    required AuthRepository authRepository,
    required NavigationRepository navigationRepository,
  }) : _authRepository = authRepository,
       _navigationRepository = navigationRepository,
       super(AuthInitial());

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    final currentState = state;
    final isPasswordVisible =
        currentState is AuthInitial
            ? currentState.isPasswordVisible
            : currentState is AuthLoading
            ? currentState.isPasswordVisible
            : currentState is AuthSuccess
            ? currentState.isPasswordVisible
            : currentState is AuthError
            ? currentState.isPasswordVisible
            : false;

    emit(AuthLoading(isPasswordVisible: isPasswordVisible));
    try {
      final user = await _authRepository.login(email, password);
      emit(AuthSuccess(user, isPasswordVisible: isPasswordVisible));
      if (context.mounted) {
        _navigationRepository.navigateToHome(context);
      }
    } catch (e) {
      emit(AuthError(e.toString(), isPasswordVisible: isPasswordVisible));
    }
  }

  Future<void> checkAuthStatus() async {
    final currentState = state;
    final isPasswordVisible =
        currentState is AuthInitial
            ? currentState.isPasswordVisible
            : currentState is AuthLoading
            ? currentState.isPasswordVisible
            : currentState is AuthSuccess
            ? currentState.isPasswordVisible
            : currentState is AuthError
            ? currentState.isPasswordVisible
            : false;

    emit(AuthLoading(isPasswordVisible: isPasswordVisible));
    try {
      final user = await _authRepository.getCurrentUser();
      if (user != null) {
        emit(AuthSuccess(user, isPasswordVisible: isPasswordVisible));
      } else {
        emit(AuthInitial(isPasswordVisible: isPasswordVisible));
      }
    } catch (e) {
      emit(AuthError(e.toString(), isPasswordVisible: isPasswordVisible));
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await _authRepository.logout();
      emit(AuthInitial());
      if (context.mounted) {
        context.read<NavigationCubit>().selectTab(0);
        _navigationRepository.navigateToLogin(context);
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void togglePasswordVisibility() {
    final currentState = state;
    final isPasswordVisible =
        currentState is AuthInitial
            ? currentState.isPasswordVisible
            : currentState is AuthLoading
            ? currentState.isPasswordVisible
            : currentState is AuthSuccess
            ? currentState.isPasswordVisible
            : currentState is AuthError
            ? currentState.isPasswordVisible
            : false;

    if (currentState is AuthInitial) {
      emit(AuthInitial(isPasswordVisible: !isPasswordVisible));
    } else if (currentState is AuthLoading) {
      emit(AuthLoading(isPasswordVisible: !isPasswordVisible));
    } else if (currentState is AuthSuccess) {
      emit(
        AuthSuccess(currentState.user, isPasswordVisible: !isPasswordVisible),
      );
    } else if (currentState is AuthError) {
      emit(
        AuthError(currentState.message, isPasswordVisible: !isPasswordVisible),
      );
    }
  }

  void clearError() {
    if (state is AuthError) {
      final currentState = state as AuthError;
      emit(AuthInitial(isPasswordVisible: currentState.isPasswordVisible));
    }
  }
}
