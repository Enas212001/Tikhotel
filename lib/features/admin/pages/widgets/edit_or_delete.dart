import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/assets.dart';

class EditOrDelete extends StatelessWidget {
  const EditOrDelete({
    super.key,
    required this.route,
    required this.deleteWidget,
  });
  final String route;
  final Widget deleteWidget;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12.h,
      right: 16.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.push(route);
            },
            child: SvgPicture.asset(
              Assets.imagesEdit,
              width: 22.sp,
              height: 22.sp,
            ),
          ),
          SizedBox(width: 4.w),
          GestureDetector(
            onTap: () {
              showDialog(context: context, builder: (context) => deleteWidget);
            },
            child: SvgPicture.asset(
              Assets.imagesDelete,
              width: 22.sp,
              height: 22.sp,
            ),
          ),
        ],
      ),
    );
  }
}
