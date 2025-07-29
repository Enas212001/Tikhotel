part of 'department_cubit.dart';

sealed class DepartmentState extends Equatable {
  const DepartmentState();

  @override
  List<Object> get props => [];
}

final class DepartmentInitial extends DepartmentState {}

final class DepartmentFetchLoading extends DepartmentState {}

final class DepartmentFetchSuccess extends DepartmentState {
  final List<DepartmentModel> departments;
  const DepartmentFetchSuccess({required this.departments});
}

final class DepartmentFetchFailure extends DepartmentState {
  final String message;
  const DepartmentFetchFailure({required this.message});
}

final class DepartmentAdding extends DepartmentState {}

final class DepartmentAdded extends DepartmentState {
  final DepartmentModel department;
  const DepartmentAdded({required this.department});
}

final class DepartmentAddFailure extends DepartmentState {
  final String message;
  const DepartmentAddFailure({required this.message});
}

final class DepartmentDeleting extends DepartmentState {}

final class DepartmentDeleted extends DepartmentState {
  final String message;
  const DepartmentDeleted({required this.message});
}

final class DepartmentDeleteFailure extends DepartmentState {
  final String message;
  const DepartmentDeleteFailure({required this.message});
}

final class DepartmentEditing extends DepartmentState {}

final class DepartmentEdited extends DepartmentState {
  final DepartmentModel department;
  const DepartmentEdited({required this.department});
}

final class DepartmentEditFailure extends DepartmentState {
  final String message;
  const DepartmentEditFailure({required this.message});
}
