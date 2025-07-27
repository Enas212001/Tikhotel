import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';

import 'admin_card.dart';
import 'delete_department.dart';

class DepartmentDetailCard extends StatelessWidget {
  const DepartmentDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminCard(
      onDelete: () {
        showDialog(context: context, builder: (context) => DeleteDepartment());
      },
      onEdit: () {
        context.push(AppRoutes.updateDepartment);
      },
      child: Column(
        children: [
          DetailItem(
            title: 'Status:',
            value: 'Active',
            hasIcon: true,
            image: Assets.imagesFname,
          ),
          DetailItem(
            title: 'Department:',
            value: 'General',
            hasIcon: true,
            image: Assets.imagesDepartment,
          ),
        ],
      ),
    );
  }
}
