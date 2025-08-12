import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_model.dart';
import 'package:ticket_flow/features/admin/data/repo/topic_repo/topic_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/topic_repo/topic_repo_impl.dart';
import 'package:ticket_flow/features/admin/presentation/manager/mixins/filterable_mixin.dart';

part 'topic_state.dart';

class TopicCubit extends Cubit<TopicState> with FilterableMixin<TopicItem> {
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
  int topicPage = 1;
  final int limit = 20;
  Future<void> getTopics({int? page}) async {
    emit(TopicFetching());

    final result = await repo.getTopics(page: page ?? topicPage, limit: limit);
    result.fold(
      (l) => emit(TopicFetchingError(error: l.failure.errorMessage)),
      (r) {
        if (topicPage == 1) {
          allTopics.clear();
        }
        allTopics.addAll(r.data!);
        allItems = allTopics;
        emit(
          TopicFetched(
            topics: TopicModel(data: allTopics, pagination: r.pagination),
          ),
        );
      },
    );
  }

  List<TopicItem> allTopics = [];

  @override
  bool filterItem(TopicItem topic, String filter) {
    switch (filter) {
      case 'active':
        return topic.status == 'T';
      case 'inactive':
        return topic.status == 'F';
      default:
        return true;
    }
  }

  @override
  bool searchItem(TopicItem topic, String query) {
    final name = topic.topic?.toLowerCase() ?? '';
    final queryLower = query.toLowerCase();
    return name.contains(queryLower);
  }

  @override
  void emitFilteredState(List<TopicItem> filteredItems) {
    if (state is TopicFetched) {
      final currentState = state as TopicFetched;
      emit(
        TopicFetched(
          topics: TopicModel(
            data: filteredItems,
            pagination: currentState.topics.pagination,
          ),
        ),
      );
    }
  }

  void searchTopics(String query) {
    searchItems(query);
  }

  void filterTopics(String filter) {
    filterItems(filter);
  }

  Future<void> addTopic() async {
    emit(TopicAdding());
    final result = await repo.addTopic(
      topic: topicController.text,
      departmentId: selectedDepartment!.id!.toString(),
      sla: slaController.text,
      status: selectedStatus == 'Inactive'
          ? 'F'
          : selectedStatus == 'Active'
          ? 'T'
          : '',
    );
    result.fold(
      (l) => emit(TopicAddingError(error: l.failure.errorMessage)),
      (r) => emit(TopicAdded(topic: r)),
    );
  }

  Future<void> editTopic({required TopicItem topic}) async {
    emit(TopicEditing());
    final result = await repo.editTopic(
      topic.id.toString(),
      topic: topicEditController.text.isEmpty
          ? topic.topic.toString()
          : topicEditController.text,
      departmentId:
          selectedEditedDepartment?.id.toString() ??
          topic.departmentId.toString(),
      sla: slaEditController.text.isEmpty
          ? topic.sla.toString()
          : slaEditController.text,
      status: selectedEditedStatus == 'Inactive'
          ? 'F'
          : selectedEditedStatus == 'Active'
          ? 'T'
          : topic.status,
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
