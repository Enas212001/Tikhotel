import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/admin/pages/widgets/admin_card.dart';

import 'delete_type.dart';

class RequestTypeCard extends StatelessWidget {
  const RequestTypeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminCard(
      deleteWidget: DeleteTypeDialog(),
      route: AppRoutes.updateRequestType,
      child: DetailItem(
        title: 'Type:',
        value: 'Work Order',
        hasIcon: true,
        image: Assets.imagesLocation,
      ),
    );
  }
}
