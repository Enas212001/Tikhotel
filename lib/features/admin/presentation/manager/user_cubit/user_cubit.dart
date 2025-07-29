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

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
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
        emit(GetUsersSuccess(users: users));
      },
    );
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
      status: selectedStatus ?? '',
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

  Future<void> editUser(String id) async {
    emit(EditUserLoading());
    final result = await repo.editUser(
      id,
      roleId: selectedRoleEdit?.id ?? selectedRole?.id,
      email: emailControllerEdit.text.isEmpty ? null : emailControllerEdit.text,
      password: passwordControllerEdit.text.isEmpty
          ? null
          : passwordControllerEdit.text,
      firstName: firstNameControllerEdit.text.isEmpty
          ? null
          : firstNameControllerEdit.text,
      department:
          selectedDepartmentEdit?.id.toString() ??
          selectedDepartment?.id.toString(),
      status: selectedStatusEdit ?? selectedStatus,
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
