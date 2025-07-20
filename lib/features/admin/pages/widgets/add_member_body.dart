import 'package:flutter/material.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';

import 'add_update_page.dart';

class AddMemberBody extends StatelessWidget {
  const AddMemberBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(label: 'Title', isReadOnly: false),
          CustomRequestTextField(label: 'Name', isReadOnly: false),
          CustomRequestTextField(label: 'Email', isReadOnly: false),
          CustomRequestTextField(label: 'Status', isList: true),
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
