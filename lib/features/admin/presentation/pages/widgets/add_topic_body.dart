import 'package:flutter/material.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/add_update_page.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';

class AddTopicBody extends StatelessWidget {
  const AddTopicBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(label: 'Topic Name', isReadOnly: false),
          CustomRequestTextField(label: 'SLA', isList: true),
          CustomRequestTextField(label: 'Department', isReadOnly: false),
          CustomRequestTextField(label: 'Status', isList: true),
        ],
      ),
      onPressed: () {},
    );
  }
}
