import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class AddWorkerBody extends StatelessWidget {
  const AddWorkerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(
            label: S.of(context).workerName,
            isReadOnly: false,
          ),
          CustomRequestTextField(
            label: S.of(context).phoneNumber,
            isReadOnly: false,
          ),
          CustomRequestTextField(label: S.of(context).department, isList: true),
          CustomRequestTextField(label: S.of(context).status, isList: true),
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
