import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_item.dart';

abstract class ProblemRepo {
  Future<Either<ServerFailure, List<ProblemItem>>> getProblems();
  Future<Either<ServerFailure, ProblemItem>> addProblem({
    required String problemTopic,
    required String departmentId,
    required String sla,
  });
  Future<Either<ServerFailure, ProblemItem>> editProblem(
    String id, {
    String? problemTopic,
    String? departmentId,
    String? sla,
  });
  Future<Either<ServerFailure, String>> deleteProblem(String id);
}
