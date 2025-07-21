import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({
    super.key,
    required this.value,
    required this.label,
    this.isReadOnly = false,
  });
  final String value, label;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 3,
      maxLines: 3,
      initialValue: value,
      style: TextStyles.text12LightGrey,
      cursorColor: AppColors.primary,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyles.text12LightGrey,
        border: borderTextField(),
        enabledBorder: borderTextField(),
        focusedBorder: borderTextField(),
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
