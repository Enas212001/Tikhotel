import 'package:flutter/material.dart';

import 'delete_widget.dart';

class DeleteTypeDialog extends StatelessWidget {
  const DeleteTypeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DeleteWidget(onDelete: () {}, title: 'Request Type');
  }
}
