import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key, this.isWhite});
  final bool? isWhite;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: isWhite == true ? AppColors.white : AppColors.grey,
        size: 16.r,
      ),
    );
  }
}
