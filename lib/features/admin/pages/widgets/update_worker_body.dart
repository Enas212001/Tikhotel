import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';

import 'update_common_page.dart';

class UpdateWorkerBody extends StatelessWidget {
  const UpdateWorkerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return UpdateCommonPage(
      child: Column(
        children: [
          CustomRequestTextField(
            label: ' WorkerName',
            isReadOnly: false,
            value: 'Tasneem',
          ),
          CustomRequestTextField(
            label: 'Phone Number',
            isReadOnly: false,
            value: '01246534',
          ),
          CustomRequestTextField(
            label: 'Department',
            isList: true,
            value: 'Department 1',
          ),
          CustomRequestTextField(
            label: 'Status',
            isList: true,
            value: 'Active',
          ),
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
