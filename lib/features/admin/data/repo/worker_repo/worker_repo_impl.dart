import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';

import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_item.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_model.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'worker_repo.dart';

class WorkerRepoImpl extends WorkerRepo {
  final ApiConsumer api;

  WorkerRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, WorkerItem>> addWorker({
    required String name,
    required String phone,
    required String status,
    required String department,
    required int statusWhatsapp,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addWorker,
        data: {
          ApiKey.firstName: name,
          ApiKey.phone: phone,
          ApiKey.status: status,
          ApiKey.departmentId: department,
          ApiKey.statusWhatsapp: statusWhatsapp,
        },
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        return Right(WorkerItem.fromJson(response['data']));
      }
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: "Error", status: false),
        ),
      );
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
  Future<Either<ServerFailure, String>> deleteWorker(String id) async {
    try {
      final response = await api.delete(EndPoints.deleteWorker(id));
      if (response is Map<String, dynamic>) {
        if (response['status'] == true) {
          return Right(response['message'] ?? S.current.userDeleted);
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
      }
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: "Error", status: false),
        ),
      );
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
  Future<Either<ServerFailure, WorkerModel>> getWorkers({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await api.get(
        EndPoints.workers,
        queryParameters: {ApiKey.page: page, ApiKey.limit: limit},
      );
      if (response is Map<String, dynamic>) {
        final workers = WorkerModel.fromJson(response);
        return Right(workers);
      }
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: "Error", status: false),
        ),
      );
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
  Future<Either<ServerFailure, List<WorkerItem>>> getAllWorkers() async {
    try {
      final response = await api.get(EndPoints.workers);
      if (response is Map<String, dynamic>) {
        final workers = (response['data'] as List)
            .map((e) => WorkerItem.fromJson(e))
            .toList();
        return Right(workers);
      }
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: "Error", status: false),
        ),
      );
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
  Future<Either<ServerFailure, WorkerItem>> updateWorker(
    String id, {
    required String name,
    required String phone,
    required String status,
    required String department,
    required int statusWhatsapp,
  }) async {
    try {
      final response = await api.put(
        EndPoints.editWorker(id),
        data: {
          ApiKey.firstName: name,
          ApiKey.phone: phone,
          ApiKey.status: status,
          ApiKey.departmentId: department,
          ApiKey.statusWhatsapp: statusWhatsapp,
        },
      );
      if (response is Map<String, dynamic>) {
        return Right(WorkerItem.fromJson(response));
      }
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: "Error", status: false),
        ),
      );
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
