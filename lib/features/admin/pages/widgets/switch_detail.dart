import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class SwitchDetail extends StatelessWidget {
  const SwitchDetail({
    super.key,
    required this.title,
    this.hasIcon = false,
    this.image,
  });
  final String title;
  final bool hasIcon;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120.w,
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
        CupertinoSwitch(
          value: true,
          activeColor: AppColors.primary,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
