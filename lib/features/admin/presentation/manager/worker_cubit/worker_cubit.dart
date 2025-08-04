import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_item.dart';
import 'package:ticket_flow/features/admin/data/repo/worker_repo/worker_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/worker_repo/worker_repo_impl.dart';

part 'worker_state.dart';

class WorkerCubit extends Cubit<WorkerState> {
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
        emit(FetchWorkerSuccess(workers: workers));
      },
    );
  }

  List<WorkerItem> allWorkers = [];
  void searchWorker(String query) {
    if (state is! FetchWorkerSuccess) return;

    if (query.isEmpty) {
      emit(FetchWorkerSuccess(workers: allWorkers));
      return;
    }

    final filtered = allWorkers.where((worker) {
      final name = worker.fname?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();

    emit(FetchWorkerSuccess(workers: filtered));
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
      status: selectedStatus ?? 'T',
      department: selectedDepartment?.id.toString() ?? '1',
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

  Future<void> editWorker({required String id}) async {
    emit(EditWorkerLoading());
    final response = await workerRepo.updateWorker(
      id,
      name: nameEditController.text.isEmpty
          ? nameController.text
          : nameEditController.text,
      phone: phoneEditController.text.isEmpty
          ? phoneController.text
          : phoneEditController.text,
      status: selectedEditedStatus ?? selectedStatus ?? 'T',
      department:
          selectedEditedDepartment?.id.toString() ??
          selectedDepartment?.id.toString() ??
          '1',
      statusWhatsapp: allowWhatsappEdit ? 1 : 0,
    );
    response.fold(
      (failure) =>
          emit(EditWorkerFailure(message: failure.failure.errorMessage)),
      (worker) => emit(EditWorkerSuccess(worker: worker)),
    );
  }
}
