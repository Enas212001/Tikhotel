import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class TitleOnBorder extends StatelessWidget {
  final VoidCallback onUpload;
  final String title;
  final Widget? child;
  const TitleOnBorder({
    super.key,
    required this.onUpload,
    required this.title,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border, width: 1.5),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: GestureDetector(onTap: onUpload, child: child),
          ),
          Positioned(
            left: 7,
            top: -6,
            child: Center(
              child: Container(
                color: AppColors.scaffoldBackgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(title, style: TextStyles.text12LightGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
