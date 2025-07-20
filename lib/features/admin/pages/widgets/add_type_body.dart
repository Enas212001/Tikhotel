import 'package:flutter/material.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';

import 'add_update_page.dart';

class AddTypeBody extends StatelessWidget {
  const AddTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(label: 'Request Type', isReadOnly: false),
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}