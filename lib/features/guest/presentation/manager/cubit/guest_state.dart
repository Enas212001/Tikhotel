part of 'guest_cubit.dart';

sealed class GuestState extends Equatable {
  const GuestState();

  @override
  List<Object> get props => [];
}

final class GuestInitial extends GuestState {}

final class GuestLoading extends GuestState {}

final class GuestSuccess extends GuestState {
  final List<GuestModel> guests;
  const GuestSuccess({required this.guests});
}

final class GuestFailure extends GuestState {
  final String message;
  const GuestFailure({required this.message});
}
