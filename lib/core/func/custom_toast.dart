import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: AppColors.scaffoldBackgroundColor,
    textColor: AppColors.primary,
    fontSize: 16.sp,
  );
}
