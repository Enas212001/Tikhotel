import 'package:flutter/material.dart';
import 'package:ticket_flow/features/admin/pages/widgets/update_common_page.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';

class UpdateDepBody extends StatelessWidget {
  const UpdateDepBody({super.key});

  @override
  Widget build(BuildContext context) {
    return UpdateCommonPage(
      child: Column(
        children: [
          CustomRequestTextField(
            label: 'Department',
            isReadOnly: false,
            value: 'General',
          ),
          CustomRequestTextField(
            label: 'Status',
            isList: true,
            value: 'Active',
          ),
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
