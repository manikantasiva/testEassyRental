part of 'navigation_cubit.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object?> get props => [];
}

class NavigationInitial extends NavigationState {}

class NavigationSplash extends NavigationState {}

class NavigationOnboarding extends NavigationState {}

class NavigationLogin extends NavigationState {}

class NavigationOtp extends NavigationState {
  final String phoneNumber;

  const NavigationOtp(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class NavigationHome extends NavigationState {}
