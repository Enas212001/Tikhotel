import 'package:flutter/material.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';

import 'update_common_page.dart';

class UpdateTopicBody extends StatelessWidget {
  const UpdateTopicBody({super.key});

  @override
  Widget build(BuildContext context) {
    return UpdateCommonPage(
      onPressed: () {},
      child: Column(
        children: [
          CustomRequestTextField(
            label: 'Topic Name',
            isReadOnly: false,
            value: 'Test',
          ),
          CustomRequestTextField(label: 'SLA', isList: true, value: 'sla'),
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
    );
  }
}
