import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/edit_or_delete.dart';

class AdminCard extends StatelessWidget {
  const AdminCard({
    super.key,
    required this.child,
    required this.onDelete,
    required this.onEdit,
  });
  final Widget child;
  final VoidCallback onDelete, onEdit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            decoration: containerDecoration(),
            child: child,
          ),
          EditOrDelete(onEdit: onEdit, onDelete: onDelete),
        ],
      ),
    );
  }
}
