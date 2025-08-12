import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/data/repo/department_repo/department_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/department_repo/department_repo_impl.dart';
import 'package:ticket_flow/features/admin/presentation/manager/mixins/filterable_mixin.dart';

part 'department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState>
    with FilterableMixin<DepartmentModel> {
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
      (r) {
        allItems = r;
        emit(DepartmentFetchSuccess(departments: r));
      },
    );
  }

  @override
  bool filterItem(DepartmentModel department, String filter) {
    switch (filter) {
      case 'active':
        return department.status == 'T';
      case 'inactive':
        return department.status == 'F';
      default:
        return true;
    }
  }

  @override
  bool searchItem(DepartmentModel department, String query) {
    final name = department.name?.toLowerCase() ?? '';
    final queryLower = query.toLowerCase();
    return name.contains(queryLower);
  }

  @override
  void emitFilteredState(List<DepartmentModel> filteredItems) {
    emit(DepartmentFetchSuccess(departments: filteredItems));
  }

  void searchDepartments(String query) {
    searchItems(query);
  }

  void filterDepartments(String filter) {
    filterItems(filter);
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

  Future<void> editDepartment({required DepartmentModel department}) async {
    emit(DepartmentEditing());
    final result = await departmentRepo.editDepartment(
      department.id.toString(),
      name: nameEditedController.text.isEmpty
          ? department.name.toString()
          : nameEditedController.text,
      status: selectedEditedStatus ?? department.status.toString(),
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
