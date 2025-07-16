import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/card_detail.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';

class UserDetailCard extends StatelessWidget {
  const UserDetailCard({super.key});

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
                  title: 'Name:',
                  value: 'Tasneem',
                  hasIcon: true,
                  image: Assets.resourceImagesFname,
                ),
                DetailItem(
                  title: 'Department:',
                  value: 'General',
                  hasIcon: true,
                  image: Assets.resourceImagesDepartment,
                ),
              ],
            ),
            bottomCard: Column(
              children: [
                DetailItem(title: 'Email:', value: 'tasneem@gmail.com'),
                DetailItem(title: 'Role:', value: 'Administrator'),
                DetailItem(title: 'Status:', value: 'Active'),
              ],
            ),
          ),
          Positioned(
            top: 12.h,
            right: 16.w,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    Assets.resourceImagesEdit,
                    width: 22.sp,
                    height: 22.sp,
                  ),
                ),
                SizedBox(width: 4.w),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    Assets.resourceImagesDelete,
                    width: 22.sp,
                    height: 22.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
