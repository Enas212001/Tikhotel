import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/app/guest_drawer.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/generated/l10n.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GuestDrawer(),
      body: Column(
        children: [
          TopWidget(
            search: '',
            title: S.of(context).profile,
            isDashboard: true,
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(16.r),
            child: Container(
              padding: EdgeInsets.all(20.r),
              decoration: containerDecoration(),
              child: Column(
                children: [
                  CustomRequestTextField(label: S.of(context).name),
                  CustomRequestTextField(label: S.of(context).email),
                  CustomRequestTextField(
                    label: S.of(context).country,
                    isList: true,
                  ),
                  CustomRequestTextField(label: S.of(context).phone),
                  CustomRequestTextField(label: S.of(context).cellPhone),
                  SizedBox(height: 100.h),
                  CustomButton(
                    text: S.of(context).save,
                    isPrimary: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
