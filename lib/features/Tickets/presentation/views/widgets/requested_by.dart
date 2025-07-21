import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class RequestTypeCheckbox extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const RequestTypeCheckbox({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<RequestTypeCheckbox> createState() => _RequestTypeCheckboxState();
}

class _RequestTypeCheckboxState extends State<RequestTypeCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = true;
        });
        Future.delayed(const Duration(milliseconds: 500), () {
          widget.onTap();
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
                Future.delayed(const Duration(milliseconds: 150), () {
                  widget.onTap();
                });
              },
              activeColor: AppColors.primary,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
            SizedBox(width: 12.w),
            Text(widget.title, style: TextStyles.text12RegularLightGrey),
          ],
        ),
      ),
    );
  }
}
