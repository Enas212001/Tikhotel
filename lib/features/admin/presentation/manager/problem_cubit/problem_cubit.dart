import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_item.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_model.dart';
import 'package:ticket_flow/features/admin/data/repo/problem_repo/problem_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/problem_repo/problem_repo_impl.dart';

part 'problem_state.dart';

class ProblemCubit extends Cubit<ProblemState> {
  ProblemCubit() : super(ProblemInitial());
  final ProblemRepo repo = ProblemRepoImpl(api: getIt.get<DioConsumer>());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController topicController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController slaController = TextEditingController();
  TextEditingController topicEditController = TextEditingController();
  TextEditingController departmentEditController = TextEditingController();
  TextEditingController slaEditController = TextEditingController();
  int problemPage = 1;
  final int limit = 20;
  Future<void> getProblems({int? page}) async {
    emit(ProblemFetching());
    final result = await repo.getProblems(
      page: page ?? problemPage,
      limit: limit,
    );
    result.fold(
      (l) => emit(ProblemFetchingError(error: l.failure.errorMessage)),
      (r) {
        if (problemPage == 1) {
          allProblems.clear();
        }
        allProblems.addAll(r.data!);
        emit(ProblemFetched(problems: r));
      },
    );
  }
  Future<void> getAllProblems() async {
    emit(AllProblemFetching());
    final result = await repo.getAllProblem();
    result.fold(
      (l) => emit(AllProblemFetchingError(error: l.failure.errorMessage)),
      (r) {
        emit(AllProblemFetched(problems: r));
      },
    );
  }

  List<ProblemItem> allProblems = [];
  void searchProblem(String query) {
    if (state is! ProblemFetched) return;
    final currentState = state as ProblemFetched;
    if (query.isEmpty) {
      emit(ProblemFetched(problems: currentState.problems));
      return;
    }

    final filtered = allProblems.where((type) {
      final name = type.topic?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();

    emit(ProblemFetched(problems: ProblemModel(data: filtered)));
  }

  Future<void> addProblem() async {
    emit(ProblemAdding());
    final result = await repo.addProblem(
      problemTopic: topicController.text,
      departmentId: departmentController.text,
      sla: slaController.text,
    );
    result.fold(
      (l) => emit(ProblemAddingError(error: l.failure.errorMessage)),
      (r) => emit(ProblemAdded(problem: r)),
    );
  }

  Future<void> editProblem({required ProblemItem problem}) async {
    emit(ProblemEditing());
    final result = await repo.editProblem(
      problem.id.toString(),
      problemTopic: topicEditController.text.isEmpty
          ? problem.topic.toString()
          : topicEditController.text,
      departmentId: departmentEditController.text.isEmpty
          ? problem.departmentId.toString()
          : departmentEditController.text,
      sla: slaEditController.text.isEmpty
          ? problem.sla.toString()
          : slaEditController.text,
    );
    result.fold(
      (l) => emit(ProblemEditingError(error: l.failure.errorMessage)),
      (r) => emit(ProblemEdited(problem: r)),
    );
  }

  Future<void> deleteProblem({required String id}) async {
    emit(ProblemDeleting());
    final result = await repo.deleteProblem(id);
    result.fold(
      (l) => emit(ProblemDeletingError(error: l.failure.errorMessage)),
      (r) => emit(ProblemDeleted(message: r)),
    );
  }
}
