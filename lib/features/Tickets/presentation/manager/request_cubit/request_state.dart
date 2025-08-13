part of 'request_cubit.dart';

sealed class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object> get props => [];
}

final class RequestInitial extends RequestState {}

final class RequestLoading extends RequestState {}

final class RequestSuccess extends RequestState {
  final TicketModel tickets;

  const RequestSuccess({required this.tickets});

  @override
  List<Object> get props => [tickets];
}

final class RequestFailure extends RequestState {
  final String message;
  const RequestFailure({required this.message});
}
