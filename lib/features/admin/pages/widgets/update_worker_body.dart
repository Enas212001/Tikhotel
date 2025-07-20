import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class UpdateWorkerBody extends StatelessWidget {
  const UpdateWorkerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(
            label: S.of(context).workerName,
            isReadOnly: false,
            value: 'Tasneem',
          ),
          CustomRequestTextField(
            label: S.of(context).phoneNumber,
            isReadOnly: false,
            value: '01246534',
          ),
          CustomRequestTextField(
            label: S.of(context).department,
            isList: true,
            value: 'Department 1',
          ),
          CustomRequestTextField(
            label: S.of(context).status,
            isList: true,
            value: 'Active',
          ),
          ListTile(
            title: Text(S.of(context).allowWhatsapp),
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
