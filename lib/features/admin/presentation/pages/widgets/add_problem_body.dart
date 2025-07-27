import 'package:flutter/material.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class AddProblemBody extends StatelessWidget {
  const AddProblemBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(
            label: S.of(context).problemTopic,
            isReadOnly: false,
          ),
          CustomRequestTextField(label: S.of(context).department, isList: true),
          CustomRequestTextField(label: S.of(context).sla, isReadOnly: false),
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
