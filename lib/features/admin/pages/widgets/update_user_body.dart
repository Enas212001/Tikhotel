import 'package:flutter/material.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';

import 'update_common_page.dart';

class UpdateUserBody extends StatelessWidget {
  const UpdateUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return UpdateCommonPage(
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
        ],
      ),
      onPressed: () {},
    );
  }
}
