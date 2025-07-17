import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
class CommonAuthWidget extends StatelessWidget {
  const CommonAuthWidget({
    super.key,
    required this.child,
    required this.buttonText,
    required this.onPressed,
  });

  final Widget child;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(18.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 28.h),
                      Image.asset(Assets.imagesLogo),
                      SizedBox(height: 60.h),
                      child,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50.r),
              child: CustomButton(
                text: buttonText,
                isPrimary: true,
                onPressed: onPressed,
              ),
            ),
          ],
        );
      },
    );
  }
}
