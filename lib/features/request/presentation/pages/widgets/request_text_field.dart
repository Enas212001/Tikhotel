import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class CustomRequestTextField extends StatelessWidget {
  const CustomRequestTextField({
    super.key,
    required this.label,
    this.value,
    this.isDate = false,
    this.isList = false,
    this.onPressed,
    this.isReadOnly = true,
  });

  final String? label, value;
  final bool isDate, isList, isReadOnly;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: TextFormField(
        initialValue: value,
        style: TextStyles.text12LightGrey,
        cursorColor: AppColors.primary,
        readOnly: isReadOnly,
        onTap: onPressed,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: ' $label ',
          labelStyle: TextStyles.text12RegularLightGrey,
          border: borderTextField(),
          enabledBorder: borderTextField(),
          focusedBorder: borderTextField(),
          suffixIcon: isList
              ? Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: AppColors.lightGrey,
                )
              : (isDate
                    ? GestureDetector(
                        onTap: onPressed,
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: SvgPicture.asset(Assets.imagesDate),
                        ),
                      )
                    : null),
        ),
      ),
    );
  }

  OutlineInputBorder borderTextField() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: AppColors.border, width: 1.w),
    );
  }
}
