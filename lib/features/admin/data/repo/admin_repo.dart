import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_item.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_model.dart';
import 'package:ticket_flow/features/admin/data/models/role_model/role_model.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user_model.dart';

abstract class AdminRepo {
  Future<Either<ServerFailure, List<UserModel>>> getUsers();
  Future<Either<ServerFailure, UserModel>> addUser({
    required int roleId,
    required String email,
    required String password,
    required String firstName,
    required String department,
    required String status,
    required String operational,
  });
  Future<Either<ServerFailure, UserModel>> editUser(
    String id, {
    int? roleId,
    String? email,
    String? password,
    String? firstName,
    String? department,
    String? status,
  });
  Future<Either<ServerFailure, String>> deleteUser(String id);
  Future<Either<ServerFailure, List<RoleModel>>> getRoles();
  Future<Either<ServerFailure, List<RequestTypeModel>>> getRequestTypes();
  Future<Either<ServerFailure, RequestTypeModel>> addRequestType({
    required String requestType,
  });
  Future<Either<ServerFailure, RequestTypeModel>> editRequestType(
    String id, {
    required String requestType,
  });
  Future<Either<ServerFailure, String>> deleteRequestType(String id);
  Future<Either<ServerFailure, List<ProblemItem>>> getProblems();
  Future<Either<ServerFailure, ProblemItem>> addProblem({
    required String topic,
    required int departmentId,
  });
  Future<Either<ServerFailure, ProblemItem>> editProblem(
    String id, {
    required String topic,
    required int departmentId,
  });
  Future<Either<ServerFailure, String>> deleteProblem(String id);
}
