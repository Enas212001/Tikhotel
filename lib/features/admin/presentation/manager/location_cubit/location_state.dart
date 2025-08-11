part of 'location_cubit.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

final class LocationsLoading extends LocationState {}

final class LocationsLoaded extends LocationState {
  final LocationModel locations;
  const LocationsLoaded({required this.locations});

  @override
  List<Object> get props => [locations];
}

final class LocationsLoadingError extends LocationState {
  final String message;
  const LocationsLoadingError({required this.message});
}

final class AddLocationLoading extends LocationState {}

final class AddLocationSuccess extends LocationState {
  final LocationItem location;
  const AddLocationSuccess({required this.location});
}

final class AddLocationFailed extends LocationState {
  final String message;
  const AddLocationFailed({required this.message});
}

final class EditLocationFailed extends LocationState {
  final String message;
  const EditLocationFailed({required this.message});
}

final class EditLocationSuccess extends LocationState {
  final LocationItem location;
  const EditLocationSuccess({required this.location});
}

final class EditLocationLoading extends LocationState {}

final class DeleteLocationLoading extends LocationState {}

final class DeleteLocationFailure extends LocationState {
  final String message;
  const DeleteLocationFailure({required this.message});
}

final class DeleteLocationSuccess extends LocationState {
  final String message;
  const DeleteLocationSuccess({required this.message});
}
