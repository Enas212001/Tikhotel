import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/ticket_shape_border.dart';

class GuestRequestCard extends StatelessWidget {
  const GuestRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.viewRequestGuestPage);
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 20.w) +
            EdgeInsets.only(bottom: 16.h),
        child: CustomPaint(
          painter: DottedTicketBorderPainter(
            borderRadius: 12.r,
            notchRadius: 16.r,
            color: AppColors.primary,
            strokeWidth: 2,
            dashWidth: 10,
            dashSpace: 8,
          ),
          child: Material(
            color: AppColors.ticket,
            shape: TicketShapeBorder(borderRadius: 12.r, notchRadius: 16.r),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 🔹 First Row with a small dotted line between the two items
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Dotted line only across the space between the two items
                      Positioned.fill(
                        child: CustomPaint(
                          painter: HorizontalBetweenItemsPainter(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          RequestItemGuest(title: 'Request id', data: '12128'),
                          RequestItemGuest(title: 'Status', data: 'new'),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),

                  // 🔹 Middle divider for entire ticket
                  SizedBox(
                    height: 1,
                    child: CustomPaint(
                      painter: HorizontalDottedLinePainter(color: Colors.grey),
                      size: Size(double.infinity, 1),
                    ),
                  ),

                  SizedBox(height: 15.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      RequestItemGuest(
                        title: 'Replay',
                        data: 'Lorem ipsum dolor sit amet, consectetur',
                      ),
                      RequestItemGuest(
                        title: 'Last Replay',
                        data: 'Lorem ipsum dolor sit amet, consectetur',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalBetweenItemsPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  HorizontalBetweenItemsPainter({
    this.color = Colors.grey,
    this.dashWidth = 6,
    this.dashSpace = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    // Start drawing from 40% to 60% of the row width (only middle gap)
    final startX = size.width * 0.45;
    final endX = size.width * 0.55;
    final y = size.height / 2;

    double x = startX;
    while (x < endX) {
      canvas.drawLine(Offset(x, y), Offset(x + dashWidth, y), paint);
      x += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Horizontal dotted line across full width
class HorizontalDottedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  HorizontalDottedLinePainter({
    this.color = Colors.grey,
    this.dashWidth = 6,
    this.dashSpace = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startX = 0;
    final y = 0.5;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class RequestItemGuest extends StatelessWidget {
  const RequestItemGuest({super.key, required this.title, required this.data});
  final String title, data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyles.text12RegularLightGrey),
        SizedBox(
          width: 150.w,
          child: Text(
            data,
            textAlign: TextAlign.center,
            style: TextStyles.text12MeduimGrey,
          ),
        ),
      ],
    );
  }
}

class DottedDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;

    const dashWidth = 6;
    const dashSpace = 4;
    double startY = 0;
    final x = size.width / 2;

    while (startY < size.height) {
      canvas.drawLine(Offset(x, startY), Offset(x, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

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
    this.color = Colors.grey,
    this.strokeWidth = 2.0,
    this.dashWidth = 6.0,
    this.dashSpace = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Get the exact ticket path from your custom shape
    final ticketShape = TicketShapeBorder(
      borderRadius: borderRadius,
      notchRadius: notchRadius,
    );
    final path = ticketShape.getOuterPath(Offset.zero & size);

    // Convert path into dashed path
    final dashedPath = _createDashedPath(path, dashWidth, dashSpace);

    // Draw the dotted border
    canvas.drawPath(dashedPath, paint);
  }

  /// Helper to create a dashed path from any Path
  Path _createDashedPath(Path source, double dashWidth, double dashSpace) {
    final Path dest = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double next = distance + dashWidth;
        dest.addPath(
          metric.extractPath(distance, next.clamp(0.0, metric.length)),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
