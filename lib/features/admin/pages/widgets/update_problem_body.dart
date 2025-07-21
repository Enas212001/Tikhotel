import 'package:flutter/material.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';

import 'add_update_page.dart';

class UpdateProblemBody extends StatelessWidget {
  const UpdateProblemBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(
            label: 'Problem Topic',
            isReadOnly: false,
            value: '1st floor ceiling painting',
          ),
          CustomRequestTextField(
            label: 'Department',
            isList: true,
            value: 'Painting',
          ),
          CustomRequestTextField(
            label: 'SLA',
            isReadOnly: false,
            value: '1 day',
          ),
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
