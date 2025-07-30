import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/home/data/models/report_model/report_item.dart';

abstract class ReportRepo {
  Future<Either<ServerFailure, List<ReportItem>>> getReportByDate({
    required String dateFrom,
    required String dateTo,
    required String departmentId,
  });
  Future<Either<ServerFailure, List<ReportItem>>> getReportByRoom({
    required String dateFrom,
    required String dateTo,
    required String roomNumber,
    required String departmentId,
  });
}
