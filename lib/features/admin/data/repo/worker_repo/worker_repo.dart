import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_item.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_model.dart';

abstract class WorkerRepo {
  Future<Either<ServerFailure, WorkerModel>> getWorkers({int page, int limit});
  Future<Either<ServerFailure, List<WorkerItem>>> getAllWorkers();
  Future<Either<ServerFailure, WorkerItem>> addWorker({
    required String name,
    required String phone,
    required String status,
    required String department,
    required int statusWhatsapp,
  });
  Future<Either<ServerFailure, WorkerItem>> updateWorker(
    String id, {
    required String name,
    required String phone,
    required String status,
    required String department,
    required int statusWhatsapp,
  });
  Future<Either<ServerFailure, String>> deleteWorker(String id);
}
