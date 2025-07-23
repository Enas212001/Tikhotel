import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ticket_flow/generated/l10n.dart';

class FailureModel {
  final String errorMessage;
  final bool status;

  FailureModel({required this.errorMessage, required this.status});

  factory FailureModel.fromJson(Map<String, dynamic> json) {
    return FailureModel(
      status: json['status'] ?? false,
      errorMessage: json['message'] ?? S.current.anUnexpectedErrorOccurred,
    );
  }
}

class ServerFailure implements Exception {
  final FailureModel failure;

  ServerFailure({required this.failure});
}

ServerFailure handleDioException(DioException dioException) {
  final response = dioException.response;
  final data = response?.data;

  FailureModel defaultFailure = FailureModel(
    status: false,
    errorMessage: S.current.anUnexpectedErrorOccurred,
  );

  FailureModel parseFailureModel(dynamic data) {
    if (data is Map<String, dynamic>) {
      return FailureModel.fromJson(data);
    } else {
      return defaultFailure;
    }
  }

  if (dioException.error is SocketException) {
    return ServerFailure(
      failure: FailureModel(
        status: false,
        errorMessage: S.current.noInternetConnection,
      ),
    );
  }

  switch (dioException.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badResponse:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
      return ServerFailure(failure: parseFailureModel(data));

    case DioExceptionType.unknown:
    default:
      return ServerFailure(failure: defaultFailure);
  }
}
