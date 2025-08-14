import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';

import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_item.dart';

import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'department_repo.dart';

class DepartmentRepoImpl extends DepartmentRepo {
  final ApiConsumer api;

  DepartmentRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, DepartmentItem>> addDepartment({
    required String name,
    required String status,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addDepartment,
        data: {ApiKey.name: name, ApiKey.status: status},
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final departments = DepartmentItem.fromJson(response['data']);
        return right(departments);
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
  Future<Either<ServerFailure, String>> deleteDepartment(String id) async {
    try {
      final response = await api.delete(EndPoints.deleteDepartment(id));
      if (response is Map<String, dynamic>) {
        if (response['status'] == true) {
          return Right(response['message'] ?? S.current.departmentDeleted);
        } else {
          return Left(
            ServerFailure(
              failure: FailureModel(
                errorMessage:
                    response['message'] ?? S.current.anUnexpectedErrorOccurred,
                status: false,
              ),
            ),
          );
        }
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
  Future<Either<ServerFailure, DepartmentItem>> editDepartment(
    String id, {
    required String name,
    required String status,
  }) async {
    try {
      final response = await api.put(
        EndPoints.editDepartment(id),
        data: {ApiKey.name: name, ApiKey.status: status},
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final department = DepartmentItem.fromJson(response['data']);
        return right(department);
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
  Future<Either<ServerFailure, DepartmentModel>> getDepartments({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await api.get(
        EndPoints.departments,
        queryParameters: {ApiKey.page: page, ApiKey.limit: limit},
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final departments = DepartmentModel.fromJson(response);
        return right(departments);
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
