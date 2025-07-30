import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> generatePdf() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => [
        pw.Header(
          level: 0,
          child: pw.Text(
            'Report by Date',
            style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
          ),
        ),
        pw.Text('Date From: '),
        pw.Text('Date To: '),
        pw.Text('Department:  "Not Selected"}'),
        pw.SizedBox(height: 20),
        pw.Text(
          '🔹 This is a placeholder report. You can extend it with your data.',
        ),
      ],
    ),
  );

  // ✅ Preview or print the PDF
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
