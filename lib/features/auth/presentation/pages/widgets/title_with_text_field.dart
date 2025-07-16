import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

import 'custom_text_field.dart';

class TitleWithTextField extends StatelessWidget {
  const TitleWithTextField({
    super.key,
    required this.title,
    required this.controller,
    this.hintText,
    this.isPassword = false,
  });
  final String title;
  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.text14RegularGrey),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller,
          title: title,
          hintText: hintText,
          isPassword: isPassword,
        ),
      ],
    );
  }
}
