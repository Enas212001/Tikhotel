import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';

import 'widgets/update_worker_body.dart';

class UpdateWorkerPage extends StatelessWidget {
  const UpdateWorkerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(text: 'Update Worker'),
          UpdateWorkerBody(),
        ],
      ),
    );
  }
}