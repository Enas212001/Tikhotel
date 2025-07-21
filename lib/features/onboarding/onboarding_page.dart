import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/generated/l10n.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/text_styles.dart';
import 'widget/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 68.h),
              Image.asset(Assets.imagesLogo, height: 65.h, width: 80.w),
              SizedBox(height: 77.h),
              Text(
                S.of(context).welcomeToTicketelApp,
                style: TextStyles.text16primaary,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                S.of(context).chooseUserType,
                style: TextStyles.text14RegularlightGrey,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 150.h),
              CustomButton(
                text: S.of(context).guest,
                isPrimary: true,
                onPressed: () {
                  context.push(AppRoutes.guestLogin);
                },
              ),
              SizedBox(height: 20.h),
              CustomButton(
                text: S.of(context).administrator,
                isPrimary: false,
                onPressed: () {
                  context.push(AppRoutes.adminLogin);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
