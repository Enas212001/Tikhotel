import 'package:flutter/material.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';

import 'add_update_page.dart';

class AddProblemBody extends StatelessWidget {
  const AddProblemBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(label: 'Problem Topic', isReadOnly: false),
          CustomRequestTextField(label: 'Department', isList: true),
          CustomRequestTextField(label: 'SLA', isReadOnly: false),
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
