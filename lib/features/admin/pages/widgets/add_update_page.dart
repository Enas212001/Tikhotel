import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/generated/l10n.dart';

class AddOrUpdatePage extends StatelessWidget {
  const AddOrUpdatePage({
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
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.15.h),
            CustomButton(
              text: S.of(context).save,
              isPrimary: true,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
