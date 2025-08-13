part of 'feedback_cubit.dart';

sealed class FeedbackState extends Equatable {
  const FeedbackState();

  @override
  List<Object> get props => [];
}

final class FeedbackInitial extends FeedbackState {}

final class TicketFeedbackLoading extends FeedbackState {}

final class TicketFeedbackSuccess extends FeedbackState {
  final TicketModel tickets;

  const TicketFeedbackSuccess({required this.tickets});

  @override
  List<Object> get props => [tickets];
}

final class TicketFeedbackFailure extends FeedbackState {
  final String message;

  const TicketFeedbackFailure({required this.message});
}
