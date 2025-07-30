import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class FormWithTitle extends StatelessWidget {
  const FormWithTitle({
    super.key,
    required this.title,
    this.child,
    this.onPressed,
    this.buttonText = 'Generate',
  });
  final String title, buttonText;
  final Widget? child;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: containerDecoration(),
      child: Column(
        children: [
          Text(title, style: TextStyles.text14RegularGrey),
          SizedBox(height: 12.h),
          child ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
