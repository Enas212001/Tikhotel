import 'package:flutter/material.dart';
import 'package:ticket_flow/generated/l10n.dart';
import 'widgets/add_request_body.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';

class AddRequestPage extends StatelessWidget {
  const AddRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(text: S.of(context).addRequest),
            AddRequestBody(),
          ],
        ),
      ),
    );
  }
}
