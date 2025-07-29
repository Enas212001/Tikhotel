import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/assets.dart';

class EditOrDelete extends StatelessWidget {
  const EditOrDelete({super.key, required this.onDelete, required this.onEdit});
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12.h,
      right: 8.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: onEdit,
            child: SvgPicture.asset(
              Assets.imagesEdit,
              width: 18.sp,
              height: 18.sp,
            ),
          ),
          SizedBox(width: 4.w),
          GestureDetector(
            onTap: onDelete,
            child: SvgPicture.asset(
              Assets.imagesDelete,
              width: 18.sp,
              height: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
