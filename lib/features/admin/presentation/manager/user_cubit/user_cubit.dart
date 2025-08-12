import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/data/models/role_model/role_model.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user_model.dart';
import 'package:ticket_flow/features/admin/data/repo/user_repo/user_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/user_repo/user_repo_impl.dart';
import 'package:ticket_flow/features/admin/presentation/manager/mixins/filterable_mixin.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> with FilterableMixin<UserModel> {
  UserCubit() : super(UserInitial());
  final UserRepo repo = UserRepoImpl(api: getIt<DioConsumer>());
  Future<void> getUsers() async {
    emit(GetUsersLoading());
    final result = await repo.getUsers();
    result.fold(
      (failure) {
        emit(GetUsersFailure(message: failure.failure.errorMessage));
      },
      (users) {
        allItems = users;
        emit(GetUsersSuccess(users: users));
      },
    );
  }

  @override
  bool filterItem(UserModel user, String filter) {
    switch (filter) {
      case 'active':
        return user.isActive == 'active' ||
            user.isActive == '1' ||
            user.isActive == 'true';
      case 'inactive':
        return user.isActive == 'inactive' ||
            user.isActive == '0' ||
            user.isActive == 'false';
      default:
        return true;
    }
  }

  @override
  bool searchItem(UserModel user, String query) {
    final name = user.name?.toLowerCase() ?? '';
    final email = user.email?.toLowerCase() ?? '';
    final role = user.role?.toLowerCase() ?? '';
    final queryLower = query.toLowerCase();

    return name.contains(queryLower) ||
        email.contains(queryLower) ||
        role.contains(queryLower);
  }

  @override
  void emitFilteredState(List<UserModel> filteredItems) {
    emit(GetUsersSuccess(users: filteredItems));
  }

  void searchUsers(String query) {
    searchItems(query);
  }

  void filterUsers(String filter) {
    filterItems(filter);
  }

  final GlobalKey<FormState> formAddUserKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailControllerEdit = TextEditingController();
  final TextEditingController passwordControllerEdit = TextEditingController();
  final TextEditingController firstNameControllerEdit = TextEditingController();
  // Add these variables
  DepartmentModel? selectedDepartment;
  String? selectedStatus;
  String? selectedOperational;
  RoleModel? selectedRole;
  DepartmentModel? selectedDepartmentEdit;
  String? selectedStatusEdit;
  RoleModel? selectedRoleEdit;

  // Add methods to update them
  void setRole(RoleModel? value) {
    selectedRole = value;
  }

  void setRoleEdit(RoleModel? value) {
    selectedRoleEdit = value;
  }

  void setOperational(String? value) {
    selectedOperational = value;
  }

  Future<void> addUser() async {
    emit(AddUserLoading());
    final result = await repo.addUser(
      roleId: selectedRole!.id!,
      email: emailController.text,
      password: passwordController.text,
      firstName: firstNameController.text,
      department: selectedDepartment?.id?.toString() ?? '',
      status: selectedStatus == 'Inactive'
          ? 'F'
          : selectedStatus == 'Active'
          ? 'T'
          : '',
      operational: selectedOperational ?? '',
    );
    result.fold(
      (failure) {
        emit(AddUserFailure(message: failure.failure.errorMessage));
      },
      (user) {
        emit(AddUserSuccess(user: user));
      },
    );
  }

  Future<void> deleteUser(String id) async {
    emit(DeleteUserLoading());
    final result = await repo.deleteUser(id);
    result.fold(
      (failure) {
        emit(DeleteUserFailure(message: failure.failure.errorMessage));
      },
      (message) {
        emit(DeleteUserSuccess(message: message));
      },
    );
  }

  Future<void> editUser({required UserModel user}) async {
    emit(EditUserLoading());
    final result = await repo.editUser(
      user.id.toString(),
      roleId: selectedRoleEdit?.id ?? selectedRole?.id,
      email: emailControllerEdit.text.isEmpty
          ? user.email.toString()
          : emailControllerEdit.text,
      password: passwordControllerEdit.text.isEmpty
          ? user.password.toString()
          : passwordControllerEdit.text,
      firstName: firstNameControllerEdit.text.isEmpty
          ? user.name.toString()
          : firstNameControllerEdit.text,
      department:
          selectedDepartmentEdit?.id.toString() ?? user.departments.toString(),
      status: selectedStatusEdit == 'Inactive'
          ? 'F'
          : selectedStatusEdit == 'Active'
          ? 'T'
          : user.status,
    );
    result.fold(
      (failure) {
        emit(EditUserFailure(message: failure.failure.errorMessage));
      },
      (user) {
        emit(EditUserSuccess(user: user));
      },
    );
  }

  Future<void> getRoles() async {
    emit(RolesLoading());
    final result = await repo.getRoles();
    result.fold(
      (failure) {
        emit(RolesFailure(message: failure.failure.errorMessage));
      },
      (roles) {
        emit(RolesLoaded(roles));
      },
    );
  }
}
