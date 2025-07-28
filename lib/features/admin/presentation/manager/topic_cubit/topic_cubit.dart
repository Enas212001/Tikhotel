import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/data/repo/admin_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/admin_repo_impl.dart';

part 'topic_state.dart';

class TopicCubit extends Cubit<TopicState> {
  TopicCubit() : super(TopicInitial());
  final AdminRepo repo = AdminRepoImpl(api: getIt.get<DioConsumer>());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController topicController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController slaController = TextEditingController();
  TextEditingController topicEditController = TextEditingController();
  TextEditingController departmentEditController = TextEditingController();
  TextEditingController slaEditController = TextEditingController();
  String? selectedStatus;
  String? selectedEditedStatus;
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
      departmentId: departmentController.text,
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
      departmentId: departmentEditController.text.isEmpty
          ? departmentController.text
          : departmentEditController.text,
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
