import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/generated/l10n.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
    this.search = '',
    required this.title,
    this.noSearchBar = false,
    this.onChanged,
    this.controller,
  });
  final String title, search;
  final bool noSearchBar;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
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
          noSearchBar
              ? SizedBox()
              : SizedBox(
                  height: 40.h,
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    cursorColor: AppColors.primary,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.lightGrey,
                        size: 24.sp,
                      ),
                      filled: true,
                      fillColor: AppColors.scaffoldBackgroundColor,
                      hintText: S.of(context).search,
                      hintStyle: TextStyles.text12RegularLightGrey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
          SizedBox(height: noSearchBar ? 0 : 10.h),
        ],
      ),
    );
  }
}
