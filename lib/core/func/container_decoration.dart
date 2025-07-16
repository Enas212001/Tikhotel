import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';

BoxDecoration containerDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(16.r),
    color: AppColors.scaffoldBackgroundColor,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.08),
        blurRadius: 16.r,
        offset: Offset(4.r, 4.r),
      ),
    ],
  );
}
