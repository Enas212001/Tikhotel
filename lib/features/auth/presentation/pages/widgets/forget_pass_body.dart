import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';

import 'common_auth_widget.dart';
import 'title_with_text_field.dart';

class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAuthWidget(
      buttonText: 'Send',
      onPressed: () {
        context.push(AppRoutes.adminLogin);
      },
      child: Column(
        children: [
          TitleWithTextField(
            title: 'Mail',
            controller: TextEditingController(),
            hintText: 'Enter your mail',
          ),
        ],
      ),
    );
  }
}
