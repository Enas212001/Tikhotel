import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/member_model/member_model.dart';
import 'package:ticket_flow/features/admin/data/repo/member_repo/member_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/member_repo/member_repo_impl.dart';

part 'member_state.dart';

class MemberCubit extends Cubit<MemberState> {
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
      (members) => emit(MemberLoaded(members: members)),
    );
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
      status: selectedStatus ?? 'T',
    );
    result.fold(
      (failure) => emit(MemberAddingError(error: failure.failure.errorMessage)),
      (message) => emit(MemberAdded(message: message)),
    );
  }

  Future<void> editMember(String id) async {
    emit(MemberEditing());
    final result = await repo.editMember(
      id,
      title: selectedEditedTitle ?? selectedTitle ?? 'MR.',
      name: nameEditController.text.isEmpty ? null : nameEditController.text,
      email: emailEditController.text.isEmpty ? null : emailEditController.text,
      status: selectedEditedStatus ?? selectedStatus ?? 'T',
    );
    result.fold(
      (failure) =>
          emit(MemberEditingError(error: failure.failure.errorMessage)),
      (message) => emit(MemberEdited(message: message)),
    );
  }
}
