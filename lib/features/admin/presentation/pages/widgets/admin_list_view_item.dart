import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class AdminListViewItem extends StatelessWidget {
  const AdminListViewItem({
    super.key,
    required this.items,
    required this.isSelected,
  });

  final String items;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 12.w) + EdgeInsets.only(top: 8.h),
      child: IntrinsicWidth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              items,
              style: TextStyles.text12MediumPrimary.copyWith(
                color: AppColors.grey,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              height: 2.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.main : Colors.transparent,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
