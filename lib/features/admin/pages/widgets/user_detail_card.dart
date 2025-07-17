import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';

import 'admin_details_card.dart';
import 'delete_user.dart';

class UserDetailCard extends StatelessWidget {
  const UserDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminDeatailsCard(
      topCard: Column(
        children: [
          DetailItem(
            title: 'Name:',
            value: 'Tasneem',
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
      bottomCard: Column(
        children: [
          DetailItem(title: 'Email:', value: 'tasneem@gmail.com'),
          DetailItem(title: 'Role:', value: 'Administrator'),
          DetailItem(title: 'Status:', value: 'Active'),
        ],
      ),
      deleteWidget: DeleteUserDialog(
        onDelete: () {
          Navigator.pop(context);
        },
      ),
      route: AppRoutes.updateUser,
    );
  }
}
