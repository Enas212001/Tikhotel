import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/generated/l10n.dart';

class DashboardItem extends StatelessWidget {
  final String title;
  final String asset;
  final int number;
  final double percent;
  final bool isUp;

  const DashboardItem({
    super.key,
    required this.title,
    required this.asset,
    required this.number,
    required this.percent,
    this.isUp = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.r),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyles.text12RegularLightGrey),
              SvgPicture.asset(asset, width: 20.w, height: 20.h),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            number.toString(),
            style: TextStyles.text12MediumPrimary.copyWith(
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              SvgPicture.asset(Assets.imagesTrending),
              SizedBox(width: 6.w),
              Text(
                '${percent.toStringAsFixed(1)}%',
                style: TextStyles.text12RegularGrey.copyWith(
                  color: AppColors.percent,
                ),
              ),
              Text(S.of(context).upToday, style: TextStyles.text12RegularGrey),
            ],
          ),
        ],
      ),
    );
  }
}
