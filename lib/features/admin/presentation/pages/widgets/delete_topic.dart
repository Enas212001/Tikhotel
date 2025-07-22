import 'package:flutter/material.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/delete_widget.dart';

class DeleteTopicDialog extends StatelessWidget {
  const DeleteTopicDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DeleteWidget(
      onDelete: () {
        Navigator.pop(context);
      },
      title: 'Topic',
    );
  }
}
