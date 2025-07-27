import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_model.dart';
import 'package:ticket_flow/features/admin/data/repo/admin_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/admin_repo_impl.dart';

part 'request_type_state.dart';

class RequestTypeCubit extends Cubit<RequestTypeState> {
  RequestTypeCubit() : super(RequestTypeInitial());
  final AdminRepo adminRepo = AdminRepoImpl(api: getIt.get<DioConsumer>());
  final TextEditingController requestTypeControllerEdit =
      TextEditingController();
  final TextEditingController requestTypeControllerAdd =
      TextEditingController();
  final GlobalKey<FormState> formAddRequestTypeKey = GlobalKey<FormState>();

  Future<void> getRequestTypes() async {
    emit(RequestTypeLoading());
    final result = await adminRepo.getRequestTypes();
    result.fold(
      (failure) =>
          emit(RequestTypeFailure(error: failure.failure.errorMessage)),
      (requestTypes) => emit(RequestTypeLoaded(requestTypes: requestTypes)),
    );
  }

  Future<void> addRequestType() async {
    emit(RequestTypeAdding());
    final result = await adminRepo.addRequestType(
      requestType: requestTypeControllerAdd.text,
    );
    result.fold(
      (failure) =>
          emit(RequestTypeAddFailure(error: failure.failure.errorMessage)),
      (requestType) => emit(RequestTypeAdded(requestType: requestType)),
    );
  }

  Future<void> editRequestType(String id) async {
    emit(RequestTypeEditing());
    final result = await adminRepo.editRequestType(
      id,
      requestType: requestTypeControllerEdit.text,
    );
    result.fold(
      (failure) =>
          emit(RequestTypeEditFailure(error: failure.failure.errorMessage)),
      (requestType) => emit(RequestTypeEdited(requestType: requestType)),
    );
  }

  Future<void> deleteRequestType(String id) async {
    emit(RequestTypeDeleting());
    final result = await adminRepo.deleteRequestType(id);
    result.fold(
      (failure) =>
          emit(RequestTypeDeleteFailure(error: failure.failure.errorMessage)),
      (message) => emit(RequestTypeDeleted(message: message)),
    );
  }
}
