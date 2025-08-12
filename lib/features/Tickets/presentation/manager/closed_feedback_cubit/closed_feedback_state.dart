part of 'closed_feedback_cubit.dart';

sealed class ClosedFeedbackState extends Equatable {
  const ClosedFeedbackState();

  @override
  List<Object> get props => [];
}

final class ClosedFeedbackInitial extends ClosedFeedbackState {}
