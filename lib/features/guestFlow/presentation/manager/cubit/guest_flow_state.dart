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
