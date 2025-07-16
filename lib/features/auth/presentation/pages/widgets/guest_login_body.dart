import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_auth_widget.dart';
import 'title_with_text_field.dart';

class GuestLoginBody extends StatelessWidget {
  const GuestLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAuthWidget(
      buttonText: 'Login',
      onPressed: () {
        // Guest login logic
      },
      child: Column(
        children: [
          TitleWithTextField(
            title: 'Room Number',
            controller: TextEditingController(),
            hintText: 'Enter your Room number',
          ),
          SizedBox(height: 16.h),
          TitleWithTextField(
            title: 'First Name',
            controller: TextEditingController(),
            hintText: 'Enter your First Name',
          ),
        ],
      ),
    );
  }
}
