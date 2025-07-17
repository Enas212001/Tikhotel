import 'package:flutter/material.dart';

import 'delete_widget.dart';

class DeleteMemberDialog extends StatelessWidget {
  const DeleteMemberDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DeleteWidget(onDelete: () {}, title: 'Member');
  }
}
