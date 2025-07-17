import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';

class UpdateCommonPage extends StatelessWidget {
  const UpdateCommonPage({
    super.key,
    required this.child,
    required this.onPressed,
  });
  final Widget child;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: containerDecoration(),
        child: Column(
          children: [
            child,
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
            CustomButton(text: 'Save', isPrimary: true, onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
