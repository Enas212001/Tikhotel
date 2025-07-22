import 'package:flutter/material.dart';

import 'delete_widget.dart';

class DeleteProblemDialog extends StatelessWidget {
  const DeleteProblemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DeleteWidget(onDelete: () {}, title: 'Problem');
  }
}
