import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class IconWithTItle extends StatelessWidget {
  const IconWithTItle({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });
  final String text;
  final Widget icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          SizedBox(width: 4.w),
          Text(text, style: TextStyles.text12MediumPrimary),
        ],
      ),
    );
  }
}
