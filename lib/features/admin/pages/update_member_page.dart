import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/update_member_body.dart';

class UpdateMemberPage extends StatelessWidget {
  const UpdateMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(text: S.of(context).updateMember),
            UpdateMemberBody(),
          ],
        ),
      ),
    );
  }
}
