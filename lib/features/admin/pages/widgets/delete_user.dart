import 'package:flutter/material.dart';

import 'delete_widget.dart';

class DeleteUserDialog extends StatelessWidget {
  final VoidCallback onDelete;
  const DeleteUserDialog({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return DeleteWidget(onDelete: onDelete, title: 'User');
  }
}
