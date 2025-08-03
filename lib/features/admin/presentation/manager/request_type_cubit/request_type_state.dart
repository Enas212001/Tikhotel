part of 'request_type_cubit.dart';

sealed class RequestTypeState extends Equatable {
  const RequestTypeState();

  @override
  List<Object> get props => [];
}

final class RequestTypeInitial extends RequestTypeState {}

final class RequestTypeLoading extends RequestTypeState {}

final class RequestTypeLoaded extends RequestTypeState {
  final List<RequestTypeModel> requestTypes;
  const RequestTypeLoaded({required this.requestTypes});

  @override
  List<Object> get props => [requestTypes];
}

final class RequestTypeFailure extends RequestTypeState {
  final String error;
  const RequestTypeFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class RequestTypeAdded extends RequestTypeState {
  final RequestTypeModel requestType;
  const RequestTypeAdded({required this.requestType});
}

final class RequestTypeAdding extends RequestTypeState {}

final class RequestTypeAddFailure extends RequestTypeState {
  final String error;
  const RequestTypeAddFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class RequestTypeEdited extends RequestTypeState {
  final RequestTypeModel requestType;
  const RequestTypeEdited({required this.requestType});
}

final class RequestTypeEditing extends RequestTypeState {}

final class RequestTypeEditFailure extends RequestTypeState {
  final String error;
  const RequestTypeEditFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class RequestTypeDeleted extends RequestTypeState {
  final String message;
  const RequestTypeDeleted({required this.message});
}

final class RequestTypeDeleting extends RequestTypeState {}

final class RequestTypeDeleteFailure extends RequestTypeState {
  final String error;
  const RequestTypeDeleteFailure({required this.error});

  @override
  List<Object> get props => [error];
}
