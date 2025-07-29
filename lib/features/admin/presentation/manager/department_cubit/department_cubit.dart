import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/data/repo/department_repo/department_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/department_repo/department_repo_impl.dart';

part 'department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit() : super(DepartmentInitial());
  final DepartmentRepo departmentRepo = DepartmentRepoImpl(
    api: getIt.get<DioConsumer>(),
  );

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nameEditedController = TextEditingController();
  String? selectedStatus;
  String? selectedEditedStatus;
  Future<void> fetchDepartments() async {
    emit(DepartmentFetchLoading());
    final result = await departmentRepo.getDepartments();
    result.fold(
      (l) => emit(DepartmentFetchFailure(message: l.failure.errorMessage)),
      (r) => emit(DepartmentFetchSuccess(departments: r)),
    );
  }

  Future<void> addDepartment() async {
    emit(DepartmentAdding());
    final result = await departmentRepo.addDepartment(
      name: nameController.text,
      status: selectedStatus ?? 'T',
    );
    result.fold(
      (l) => emit(DepartmentAddFailure(message: l.failure.errorMessage)),
      (r) => emit(DepartmentAdded(department: r)),
    );
  }

  Future<void> editDepartment({required String id}) async {
    emit(DepartmentEditing());
    final result = await departmentRepo.editDepartment(
      id,
      name: nameEditedController.text.isEmpty
          ? nameController.text
          : nameEditedController.text,
      status: selectedEditedStatus ?? selectedStatus ?? 'T',
    );
    result.fold(
      (l) => emit(DepartmentEditFailure(message: l.failure.errorMessage)),
      (r) => emit(DepartmentEdited(department: r)),
    );
  }

  Future<void> deleteDepartment({required String id}) async {
    emit(DepartmentDeleting());
    final result = await departmentRepo.deleteDepartment(id);
    result.fold(
      (l) => emit(DepartmentDeleteFailure(message: l.failure.errorMessage)),
      (r) => emit(DepartmentDeleted(message: r)),
    );
  }
}
