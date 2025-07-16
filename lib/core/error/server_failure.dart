import 'package:dio/dio.dart';

class FailureModel {
  final String errorMessage;
  final String status;

  FailureModel({required this.errorMessage, required this.status});
  factory FailureModel.fromJson(Map<String, dynamic> json) {
    return FailureModel(status: json['status'], errorMessage: json['message']);
  }
}

class ServerFailure implements Exception {
  final FailureModel failure;

  ServerFailure({required this.failure});
}

ServerFailure handleDioException(DioException dioException) {
  switch (dioException.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerFailure(
        failure: FailureModel.fromJson(dioException.response!.data),
      );
    case DioExceptionType.sendTimeout:
      throw ServerFailure(
        failure: FailureModel.fromJson(dioException.response!.data),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerFailure(
        failure: FailureModel.fromJson(dioException.response!.data),
      );
    case DioExceptionType.badResponse:
      switch (dioException.response!.statusCode) {
        case 400:
          throw ServerFailure(
            failure: FailureModel.fromJson(dioException.response!.data),
          );
        case 401:
          throw ServerFailure(
            failure: FailureModel.fromJson(dioException.response!.data),
          );
        case 403:
          throw ServerFailure(
            failure: FailureModel.fromJson(dioException.response!.data),
          );
        case 404:
          throw ServerFailure(
            failure: FailureModel.fromJson(dioException.response!.data),
          );
        case 409:
          throw ServerFailure(
            failure: FailureModel.fromJson(dioException.response!.data),
          );
        case 422:
          throw ServerFailure(
            failure: FailureModel.fromJson(dioException.response!.data),
          );
        case 504:
          throw ServerFailure(
            failure: FailureModel.fromJson(dioException.response!.data),
          );
        default:
          throw ServerFailure(
            failure: FailureModel.fromJson(dioException.response!.data),
          );
      }
    case DioExceptionType.cancel:
      throw ServerFailure(
        failure: FailureModel.fromJson(dioException.response!.data),
      );
    case DioExceptionType.connectionError:
      throw ServerFailure(
        failure: FailureModel.fromJson(dioException.response!.data),
      );
    case DioExceptionType.unknown:
      if (dioException.response != null) {
        throw ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data),
        );
      } else {
        throw ServerFailure(
          failure: FailureModel(
            status: 'error',
            errorMessage: 'Unknown error occurred.',
          ),
        );
      }
    case DioExceptionType.badCertificate:
      throw ServerFailure(
        failure: FailureModel.fromJson(dioException.response!.data),
      );
    // ignore: unreachable_switch_default
    default:
      throw ServerFailure(
        failure: FailureModel.fromJson(dioException.response!.data),
      );
  }
}
