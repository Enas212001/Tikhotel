import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/core/utils/widgets/card_detail.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';

class FeedbackCard extends StatelessWidget {
  const FeedbackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Stack(
        children: [
          DetailCard(
            topCard: Column(
              children: [
                DetailItem(
                  hasIcon: true,
                  title: 'Location:',
                  value: '6001 ',
                  image: Assets.imagesLocation,
                ),
                DetailItem(
                  hasIcon: true,
                  title: 'Department:',
                  value: 'Engineering',
                  image: Assets.imagesDepartment,
                ),  
              ],
            ),
            bottomCard: Column(
              children: [
                DetailItem(title: 'Requested by :', value: 'Work order'),
                DetailItem(title: 'Worker :', value: 'Ahmed mohamed'),
                DetailItem(title: 'Close time :', value: '14-7-2025'),
                DetailItem(title: 'Problem :', value: 'Bed leg broken'),
                DetailItem(title: 'Message :', value: 'Bed leg broken'),
              ],
            ),
          ),
          Positioned(
            top: 10.h,
            right: 12.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.newBgColor,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                'New',
                style: TextStyles.text12RegularGrey.copyWith(
                  color: AppColors.newColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
