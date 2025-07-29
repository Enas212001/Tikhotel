import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_model.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'request_type_repo.dart';

class RequestTypeRepoImpl extends RequestTypeRepo {
  final ApiConsumer api;

  RequestTypeRepoImpl({required this.api});

  @override
  Future<Either<ServerFailure, List<RequestTypeModel>>>
  getRequestTypes() async {
    try {
      final response = await api.get(EndPoints.requestTypes);
      if (response is List) {
        final requestTypes = response
            .map((e) => RequestTypeModel.fromJson(e))
            .toList();
        return right(requestTypes);
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
  Future<Either<ServerFailure, RequestTypeModel>> addRequestType({
    required String requestType,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addRequestType,
        data: {ApiKey.requestType: requestType},
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final requestType = RequestTypeModel.fromJson(response['data']);
        return right(requestType);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              errorMessage: S.current.anUnexpectedErrorOccurred,
              status: false,
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
  Future<Either<ServerFailure, String>> deleteRequestType(String id) async {
    try {
      final response = await api.delete(EndPoints.deleteRequestType(id));
      if (response is Map<String, dynamic>) {
        return right(response['message'] ?? S.current.requestTypeDeleted);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              errorMessage: S.current.anUnexpectedErrorOccurred,
              status: false,
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
  Future<Either<ServerFailure, RequestTypeModel>> editRequestType(
    String id, {
    required String requestType,
  }) async {
    try {
      final response = await api.put(
        EndPoints.editRequestType(id),
        data: {ApiKey.requestType: requestType},
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final requestType = RequestTypeModel.fromJson(response['data']);
        return right(requestType);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              errorMessage: S.current.anUnexpectedErrorOccurred,
              status: false,
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
