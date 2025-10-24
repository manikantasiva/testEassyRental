part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  final bool isPasswordVisible;

  const AuthInitial({this.isPasswordVisible = false});

  @override
  List<Object> get props => [isPasswordVisible];
}

class AuthLoading extends AuthState {
  final bool isPasswordVisible;

  const AuthLoading({this.isPasswordVisible = false});

  @override
  List<Object> get props => [isPasswordVisible];
}

class AuthSuccess extends AuthState {
  final UserEntity user;
  final bool isPasswordVisible;

  const AuthSuccess(this.user, {this.isPasswordVisible = false});

  @override
  List<Object> get props => [user, isPasswordVisible];
}

class AuthError extends AuthState {
  final String message;
  final bool isPasswordVisible;

  const AuthError(this.message, {this.isPasswordVisible = false});

  @override
  List<Object> get props => [message, isPasswordVisible];
}
