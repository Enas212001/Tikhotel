import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/features/auth/presentation/pages/widgets/back_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r) + EdgeInsets.only(top: 24.h),
        child: Row(
          children: [
            BackIcon(isWhite: true),
            Spacer(flex: 2),
            Text(text, style: TextStyles.text14MeduimWhite),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
