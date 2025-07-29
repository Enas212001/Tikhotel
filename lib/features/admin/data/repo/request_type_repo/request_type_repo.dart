import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_model.dart';

abstract class RequestTypeRepo {
  Future<Either<ServerFailure, List<RequestTypeModel>>> getRequestTypes();

  Future<Either<ServerFailure, RequestTypeModel>> addRequestType({
    required String requestType,
  });
  Future<Either<ServerFailure, RequestTypeModel>> editRequestType(
    String id, {
    required String requestType,
  });
  Future<Either<ServerFailure, String>> deleteRequestType(String id);
}
