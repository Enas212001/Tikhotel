import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';

import 'delete_user.dart';

class UpdateUserBody extends StatelessWidget {
  const UpdateUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: containerDecoration(),
        child: Column(
          children: [
            CustomRequestTextField(
              label: 'Role',
              isList: true,
              value: 'Administrator',
            ),
            CustomRequestTextField(
              label: 'Email',
              isReadOnly: false,
              value: 'Ali@gmail.com',
            ),
            CustomRequestTextField(
              label: 'Password',
              isReadOnly: false,
              value: '123456',
            ),
            CustomRequestTextField(
              label: 'Name',
              isReadOnly: false,
              value: 'Ali',
            ),
            CustomRequestTextField(
              label: 'Department',
              isReadOnly: false,
              value: 'IT',
            ),
            CustomRequestTextField(
              label: 'Status',
              isList: true,
              value: 'Active',
            ),
            CustomRequestTextField(
              label: 'Registration Date',
              isReadOnly: false,
              value: '22-2-2025',
            ),
            CustomRequestTextField(
              label: 'IP Address',
              isReadOnly: false,
              value: '192.1.34.345',
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05.h),
            CustomButton(
              text: 'Save',
              isPrimary: true,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => DeleteUserDialog(onDelete: () {
                      Navigator.pop(context);
                    }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
