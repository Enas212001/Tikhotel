import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/update_type_body.dart';

class UpdateTypePage extends StatelessWidget {
  const UpdateTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(text: S.of(context).updateRequestType),
            UpdateTypeBody(),
          ],
        ),
      ),
    );
  }
}
