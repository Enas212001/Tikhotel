import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';

class DownArrow extends StatelessWidget {
  const DownArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 8.w),
        child: Icon(
          Icons.keyboard_arrow_down_sharp,
          color: AppColors.lightGrey,
        ),
      ),
    );
  }
}
