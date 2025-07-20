import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/admin/pages/widgets/admin_card.dart';

import 'delete_membber.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminCard(
      deleteWidget: DeleteMemberDialog(),
      route: AppRoutes.updateMember,
      child: Column(
        children: [
          DetailItem(
            title: 'Name:',
            value: 'Tasneem',
            hasIcon: true,
            image: Assets.imagesFname,
          ),
          DetailItem(
            title: 'Status:',
            value: 'Active',
            hasIcon: true,
            image: Assets.imagesLocation,
          ),
          DetailItem(
            title: 'Email:',
            value: 'tasneem@gmail.com',
            hasIcon: true,
            image: Assets.imagesEmail,
          ),
        ],
      ),
    );
  }
}
