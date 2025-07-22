import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/role_model/role_model.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user_model.dart';
import 'package:ticket_flow/features/admin/data/repo/admin_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/admin_repo_impl.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  final AdminRepo repo = AdminRepoImpl(api: getIt<DioConsumer>());
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
  // Add these variables
  String? selectedRole;
  String? selectedDepartment;
  String? selectedStatus;
  String? selectedOperational;

  // Add methods to update them
  // void setRole(String? value) {
  //   selectedRole = value;
  //   emit(RoleSelected(role: value ?? '')); // emit new state as needed
  // }

 // In UserCubit
  void getRoles() async {
    emit((state as RolesState).copyWith(loading: true));
    final result = await repo.getRoles();
    result.fold(
      (failure) => emit(
        (state as RolesState).copyWith(
          loading: false,
          error: failure.failure.errorMessage,
        ),
      ),
      (roles) => emit(
        (state as RolesState).copyWith(
          roles: roles,
          loading: false,
          error: null,
        ),
      ),
    );
  }

  void setRole(String? value) {
    emit((state as RolesState).copyWith(selectedRole: value));
  }

  void setDepartment(String? value) {
    selectedDepartment = value;
    emit(DepartmentSelected(department: value ?? ''));
  }

  void setStatus(String? value) {
    selectedStatus = value;
    emit(StatusSelected(status: value ?? ''));
  }

  void setOperational(String? value) {
    selectedOperational = value;
    emit(OperationalSelected(operational: value ?? ''));
  }

  Future<void> addUser() async {
    emit(AddUserLoading());
    final result = await repo.addUser(
      role: selectedRole ?? '',
      roleId: '1',
      email: emailController.text,
      password: passwordController.text,
      firstName: firstNameController.text,
      department: selectedDepartment ?? '',
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
}
