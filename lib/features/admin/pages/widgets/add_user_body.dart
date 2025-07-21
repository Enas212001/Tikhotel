import 'package:flutter/material.dart';
import 'package:ticket_flow/features/admin/pages/widgets/add_update_page.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';

class AddUserBody extends StatelessWidget {
  const AddUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(label: 'Role', isList: true),
          CustomRequestTextField(label: 'Email', isReadOnly: false),
          CustomRequestTextField(label: 'Password', isReadOnly: false),
          CustomRequestTextField(label: 'Name', isReadOnly: false),
          CustomRequestTextField(label: 'Department', isReadOnly: false),
          CustomRequestTextField(label: 'Status', isList: true),
          CustomRequestTextField(label: 'Operational', isList: true),
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
