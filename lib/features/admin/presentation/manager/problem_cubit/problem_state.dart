part of 'problem_cubit.dart';

sealed class ProblemState extends Equatable {
  const ProblemState();

  @override
  List<Object> get props => [];
}

final class ProblemInitial extends ProblemState {}

final class ProblemFetching extends ProblemState {}

final class ProblemFetched extends ProblemState {
  final ProblemModel problems;
  const ProblemFetched({required this.problems});
  @override
  List<Object> get props => [problems];
}

final class ProblemFetchingError extends ProblemState {
  final String error;
  const ProblemFetchingError({required this.error});
  @override
  List<Object> get props => [error];
}

final class AllProblemFetching extends ProblemState {}

final class AllProblemFetched extends ProblemState {
  final ProblemModel problems;
  const AllProblemFetched({required this.problems});
  @override
  List<Object> get props => [problems];
}

final class AllProblemFetchingError extends ProblemState {
  final String error;
  const AllProblemFetchingError({required this.error});
  @override
  List<Object> get props => [error];
}

final class ProblemAdding extends ProblemState {}

final class ProblemAdded extends ProblemState {
  final ProblemItem problem;
  const ProblemAdded({required this.problem});
  @override
  List<Object> get props => [problem];
}

final class ProblemAddingError extends ProblemState {
  final String error;
  const ProblemAddingError({required this.error});
  @override
  List<Object> get props => [error];
}

final class ProblemEditing extends ProblemState {}

final class ProblemEdited extends ProblemState {
  final ProblemItem problem;
  const ProblemEdited({required this.problem});
  @override
  List<Object> get props => [problem];
}

final class ProblemEditingError extends ProblemState {
  final String error;
  const ProblemEditingError({required this.error});
  @override
  List<Object> get props => [error];
}

final class ProblemDeleting extends ProblemState {}

final class ProblemDeleted extends ProblemState {
  final String message;
  const ProblemDeleted({required this.message});
  @override
  List<Object> get props => [message];
}

final class ProblemDeletingError extends ProblemState {
  final String error;
  const ProblemDeletingError({required this.error});
  @override
  List<Object> get props => [error];
}
