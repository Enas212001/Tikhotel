part of 'guest_flow_cubit.dart';

sealed class GuestFlowState extends Equatable {
  const GuestFlowState();

  @override
  List<Object> get props => [];
}

final class GuestFlowInitial extends GuestFlowState {}

final class UpdateGuestLoading extends GuestFlowState {}

final class UpdateGuestSuccess extends GuestFlowState {
  final GuestModel guest;
  const UpdateGuestSuccess({required this.guest});
}

final class UpdateGuestFailure extends GuestFlowState {
  final String message;

  const UpdateGuestFailure({required this.message});
}

final class GuestLoginLoading extends GuestFlowState {}

final class GuestLoginSuccess extends GuestFlowState {
  final GuestLoginModel gusetLogin;

  const GuestLoginSuccess({required this.gusetLogin});

  @override
  List<Object> get props => [gusetLogin];
}

final class GuestLoginFailure extends GuestFlowState {
  final String message;

  const GuestLoginFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class LogoutSuccessGuest extends GuestFlowState {
  final bool sucess;

  const LogoutSuccessGuest({required this.sucess});
}

final class LogoutLoadingGuest extends GuestFlowState {}

final class LogoutFailureGuest extends GuestFlowState {
  final String message;

  const LogoutFailureGuest({required this.message});
}
