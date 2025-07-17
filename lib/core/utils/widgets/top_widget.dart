import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
    required this.search,
    required this.title,
    this.isDashboard = false,
  });
  final String title, search;
  final bool isDashboard;
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
      padding:
          EdgeInsets.symmetric(horizontal: 20.w) + EdgeInsets.only(top: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: SvgPicture.asset(Assets.imagesSetting),
              ),
              Spacer(flex: 2),
              Text(title, style: TextStyles.text14MeduimWhite),
              Spacer(flex: 3),
            ],
          ),
          SizedBox(height: 10.h),
          isDashboard
              ? SizedBox()
              : SizedBox(
                  height: 40.h,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.lightGrey,
                        size: 24.sp,
                      ),
                      filled: true,
                      fillColor: AppColors.white,
                      hintText: 'Search $search',
                      hintStyle: TextStyles.text12RegularLightGrey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
          SizedBox(height: isDashboard ? 0 : 10.h),
        ],
      ),
    );
  }
}
