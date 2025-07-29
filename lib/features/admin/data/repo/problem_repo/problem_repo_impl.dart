import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_item.dart';
import 'package:ticket_flow/features/admin/data/repo/problem_repo/problem_repo.dart';
import 'package:ticket_flow/generated/l10n.dart';

class ProblemRepoImpl extends ProblemRepo {
  final ApiConsumer api;

  ProblemRepoImpl({required this.api});

  @override
  Future<Either<ServerFailure, ProblemItem>> addProblem({
    required String problemTopic,
    required String departmentId,
    required String sla,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addProblem,
        data: {
          ApiKey.topic: problemTopic,
          ApiKey.departmentId: departmentId,
          ApiKey.sla: sla,
        },
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final problem = ProblemItem.fromJson(response['data']);
        return right(problem);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.anUnexpectedErrorOccurred,
            ),
          ),
        );
      }
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, String>> deleteProblem(String id) async {
    try {
      final response = await api.delete(EndPoints.deleteProblem(id));
      if (response is Map<String, dynamic>) {
        final message = response['message'] ?? S.current.problemDeleted;
        return right(message);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.anUnexpectedErrorOccurred,
            ),
          ),
        );
      }
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, ProblemItem>> editProblem(
    String id, {
    String? problemTopic,
    String? departmentId,
    String? sla,
  }) async {
    try {
      final response = await api.put(
        EndPoints.editProblem(id),
        data: {
          ApiKey.topic: problemTopic,
          ApiKey.departmentId: departmentId,
          ApiKey.sla: sla,
        },
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final problem = ProblemItem.fromJson(response['data']);
        return right(problem);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.anUnexpectedErrorOccurred,
            ),
          ),
        );
      }
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<ProblemItem>>> getProblems() async {
    try {
      final response = await api.get(EndPoints.problems);
      if (response is Map<String, dynamic> && response['data'] != null) {
        final problems = (response['data'] as List)
            .map((e) => ProblemItem.fromJson(e))
            .toList();
        return right(problems);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.anUnexpectedErrorOccurred,
            ),
          ),
        );
      }
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }
}
