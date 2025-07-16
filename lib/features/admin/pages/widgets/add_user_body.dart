import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/utils/widgets/down_arrow.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/title_on_border.dart';

class AddUserBody extends StatelessWidget {
  const AddUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: containerDecoration(),
        child: Column(
          children: [
            TitleOnBorder(onUpload: () {}, title: 'Role', child: DownArrow()),
            CustomRequestTextField(label: 'Email', isReadOnly: false),
            CustomRequestTextField(label: 'Password', isReadOnly: false),
            CustomRequestTextField(label: 'Name', isReadOnly: false),
            CustomRequestTextField(label: 'Department', isReadOnly: false),
            CustomRequestTextField(label: 'Status', isList: true),
            CustomRequestTextField(label: 'Operational', isList: true),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.15.h),
            CustomButton(
              text: 'Save',
              isPrimary: true,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
