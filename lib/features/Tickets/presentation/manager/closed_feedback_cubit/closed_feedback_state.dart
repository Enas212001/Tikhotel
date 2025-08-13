part of 'closed_feedback_cubit.dart';

sealed class ClosedFeedbackState extends Equatable {
  const ClosedFeedbackState();

  @override
  List<Object> get props => [];
}

final class ClosedFeedbackInitial extends ClosedFeedbackState {}

final class TicketClosedFeedbackLoading extends ClosedFeedbackState {}

final class TicketClosedFeedbackSuccess extends ClosedFeedbackState {
  final TicketModel tickets;

  const TicketClosedFeedbackSuccess({required this.tickets});

  @override
  List<Object> get props => [tickets];
}

final class TicketClosedFeedbackFailure extends ClosedFeedbackState {
  final String message;

  const TicketClosedFeedbackFailure({required this.message});
}
