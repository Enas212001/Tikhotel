import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    this.hasIcon = false,
    this.image,
    required this.title,
    required this.value,
  });
  final bool hasIcon;
  final String? image;
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110.w,
            child: Row(
              children: [
                if (hasIcon)
                  SvgPicture.asset(
                    image ?? Assets.imagesFname,
                    width: 18.w,
                    height: 18.h,
                  ),
                SizedBox(width: 5.w),
                Text(title, style: TextStyles.text12RegularDarkGrey),
              ],
            ),
          ),
          Expanded(
            child: Text(value, style: TextStyles.text12RegularLightGrey),
          ),
        ],
      ),
    );
  }
}
