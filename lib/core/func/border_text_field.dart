import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';

OutlineInputBorder borderTextField() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide(color: AppColors.border, width: 1.w),
  );
}
