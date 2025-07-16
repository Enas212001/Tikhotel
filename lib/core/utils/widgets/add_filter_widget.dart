import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/icon_with_title.dart';

class AddFilterWidget extends StatelessWidget {
  const AddFilterWidget({
    super.key,
    required this.title,
    this.onTap,
    this.filterOnTap,
  });
  final String title;
  final VoidCallback? onTap, filterOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconWithTItle(
            onTap: onTap,
            icon: Icon(Icons.add, color: AppColors.primary, size: 16.sp),
            text: title,
          ),
          IconWithTItle(
            icon: SvgPicture.asset(Assets.resourceImagesFilter),
            text: 'Filter',
            onTap: filterOnTap,
          ),
        ],
      ),
    );
  }
}
