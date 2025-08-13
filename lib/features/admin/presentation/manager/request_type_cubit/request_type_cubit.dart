import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_model.dart';
import 'package:ticket_flow/features/admin/data/repo/request_type_repo/request_type_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/request_type_repo/request_type_repo_impl.dart';
import 'package:ticket_flow/features/admin/presentation/manager/mixins/filterable_mixin.dart';

part 'request_type_state.dart';

class RequestTypeCubit extends Cubit<RequestTypeState>
    with FilterableMixin<RequestTypeModel> {
  RequestTypeCubit() : super(RequestTypeInitial());
  final RequestTypeRepo adminRepo = RequestTypeRepoImpl(
    api: getIt.get<DioConsumer>(),
  );
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
      (requestTypes) {
        allTypes = requestTypes;
        allItems = requestTypes;
        emit(RequestTypeLoaded(requestTypes: requestTypes));
      },
    );
  }

  List<RequestTypeModel> allTypes = [];

  @override
  bool filterItem(RequestTypeModel requestType, String filter) {
    // RequestTypeModel doesn't have status field, so show all items
    return true;
  }

  @override
  bool searchItem(RequestTypeModel requestType, String query) {
    final name = requestType.requestType?.toLowerCase() ?? '';
    final queryLower = query.toLowerCase();
    return name.contains(queryLower);
  }

  @override
  void emitFilteredState(List<RequestTypeModel> filteredItems) {
    emit(RequestTypeLoaded(requestTypes: filteredItems));
  }

  void searchRequestType(String query) {
    searchItems(query);
  }

  void filterRequestTypes(String filter) {
    filterItems(filter);
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

  Future<void> editRequestType({required RequestTypeModel requestType}) async {
    emit(RequestTypeEditing());
    final result = await adminRepo.editRequestType(
      requestType.newReqId.toString(),
      requestType: requestTypeControllerEdit.text.isEmpty
          ? requestType.requestType.toString()
          : requestTypeControllerEdit.text,
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
