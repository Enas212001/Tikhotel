import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';

import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';

import 'package:ticket_flow/features/report/data/models/report_model/report_item.dart';

import 'report_repo.dart';

class ReportRepoImpl extends ReportRepo {
  final ApiConsumer api;

  ReportRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, List<ReportItem>>> getReportByDate({
    required String dateFrom,
    required String dateTo,
    required String departmentId,
  }) async {
    try {
      final response = await api.post(
        EndPoints.reportByDate,
        data: {
          ApiKey.dateFrom: dateFrom,
          ApiKey.dateTo: dateTo,
          ApiKey.departmentId: departmentId,
        },
      );
      if (response is Map<String, dynamic>) {
        return right(
          (response['data'] as List)
              .map((e) => ReportItem.fromJson(e))
              .toList(),
        );
      }
      return left(
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
  Future<Either<ServerFailure, List<ReportItem>>> getReportByRoom({
    required String dateFrom,
    required String dateTo,
    required String roomNumber,
    required String departmentId,
  }) async {
    try {
      final response = await api.post(
        EndPoints.reportByRoom,
        data: {
          ApiKey.dateFrom: dateFrom,
          ApiKey.dateTo: dateTo,
          ApiKey.locationId: roomNumber,
          ApiKey.departmentId: departmentId,
        },
      );
      if (response is Map<String, dynamic>) {
        return right(
          (response['data'] as List)
              .map((e) => ReportItem.fromJson(e))
              .toList(),
        );
      }
      return left(
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
