import 'package:flutter/material.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';

import 'add_update_page.dart';

class AddLocationBody extends StatelessWidget {
  const AddLocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(label: 'Location', isReadOnly: false),
          CustomRequestTextField(
            label: 'Status',
            isList: true,
            isReadOnly: false,
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
