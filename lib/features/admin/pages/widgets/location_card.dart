import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/admin/pages/widgets/admin_card.dart';

import 'delete_location.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminCard(
      deleteWidget: DeleteLocationDialog(),
      route: AppRoutes.updateLocation,
      child: Column(
        children: [
          DetailItem(
            title: 'Location:',
            value: '1002',
            hasIcon: true,
            image: Assets.imagesTopic,
          ),
          DetailItem(
            title: 'Status:',
            value: 'Active',
            hasIcon: true,
            image: Assets.imagesFname,
          ),
        ],
      ),
    );
  }
}
