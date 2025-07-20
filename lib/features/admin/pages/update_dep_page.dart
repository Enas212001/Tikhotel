import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/update_dep_body.dart';

class UpdateDepPage extends StatelessWidget {
  const UpdateDepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(text: S.of(context).updateDepartment),
            UpdateDepBody(),
          ],
        ),
      ),
    );
  }
}
