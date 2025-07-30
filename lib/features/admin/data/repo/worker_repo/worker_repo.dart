import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_item.dart';

abstract class WorkerRepo {
  Future<Either<ServerFailure, List<WorkerItem>>> getWorkers();
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
