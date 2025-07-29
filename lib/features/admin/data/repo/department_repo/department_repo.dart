import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';

abstract class DepartmentRepo {
  Future<Either<ServerFailure, List<DepartmentModel>>> getDepartments();

  Future<Either<ServerFailure, DepartmentModel>> addDepartment({
    required String name,
    required String status,
  });

  Future<Either<ServerFailure, String>> deleteDepartment(String id);

  Future<Either<ServerFailure, DepartmentModel>> editDepartment(
    String id, {
    required String name,
    required String status,
  });
}
