import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/data/repo/topic_repo/topic_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/topic_repo/topic_repo_impl.dart';

part 'topic_state.dart';

class TopicCubit extends Cubit<TopicState> {
  TopicCubit() : super(TopicInitial());
  final TopicRepo repo = TopicRepoImpl(api: getIt.get<DioConsumer>());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController topicController = TextEditingController();
  TextEditingController slaController = TextEditingController();
  TextEditingController topicEditController = TextEditingController();
  TextEditingController departmentEditController = TextEditingController();
  TextEditingController slaEditController = TextEditingController();
  String? selectedStatus;
  String? selectedEditedStatus;
  DepartmentModel? selectedDepartment;
  DepartmentModel? selectedEditedDepartment;

  Future<void> getTopics() async {
    emit(TopicFetching());

    final result = await repo.getTopics();
    result.fold(
      (l) => emit(TopicFetchingError(error: l.failure.errorMessage)),
      (r) => emit(TopicFetched(topics: r)),
    );
  }

  Future<void> addTopic() async {
    emit(TopicAdding());
    final result = await repo.addTopic(
      topic: topicController.text,
      departmentId: selectedDepartment!.id!.toString(),
      sla: slaController.text,
    );
    result.fold(
      (l) => emit(TopicAddingError(error: l.failure.errorMessage)),
      (r) => emit(TopicAdded(topic: r)),
    );
  }

  Future<void> editTopic({required String id}) async {
    emit(TopicEditing());
    final result = await repo.editTopic(
      id,
      topic: topicEditController.text.isEmpty
          ? topicController.text
          : topicEditController.text,
      departmentId:
          selectedEditedDepartment?.id?.toString() ??
          selectedDepartment!.id!.toString(),
      sla: slaEditController.text.isEmpty
          ? slaController.text
          : slaEditController.text,
    );
    result.fold(
      (l) => emit(TopicEditingError(error: l.failure.errorMessage)),
      (r) => emit(TopicEdited(topic: r)),
    );
  }

  Future<void> deleteTopic({required String id}) async {
    emit(TopicDeleting());
    final result = await repo.deleteTopic(id);
    result.fold(
      (l) => emit(TopicDeletingError(error: l.failure.errorMessage)),
      (r) => emit(TopicDeleted(message: r)),
    );
  }
}
