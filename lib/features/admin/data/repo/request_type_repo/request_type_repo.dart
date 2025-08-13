import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_item.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_model.dart';

abstract class RequestTypeRepo {
  Future<Either<ServerFailure, RequestTypeModel>> getRequestTypes({
    int page,
    int limit,
  });
  Future<Either<ServerFailure, RequestTypeModel>> getAllRequestTypes();

  Future<Either<ServerFailure, RequestTypeItem>> addRequestType({
    required String requestType,
  });
  Future<Either<ServerFailure, RequestTypeItem>> editRequestType(
    String id, {
    required String requestType,
  });
  Future<Either<ServerFailure, String>> deleteRequestType(String id);
}
