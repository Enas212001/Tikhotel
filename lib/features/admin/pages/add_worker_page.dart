import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';

import 'widgets/add_worker_body.dart';

class AddWorkerPage extends StatelessWidget {
  const AddWorkerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(text: 'Add Worker'),
          AddWorkerBody(),
        ],
      ),
    );
  }
}
