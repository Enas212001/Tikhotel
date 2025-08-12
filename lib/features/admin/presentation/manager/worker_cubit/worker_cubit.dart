import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_item.dart';
import 'package:ticket_flow/features/admin/data/repo/worker_repo/worker_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/worker_repo/worker_repo_impl.dart';
import 'package:ticket_flow/features/admin/presentation/manager/mixins/filterable_mixin.dart';

part 'worker_state.dart';

class WorkerCubit extends Cubit<WorkerState> with FilterableMixin<WorkerItem> {
  WorkerCubit() : super(WorkerInitial());
  final WorkerRepo workerRepo = WorkerRepoImpl(api: getIt.get<DioConsumer>());
  Future<void> getWorkers() async {
    emit(FetchWorkerLoading());
    final response = await workerRepo.getWorkers();
    response.fold(
      (failure) =>
          emit(FetchWorkerFailure(message: failure.failure.errorMessage)),
      (workers) {
        allWorkers = workers;
        allItems = workers;
        emit(FetchWorkerSuccess(workers: workers));
      },
    );
  }

  List<WorkerItem> allWorkers = [];

  @override
  bool filterItem(WorkerItem worker, String filter) {
    switch (filter) {
      case 'active':
        return worker.status == 'T';
      case 'inactive':
        return worker.status == 'F';
      default:
        return true;
    }
  }

  @override
  bool searchItem(WorkerItem worker, String query) {
    final name = worker.fname?.toLowerCase() ?? '';
    final lname = worker.lname?.toLowerCase() ?? '';
    final queryLower = query.toLowerCase();
    return name.contains(queryLower) || lname.contains(queryLower);
  }

  @override
  void emitFilteredState(List<WorkerItem> filteredItems) {
    emit(FetchWorkerSuccess(workers: filteredItems));
  }

  void searchWorker(String query) {
    searchItems(query);
  }

  void filterWorkers(String filter) {
    filterItems(filter);
  }

  Future<void> deleteWorker({required String id}) async {
    emit(DeleteWorkerLoading());
    final response = await workerRepo.deleteWorker(id);
    response.fold(
      (failure) =>
          emit(DeleteWorkerFailure(message: failure.failure.errorMessage)),
      (message) => emit(DeleteWorkerSuccess(message: message)),
    );
  }

  bool allowWhatsapp = false; // ✅ use bool instead of String
  bool allowWhatsappEdit = false;
  void toggleWhatsapp(bool value) {
    allowWhatsapp = value;
    emit(WorkerWhatsappToggled(allowWhatsapp)); // emit a state to rebuild UI
  }

  void toggleWhatsappEdit(bool value) {
    allowWhatsappEdit = value;
    emit(
      WorkerWhatsappToggled(allowWhatsappEdit),
    ); // emit a state to rebuild UI
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedStatus;
  String? selectedEditedStatus;
  DepartmentModel? selectedDepartment;

  Future<void> addWorker() async {
    emit(AddWorkerLoading());
    final response = await workerRepo.addWorker(
      name: nameController.text,
      phone: phoneController.text,
      status: selectedStatus ?? '',
      department: selectedDepartment?.id.toString() ?? '',
      statusWhatsapp: allowWhatsapp ? 1 : 0,
    );
    response.fold(
      (failure) =>
          emit(AddWorkerFailure(message: failure.failure.errorMessage)),
      (worker) => emit(AddWorkerSuccess(worker: worker)),
    );
  }

  final TextEditingController phoneEditController = TextEditingController();
  final TextEditingController nameEditController = TextEditingController();
  DepartmentModel? selectedEditedDepartment;

  Future<void> editWorker({required WorkerItem worker}) async {
    emit(EditWorkerLoading());
    final response = await workerRepo.updateWorker(
      worker.id.toString(),
      name: nameEditController.text.isEmpty
          ? worker.fname.toString()
          : nameEditController.text,
      phone: phoneEditController.text.isEmpty
          ? worker.phone.toString()
          : phoneEditController.text,
      status: selectedEditedStatus == 'Inactive'
          ? 'F'
          : selectedEditedStatus == 'Active'
          ? 'T'
          : worker.status.toString(),
      department:
          selectedEditedDepartment?.id.toString() ??
          worker.departmentId.toString(),
      statusWhatsapp: allowWhatsappEdit ? 1 : 0,
    );
    response.fold(
      (failure) =>
          emit(EditWorkerFailure(message: failure.failure.errorMessage)),
      (worker) => emit(EditWorkerSuccess(worker: worker)),
    );
  }
}
