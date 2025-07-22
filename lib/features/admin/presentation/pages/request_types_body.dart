import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';

import '../../../../core/utils/app_routes.dart';
import 'widgets/common_admin_list_view.dart';
import 'widgets/request_type_card.dart';

class RequestTypesBody extends StatelessWidget {
  const RequestTypesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddFilterWidget(
          title: 'Add Request Type',
          onTap: () {
            context.push(AppRoutes.addRequestType);
          },
        ),
        CommonAdminListView(
          item: (context, index) => RequestTypeCard(),
          itemCount: 10,
        ),
      ],
    );
  }
}
