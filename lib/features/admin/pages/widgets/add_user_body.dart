import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/down_arrow.dart';
import 'package:ticket_flow/features/admin/pages/widgets/add_common_page.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/title_on_border.dart';

class AddUserBody extends StatelessWidget {
  const AddUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddCommonPage(
      child: Column(
        children: [
          TitleOnBorder(onUpload: () {}, title: 'Role', child: DownArrow()),
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
