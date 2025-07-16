import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class FileUpload extends StatelessWidget {
  const FileUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: AppColors.upload,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: SvgPicture.asset(Assets.resourceImagesUpload),
        ),
        SizedBox(height: 8.h),
        Text('Choose files', style: TextStyles.text12LightGrey),
      ],
    );
  }
}
