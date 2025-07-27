import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_item.dart';
import 'package:ticket_flow/features/admin/data/repo/admin_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/admin_repo_impl.dart';

part 'problem_state.dart';

class ProblemCubit extends Cubit<ProblemState> {
  ProblemCubit() : super(ProblemInitial());
  final AdminRepo repo = AdminRepoImpl(api: getIt.get<DioConsumer>());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController topicController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController slaController = TextEditingController();
  
  Future<void> getProblems() async {
    emit(ProblemFetching());
    final result = await repo.getProblems();
    result.fold(
      (l) => emit(ProblemFetchingError(error: l.failure.errorMessage)),
      (r) => emit(ProblemFetched(problems: r)),
    );
  }

  Future<void> addProblem({
    required String topic,
    required int departmentId,
  }) async {
    emit(ProblemAdding());
    final result = await repo.addProblem(
      topic: topic,
      departmentId: departmentId,
    );
    result.fold(
      (l) => emit(ProblemAddingError(error: l.failure.errorMessage)),
      (r) => emit(ProblemAdded(problem: r)),
    );
  }

  Future<void> editProblem({
    required String id,
    required String topic,
    required int departmentId,
  }) async {
    emit(ProblemEditing());
    final result = await repo.editProblem(
      id,
      topic: topic,
      departmentId: departmentId,
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
