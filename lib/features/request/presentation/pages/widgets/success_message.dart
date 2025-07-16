import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class SuccessMessage extends StatelessWidget {
  const SuccessMessage({super.key, required this.messageName});
  final String messageName;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(35.r),
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.resourceImagesAdded,
                  width: 50.w,
                  height: 50.h,
                ),
                SizedBox(height: 12.h),
                Text(
                  messageName,
                  style: TextStyles.text14RegularGrey,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
