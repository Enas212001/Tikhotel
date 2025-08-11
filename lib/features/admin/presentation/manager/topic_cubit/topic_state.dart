part of 'topic_cubit.dart';

sealed class TopicState extends Equatable {
  const TopicState();

  @override
  List<Object> get props => [];
}

final class TopicInitial extends TopicState {}

final class TopicFetching extends TopicState {}

final class TopicFetched extends TopicState {
  final TopicModel topics;
  const TopicFetched({required this.topics});
  @override
  List<Object> get props => [topics];
}

final class TopicFetchingError extends TopicState {
  final String error;
  const TopicFetchingError({required this.error});
  @override
  List<Object> get props => [error];
}

final class TopicAdding extends TopicState {}

final class TopicAdded extends TopicState {
  final TopicItem topic;
  const TopicAdded({required this.topic});
  @override
  List<Object> get props => [topic];
}

final class TopicAddingError extends TopicState {
  final String error;
  const TopicAddingError({required this.error});
  @override
  List<Object> get props => [error];
}

final class TopicEditing extends TopicState {}

final class TopicEdited extends TopicState {
  final TopicItem topic;
  const TopicEdited({required this.topic});
  @override
  List<Object> get props => [topic];
}

final class TopicEditingError extends TopicState {
  final String error;
  const TopicEditingError({required this.error});
  @override
  List<Object> get props => [error];
}

final class TopicDeleting extends TopicState {}

final class TopicDeleted extends TopicState {
  final String message;
  const TopicDeleted({required this.message});
  @override
  List<Object> get props => [message];
}

final class TopicDeletingError extends TopicState {
  final String error;
  const TopicDeletingError({required this.error});
  @override
  List<Object> get props => [error];
}
