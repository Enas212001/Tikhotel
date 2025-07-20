import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'common_auth_widget.dart';
import 'title_with_text_field.dart';

class GuestLoginBody extends StatelessWidget {
  const GuestLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAuthWidget(
      buttonText: S.of(context).login,
      onPressed: () {
        // Guest login logic
      },
      child: Column(
        children: [
          TitleWithTextField(
            title: S.of(context).roomNumber,
            controller: TextEditingController(),
            hintText: S.of(context).enterYourRoomNumber,
          ),
          SizedBox(height: 16.h),
          TitleWithTextField(
            title: S.of(context).firstName,
            controller: TextEditingController(),
            hintText: S.of(context).enterYourFirstName,
          ),
        ],
      ),
    );
  }
}
