import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';

import 'widgets/common_admin_list_view.dart';
import 'widgets/location_card.dart';

class LocationBody extends StatelessWidget {
  const LocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddFilterWidget(
          title: 'Add Location',
          onTap: () {
            context.push(AppRoutes.addLocation);
          },
        ),
        CommonAdminListView(
          item: (context, index) => LocationCard(),
          itemCount: 10,
        ),
      ],
    );
  }
}
