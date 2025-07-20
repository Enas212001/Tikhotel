import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';

import 'widgets/common_admin_list_view.dart';
import 'widgets/woker_detail_card.dart';

class WorkerBody extends StatelessWidget {
  const WorkerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddFilterWidget(
          title: 'Add Worker',
          onTap: () {
            context.push(AppRoutes.addWorker);
          },
        ),
        CommonAdminListView(item: WokerDetailCard()),
      ],
    );
  }
}
