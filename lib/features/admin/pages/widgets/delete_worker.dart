import 'package:flutter/material.dart';

import 'delete_widget.dart';

class DeleteWorkerDialog extends StatelessWidget {
  const DeleteWorkerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DeleteWidget(onDelete: () {}, title: 'Worker');
  }
}
