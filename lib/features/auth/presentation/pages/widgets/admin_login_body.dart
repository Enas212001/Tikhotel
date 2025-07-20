import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'common_auth_widget.dart';
import 'title_with_text_field.dart';
import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';

class AdminLoginBody extends StatelessWidget {
  const AdminLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAuthWidget(
      buttonText: S.of(context).login,
      onPressed: () async {
        final cache = getIt<CacheHelper>();
        await cache.saveData(key: 'admin_logged_in', value: true);
        context.go(AppRoutes.newRequest);
      },
      child: Column(
        children: [
          TitleWithTextField(
            title: S.of(context).email,
            controller: TextEditingController(),
            hintText: S.of(context).enterYourEmail,
          ),
          SizedBox(height: 16.h),
          TitleWithTextField(
            title: S.of(context).password,
            controller: TextEditingController(),
            hintText: S.of(context).enterYourPassword,
            isPassword: true,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                context.push(AppRoutes.forgetPassword);
              },
              child: Text(
                S.of(context).forgotPassword,
                style: TextStyles.text12RegularLightGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
