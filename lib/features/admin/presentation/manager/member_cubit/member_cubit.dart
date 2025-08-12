import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/member_model/member_model.dart';
import 'package:ticket_flow/features/admin/data/repo/member_repo/member_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/member_repo/member_repo_impl.dart';
import 'package:ticket_flow/features/admin/presentation/manager/mixins/filterable_mixin.dart';

part 'member_state.dart';

class MemberCubit extends Cubit<MemberState> with FilterableMixin<MemberModel> {
  MemberCubit() : super(MemberInitial());

  final MemberRepo repo = MemberRepoImpl(api: getIt.get<DioConsumer>());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailEditController = TextEditingController();
  final TextEditingController nameEditController = TextEditingController();
  String? selectedStatus;
  String? selectedTitle;
  String? selectedEditedTitle;
  String? selectedEditedStatus;
  Future<void> getMembers() async {
    emit(MemberLoading());
    final response = await repo.getMembers();
    response.fold(
      (failure) => emit(MemberError(message: failure.failure.errorMessage)),
      (members) {
        allMembers = members;
        allItems = members;
        emit(MemberLoaded(members: members));
      },
    );
  }

  List<MemberModel> allMembers = [];

  @override
  bool filterItem(MemberModel member, String filter) {
    switch (filter) {
      case 'active':
        return member.status == 'T';
      case 'inactive':
        return member.status == 'F';
      default:
        return true;
    }
  }

  @override
  bool searchItem(MemberModel member, String query) {
    final name =
        '${member.title ?? ''} ${member.name ?? ''} ${member.email ?? ''}'
            .toLowerCase();
    final queryLower = query.toLowerCase();
    return name.contains(queryLower);
  }

  @override
  void emitFilteredState(List<MemberModel> filteredItems) {
    emit(MemberLoaded(members: filteredItems));
  }

  void searchMember(String query) {
    searchItems(query);
  }

  void filterMembers(String filter) {
    filterItems(filter);
  }

  Future<void> deleteMember({required String id}) async {
    emit(MemberDeleting());
    final result = await repo.deleteMember(id);
    result.fold(
      (failure) =>
          emit(MemberDeletingError(error: failure.failure.errorMessage)),
      (message) => emit(MemberDeleted(message: message)),
    );
  }

  Future<void> addMember() async {
    emit(MemberAdding());
    final result = await repo.addMember(
      title: selectedTitle ?? 'MR.',
      name: nameController.text,
      email: emailController.text,
      status: selectedStatus == 'Inactive'
          ? 'F'
          : selectedStatus == 'Active'
          ? 'T'
          : '',
    );
    result.fold(
      (failure) => emit(MemberAddingError(error: failure.failure.errorMessage)),
      (message) => emit(MemberAdded(message: message)),
    );
  }

  Future<void> editMember({required MemberModel member}) async {
    emit(MemberEditing());
    final result = await repo.editMember(
      member.id.toString(),
      title: selectedEditedTitle ?? member.title ?? 'MR.',
      name: nameEditController.text.isEmpty
          ? member.name
          : nameEditController.text,
      email: emailEditController.text.isEmpty
          ? member.email
          : emailEditController.text,
      status: selectedEditedStatus == 'Inactive'
          ? 'F'
          : selectedEditedStatus == 'Active'
          ? 'T'
          : member.status,
    );
    result.fold(
      (failure) =>
          emit(MemberEditingError(error: failure.failure.errorMessage)),
      (message) => emit(MemberEdited(message: message)),
    );
  }
}
