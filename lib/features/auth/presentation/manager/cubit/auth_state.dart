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

final class LogoutSuccess extends AuthState {
  final bool sucess;

  const LogoutSuccess({required this.sucess});
}

final class LogoutLoading extends AuthState {}

final class LogoutFailure extends AuthState {
  final String message;

  const LogoutFailure({required this.message});
}
