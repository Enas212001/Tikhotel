import 'package:flutter/material.dart';
import 'package:ticket_flow/features/admin/pages/widgets/delete_widget.dart';

class DeleteDepartment extends StatelessWidget {
  const DeleteDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    return DeleteWidget(onDelete: () {}, title: 'Department');
  }
}
