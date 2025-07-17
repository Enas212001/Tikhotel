import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';

import 'add_common_page.dart';

class AddWorkerBody extends StatelessWidget {
  const AddWorkerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddCommonPage(
      child: Column(
        children: [
          CustomRequestTextField(label: ' WorkerName', isReadOnly: false),
          CustomRequestTextField(label: 'Phone Number', isReadOnly: false),
          CustomRequestTextField(label: 'Department', isList: true),
          CustomRequestTextField(label: 'Status', isList: true),
          ListTile(
            title: Text('Allow Whatsapp'),
            trailing: CupertinoSwitch(
              value: true,
              onChanged: (value) {},
              activeColor: AppColors.primary,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
