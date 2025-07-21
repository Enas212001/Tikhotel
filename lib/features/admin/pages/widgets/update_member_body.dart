import 'package:flutter/material.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';

import 'add_update_page.dart';

class UpdateMemberBody extends StatelessWidget {
  const UpdateMemberBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(
            label: 'Title',
            isReadOnly: false,
            value: 'Mrs.',
          ),
          CustomRequestTextField(
            label: 'Name',
            isReadOnly: false,
            value: 'Tasneem',
          ),
          CustomRequestTextField(
            label: 'Email',
            isReadOnly: false,
            value: 'tasneem@gmail.com',
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
