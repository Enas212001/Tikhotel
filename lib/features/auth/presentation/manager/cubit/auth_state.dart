part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AdminLoginLoading extends AuthState {}

final class AdminLoginSuccess extends AuthState {
  final LoginModel loginModel;

  const AdminLoginSuccess({required this.loginModel});

  @override
  List<Object> get props => [loginModel];
}

final class AdminLoginFailure extends AuthState {
  final String message;

  const AdminLoginFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class GuestLoginLoading extends AuthState {}

final class GuestLoginSuccess extends AuthState {
  final GuestLogin gusetLogin;

  const GuestLoginSuccess({required this.gusetLogin});

  @override
  List<Object> get props => [gusetLogin];
}

final class GuestLoginFailure extends AuthState {
  final String message;

  const GuestLoginFailure({required this.message});

  @override
  List<Object> get props => [message];
}
