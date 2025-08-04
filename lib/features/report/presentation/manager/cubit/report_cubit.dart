import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/features/report/data/models/report_model/report_item.dart';
import 'package:ticket_flow/features/report/data/repo/report_repo.dart';
import 'package:ticket_flow/features/report/data/repo/report_repo_impl.dart';

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
        roomNumber: selectedLocation!.location.toString(),
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
    final headers = [
      S.current.room,
      S.current.createdAt,
      S.current.depTimeAt,
      S.current.problem,
      S.current.worker,
      S.current.sla,
      S.current.duration,
    ];

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
                      r.room,
                      r.createdAt,
                      r.depTimeAt,
                      r.problem,
                      r.worker,
                      r.sla.toString(),
                      r.duration.toString(),
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
  Future<void> generatePdfByRoom({
    required List<ReportItem> reports,
    required String roomNumber,
    required String startDate,
    required String endDate,
    required int totalRequests,
    required int totalInSLA,
  }) async {
    final pdf = pw.Document();

    // ✅ Load logo (ensure the logo exists in assets and is added in pubspec.yaml)
    final logo = pw.MemoryImage(
      (await rootBundle.load('assets/images/hotel.png')).buffer.asUint8List(),
    );

    // ✅ Handle empty report
    if (reports.isEmpty) {
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (_) => pw.Center(
            child: pw.Text(
              S.current.noRequestsFound(roomNumber),
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
      );

      await Printing.layoutPdf(onLayout: (_) async => pdf.save());
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

    const primaryColor = PdfColor.fromInt(0xFF57A2AD);
    const greyColor = PdfColor.fromInt(0xFFd2f5ff);
    const whiteColor = PdfColor.fromInt(0xFFF5F5F5);

    for (int i = 0; i < reports.length; i += rowsPerPage) {
      final chunk = reports.skip(i).take(rowsPerPage).toList();

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (context) => [
            // ✅ HEADER with logo + text aligned center
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Image(logo),
                pw.SizedBox(width: 10),
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
                    pw.Text(
                      'HGS Report From Room $roomNumber from $startDate to $endDate',
                      style: pw.TextStyle(fontSize: 12),
                      textAlign: pw.TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 5),
            pw.Text(
              'Total Daily Requests: $totalRequests     Total Housekeeping Requests In SLA: $totalInSLA',
              style: pw.TextStyle(fontSize: 12),
              textAlign: pw.TextAlign.center,
            ),
            pw.SizedBox(height: 15),

            // ✅ Custom Table with alternating row colors
            pw.Table(
              border: pw.TableBorder.all(width: 0.5, color: greyColor),
              columnWidths: {
                0: const pw.FlexColumnWidth(1),
                1: const pw.FlexColumnWidth(2),
                2: const pw.FlexColumnWidth(2),
                3: const pw.FlexColumnWidth(2),
                4: const pw.FlexColumnWidth(3),
                5: const pw.FlexColumnWidth(2),
                6: const pw.FlexColumnWidth(1),
                7: const pw.FlexColumnWidth(1),
              },
              children: [
                // ✅ Header Row with Primary Color
                pw.TableRow(
                  decoration: const pw.BoxDecoration(color: primaryColor),
                  children: headers.map((h) {
                    return pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(
                        h,
                        style: pw.TextStyle(
                          fontSize: 10,
                          color: PdfColors.white,
                          fontWeight: pw.FontWeight.bold,
                        ),
                        textAlign: pw.TextAlign.center,
                      ),
                    );
                  }).toList(),
                ),
                // ✅ Data Rows with alternating grey/white
                ...chunk.asMap().entries.map((entry) {
                  final index = entry.key;
                  final r = entry.value;
                  final rowColor = index.isEven ? greyColor : whiteColor;
                  return pw.TableRow(
                    decoration: pw.BoxDecoration(color: rowColor),
                    children: [
                      _cell(r.room ?? ''),
                      _cell(r.createdAt ?? ''),
                      _cell(r.depTimeAt ?? ''),
                      _cell(r.fixedAt ?? ''),
                      _cell(r.problem ?? ''),
                      _cell(r.worker ?? ''),
                      _cell(r.sla.toString()),
                      _cell(r.duration.toString()),
                    ],
                  );
                }),
              ],
            ),
          ],
        ),
      );
    }

    await Printing.layoutPdf(onLayout: (_) async => pdf.save());
  }
}

// ✅ Helper for table cells
pw.Widget _cell(String text) => pw.Padding(
  padding: const pw.EdgeInsets.all(4),
  child: pw.Text(
    text,
    style: pw.TextStyle(fontSize: 9),
    textAlign: pw.TextAlign.center,
  ),
);
