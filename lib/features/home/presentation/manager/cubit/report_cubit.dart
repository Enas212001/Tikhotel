import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/features/home/data/models/report_model/report_item.dart';
import 'package:ticket_flow/features/home/data/repo/report_repo.dart';
import 'package:ticket_flow/features/home/data/repo/report_repo_impl.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:ticket_flow/generated/l10n.dart';
part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());
  ReportRepo reportRepo = ReportRepoImpl(api: getIt.get<DioConsumer>());
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  DepartmentModel? selectedDepartment;
  LocationItem? selectedLocation;

  Future<void> getReportByDate() async {
    emit(FetchReportByDateLoading());
    try {
      final response = await reportRepo.getReportByDate(
        dateFrom: dateFromController.text,
        dateTo: dateToController.text,
        departmentId: selectedDepartment!.id.toString(),
      );
      response.fold(
        (l) => emit(FetchReportByDateFailure(message: l.failure.errorMessage)),
        (r) => emit(FetchReportByDateSuccess(reports: r)),
      );
    } on ServerFailure catch (e) {
      emit(FetchReportByDateFailure(message: e.failure.errorMessage));
    } catch (e) {
      emit(FetchReportByDateFailure(message: e.toString()));
    }
  }

  Future<void> getReportByRoom() async {
    emit(FetchReportByRoomLoading());
    try {
      final response = await reportRepo.getReportByRoom(
        dateFrom: dateFromController.text,
        dateTo: dateToController.text,
        roomNumber: selectedLocation!.id.toString(),
        departmentId: selectedDepartment!.id.toString(),
      );
      response.fold(
        (l) => emit(FetchReportByRoomFailure(message: l.failure.errorMessage)),
        (r) => emit(FetchReportByRoomSuccess(reports: r)),
      );
    } on ServerFailure catch (e) {
      emit(FetchReportByRoomFailure(message: e.failure.errorMessage));
    } catch (e) {
      emit(FetchReportByRoomFailure(message: e.toString()));
    }
  }
}

extension ReportPdfGenerator on ReportCubit {
  Future<void> generatePdf(List<ReportItem> reports) async {
    final pdf = pw.Document();

    const int rowsPerPage = 40; // ✅ safe limit per page
    final headers = ['ID', 'Message', 'Status', 'Date'];

    // 🔹 Split the reports into chunks
    for (int i = 0; i < reports.length; i += rowsPerPage) {
      final chunk = reports.skip(i).take(rowsPerPage).toList();

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => [
            pw.Header(
              level: 0,
              text: 'Report by Date (Page ${(i ~/ rowsPerPage) + 1})',
            ),
            pw.Table.fromTextArray(
              headers: headers,
              data: chunk
                  .map(
                    (r) => [
                      r.id.toString(),
                      r.message ?? '-',
                      r.status,
                      r.created,
                    ],
                  )
                  .toList(),
              cellAlignment: pw.Alignment.centerLeft,
            ),
          ],
        ),
      );
    }

    // ✅ Preview/Print
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}

extension ReportPdfGeneratorByRoom on ReportCubit {
  /// ✅ Generate PDF for reports by room with custom header
  Future<void> generatePdfByRoom({
    required List<ReportItem> reports,
    required String roomNumber,
    required String startDate,
    required String endDate,
    required int totalRequests,
    required int totalInSLA,
  }) async {
    final pdf = pw.Document();

    // ✅ Handle empty report case
    if (reports.isEmpty) {
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => pw.Center(
            child: pw.Text(
              S.current.noRequestsFound(roomNumber),
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
      );

      await Printing.layoutPdf(onLayout: (format) async => pdf.save());
      return;
    }

    const int rowsPerPage = 40;
    final headers = [
      S.current.room,
      S.current.createdAt,
      S.current.depTimeAt,
      S.current.fixedAt,
      S.current.problem,
      S.current.worker,
      S.current.sla,
      S.current.duration,
    ];

    for (int i = 0; i < reports.length; i += rowsPerPage) {
      final chunk = reports.skip(i).take(rowsPerPage).toList();

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => [
            // ✅ Custom PDF Header
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text(
                  'Steigenberger El Tahrir Hotel Services',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  'HGS Report From Room $roomNumber from $startDate to $endDate',
                  style: pw.TextStyle(fontSize: 12),
                ),
                pw.SizedBox(height: 2),
                pw.Text(
                  'Total Daily Requests: $totalRequests   Total Housekeeping Requests In SLA: $totalInSLA',
                  style: pw.TextStyle(fontSize: 12),
                ),
                pw.SizedBox(height: 10), // spacing before table
              ],
            ),

            // ✅ Table with report data
            pw.Table.fromTextArray(
              headers: headers,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              data: chunk
                  .map(
                    (r) => [
                      r.id.toString(),
                      r.message ?? '-',
                      r.status,
                      r.created,
                    ],
                  )
                  .toList(),
            ),
          ],
        ),
      );
    }

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }
}
