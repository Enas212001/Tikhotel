import 'package:flutter/material.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';

import 'add_update_page.dart';

class AddDepBody extends StatelessWidget {
  const AddDepBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(label: 'Departmet', isReadOnly: false),
          CustomRequestTextField(label: 'Status', isList: true),
        ],
      ),
      onPressed: () {},
    );
  }
}
