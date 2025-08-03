// ✅ Generic Dotted Line Painter (supports horizontal, vertical, partial, full width)
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/ticket_shape_border.dart';

class DottedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final bool isHorizontal;
  final double? startFraction;
  final double? endFraction;
  final bool showEdgeRhombus; // 🔹 NEW
  final double rhombusSize; // 🔹 NEW

  DottedLinePainter({
    this.color = AppColors.main,
    this.dashWidth = 6,
    this.dashSpace = 4,
    this.isHorizontal = true,
    this.startFraction,
    this.endFraction,
    this.showEdgeRhombus = true, // ✅ default true
    this.rhombusSize = 6.0, // ✅ rhombus side size
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    if (isHorizontal) {
      final y = size.height / 2;
      final startX = size.width * (startFraction ?? 0);
      final endX = size.width * (endFraction ?? 1);

      // 🔹 Draw Dotted Line
      double x = startX;
      while (x < endX) {
        canvas.drawLine(Offset(x, y), Offset(x + dashWidth, y), paint);
        x += dashWidth + dashSpace;
      }

      // 🔹 Draw Rhombus at start & end
      if (showEdgeRhombus) {
        _drawRhombus(canvas, Offset(startX, y), rhombusSize, paint);
        _drawRhombus(canvas, Offset(endX, y), rhombusSize, paint);
      }
    } else {
      final x = size.width / 2;
      final startY = size.height * (startFraction ?? 0);
      final endY = size.height * (endFraction ?? 1);

      // 🔹 Draw Dotted Line
      double y = startY;
      while (y < endY) {
        canvas.drawLine(Offset(x, y), Offset(x, y + dashWidth), paint);
        y += dashWidth + dashSpace;
      }

      // 🔹 Draw Rhombus at start & end
      if (showEdgeRhombus) {
        _drawRhombus(canvas, Offset(x, startY), rhombusSize, paint);
        _drawRhombus(canvas, Offset(x, endY), rhombusSize, paint);
      }
    }
  }

  /// 🔹 Helper to draw a diamond shape
  void _drawRhombus(Canvas canvas, Offset center, double size, Paint paint) {
    final Path path = Path()
      ..moveTo(center.dx, center.dy - size / 2) // top
      ..lineTo(center.dx + size / 2, center.dy) // right
      ..lineTo(center.dx, center.dy + size / 2) // bottom
      ..lineTo(center.dx - size / 2, center.dy) // left
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// ✅ Ticket Border Painter (reuses dashed path creation)
class DottedTicketBorderPainter extends CustomPainter {
  final double borderRadius;
  final double notchRadius;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DottedTicketBorderPainter({
    this.borderRadius = 12.0,
    this.notchRadius = 16.0,
    this.color = AppColors.main,
    this.strokeWidth = 2.0,
    this.dashWidth = 10.0,
    this.dashSpace = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final ticketShape = TicketShapeBorder(
      borderRadius: borderRadius,
      notchRadius: notchRadius,
    );

    final path = ticketShape.getOuterPath(Offset.zero & size);
    final dashedPath = _createDashedPath(path);
    canvas.drawPath(dashedPath, paint);
  }

  Path _createDashedPath(Path source) {
    final Path dest = Path();
    final double arcLength = 3.14 * notchRadius; // full arc

    for (final metric in source.computeMetrics()) {
      double distance = 0.0;

      while (distance < metric.length) {
        // Example: notch arcs start around quarter and three-quarter positions
        final double notch1Start = metric.length * 0.405 - arcLength / 2;
        final double notch1End = metric.length * 0.41 + arcLength / 2;

        final double notch2Start = metric.length * 0.905 - arcLength / 2;
        final double notch2End = metric.length * 0.91 + arcLength / 2;

        final bool insideNotch =
            (distance >= notch1Start && distance <= notch1End) ||
            (distance >= notch2Start && distance <= notch2End);

        if (!insideNotch) {
          final double next = distance + dashWidth;
          dest.addPath(
            metric.extractPath(distance, next.clamp(0.0, metric.length)),
            Offset.zero,
          );
        }

        distance += dashWidth + dashSpace;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
