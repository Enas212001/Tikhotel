import 'package:flutter/material.dart';

class TicketShapeBorder extends ShapeBorder {
  final double borderRadius;
  final double notchRadius;

  const TicketShapeBorder({this.borderRadius = 12.0, this.notchRadius = 16.0});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();

    // Start at top left
    path.moveTo(rect.left + borderRadius, rect.top);

    // Top edge
    path.lineTo(rect.right - borderRadius, rect.top);
    path.arcToPoint(
      Offset(rect.right, rect.top + borderRadius),
      radius: Radius.circular(borderRadius),
      clockwise: true,
    );

    // Right edge to notch
    double notchCenterY = rect.top + rect.height / 2;
    path.lineTo(rect.right, notchCenterY - notchRadius);
    path.arcToPoint(
      Offset(rect.right, notchCenterY + notchRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    // Right edge to bottom
    path.lineTo(rect.right, rect.bottom - borderRadius);
    path.arcToPoint(
      Offset(rect.right - borderRadius, rect.bottom),
      radius: Radius.circular(borderRadius),
      clockwise: true,
    );

    // Bottom edge
    path.lineTo(rect.left + borderRadius, rect.bottom);
    path.arcToPoint(
      Offset(rect.left, rect.bottom - borderRadius),
      radius: Radius.circular(borderRadius),
      clockwise: true,
    );

    // Left edge to notch
    path.lineTo(rect.left, notchCenterY + notchRadius);
    path.arcToPoint(
      Offset(rect.left, notchCenterY - notchRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    // Left edge to top
    path.lineTo(rect.left, rect.top + borderRadius);
    path.arcToPoint(
      Offset(rect.left + borderRadius, rect.top),
      radius: Radius.circular(borderRadius),
      clockwise: true,
    );

    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }
}
