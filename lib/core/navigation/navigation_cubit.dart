import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  void navigateToSplash() {
    emit(NavigationSplash());
  }

  void navigateToOnboarding() {
    emit(NavigationOnboarding());
  }

  void navigateToLogin() {
    emit(NavigationLogin());
  }

  void navigateToOtp(String phoneNumber) {
    emit(NavigationOtp(phoneNumber));
  }

  void navigateToHome() {
    emit(NavigationHome());
  }

  void navigateBack() {
    if (state is NavigationOtp) {
      emit(NavigationLogin());
    } else if (state is NavigationLogin) {
      emit(NavigationOnboarding());
    } else if (state is NavigationOnboarding) {
      emit(NavigationSplash());
    }
  }
}
