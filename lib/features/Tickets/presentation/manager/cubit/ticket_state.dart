part of 'ticket_cubit.dart';

sealed class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object> get props => [];
}

final class TicketInitial extends TicketState {}

final class TicketLoading extends TicketState {}

final class TicketSuccess extends TicketState {
  final List<Datum> tickets;

  const TicketSuccess({required this.tickets});
}

final class TicketFailure extends TicketState {
  final String message;

  const TicketFailure({required this.message});
}

final class TicketFeedbackLoading extends TicketState {}

final class TicketFeedbackSuccess extends TicketState {
  final List<Datum> tickets;

  const TicketFeedbackSuccess({required this.tickets});
}

final class TicketFeedbackFailure extends TicketState {
  final String message;

  const TicketFeedbackFailure({required this.message});
}

final class TicketClosedFeedbackLoading extends TicketState {}

final class TicketClosedFeedbackSuccess extends TicketState {
  final List<Datum> tickets;

  const TicketClosedFeedbackSuccess({required this.tickets});
}

final class TicketClosedFeedbackFailure extends TicketState {
  final String message;

  const TicketClosedFeedbackFailure({required this.message});
}

final class TicketClosedWorkOrderLoading extends TicketState {}

final class RequestLoading extends TicketState {}

final class RequestSuccess extends TicketState {
  final List<Datum> tickets;
  const RequestSuccess({required this.tickets});
}

final class RequestFailure extends TicketState {
  final String message;
  const RequestFailure({required this.message});
}

final class TicketClosedWorkOrderSuccess extends TicketState {
  final List<Datum> tickets;

  const TicketClosedWorkOrderSuccess({required this.tickets});
}

final class TicketClosedWorkOrderFailure extends TicketState {
  final String message;

  const TicketClosedWorkOrderFailure({required this.message});
}
