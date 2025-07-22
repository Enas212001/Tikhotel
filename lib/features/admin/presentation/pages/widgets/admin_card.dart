import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/edit_or_delete.dart';

class AdminCard extends StatelessWidget {
  const AdminCard({
    super.key,
    required this.child,
    required this.route,
    required this.onDelete,
  });
  final Widget child;
  final String route;
  final VoidCallback onDelete;
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
          EditOrDelete(route: route, onDelete: onDelete),
        ],
      ),
    );
  }
}
