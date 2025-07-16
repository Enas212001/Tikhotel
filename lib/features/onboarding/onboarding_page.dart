import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/text_styles.dart';
import 'widget/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 68.h),

              // Logo
              Image.asset(Assets.resourceImagesLogo, height: 65.h, width: 80.w),
              SizedBox(height: 77.h),

              // Welcome Text
              Text(
                'Welcome to Ticketel app',
                style: TextStyles.text16primaary,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),

              // Subtitle
              Text(
                'Please choose to continue as a Guest or an Administrator',
                style: TextStyles.text14RegularlightGrey,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 150.h),

              // Guest Button
              CustomButton(
                text: 'Guest',
                isPrimary: true,
                onPressed: () {
                  context.push(AppRoutes.guestLogin);
                },
              ),
              SizedBox(height: 20.h),

              // Administrator Button
              CustomButton(
                text: 'Administrator',
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
