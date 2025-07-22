import 'package:flutter/material.dart';

import 'delete_widget.dart';

class DeleteLocationDialog extends StatelessWidget {
  const DeleteLocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DeleteWidget(onDelete: () {}, title: 'Location');
  }
}
