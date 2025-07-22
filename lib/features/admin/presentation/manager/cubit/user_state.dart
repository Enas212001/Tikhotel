part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class GetUsersLoading extends UserState {}

final class RoleSelected extends UserState {
  final String role;
  const RoleSelected({required this.role});
}

class RolesState extends UserState {
  final List<RoleModel> roles;
  final String? selectedRole;
  final bool loading;
  final String? error;

  const RolesState({
    required this.roles,
    this.selectedRole,
    this.loading = false,
    this.error,
  });

  RolesState copyWith({
    List<RoleModel>? roles,
    String? selectedRole,
    bool? loading,
    String? error,
  }) {
    return RolesState(
      roles: roles ?? this.roles,
      selectedRole: selectedRole ?? this.selectedRole,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}

class RolesLoading extends UserState {}

class RolesLoaded extends UserState {
  final List<RoleModel> roles;
  const RolesLoaded(this.roles);
}

class RolesFailure extends UserState {
  final String message;
  const RolesFailure(this.message);
}

final class StatusSelected extends UserState {
  final String status;
  const StatusSelected({required this.status});
}

final class DepartmentSelected extends UserState {
  final String department;
  const DepartmentSelected({required this.department});
}

final class OperationalSelected extends UserState {
  final String operational;
  const OperationalSelected({required this.operational});
}

final class GetUsersSuccess extends UserState {
  final List<UserModel> users;
  const GetUsersSuccess({required this.users});
}

final class GetUsersFailure extends UserState {
  final String message;
  const GetUsersFailure({required this.message});
}

final class AddUserLoading extends UserState {}

final class AddUserSuccess extends UserState {
  final UserModel user;
  const AddUserSuccess({required this.user});
}

final class AddUserFailure extends UserState {
  final String message;
  const AddUserFailure({required this.message});
}

final class EditUserLoading extends UserState {}

final class EditUserSuccess extends UserState {
  final User user;
  const EditUserSuccess({required this.user});
}

final class EditUserFailure extends UserState {
  final String message;
  const EditUserFailure({required this.message});
}

final class DeleteUserLoading extends UserState {}

final class DeleteUserSuccess extends UserState {
  final String message;
  const DeleteUserSuccess({required this.message});
}

final class DeleteUserFailure extends UserState {
  final String message;
  const DeleteUserFailure({required this.message});
}
