import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';

import 'widgets/common_admin_list_view.dart';
import 'widgets/topic_detail_card.dart';

class TopicBody extends StatelessWidget {
  const TopicBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddFilterWidget(
          title: 'Add Topic',
          onTap: () {
            context.push(AppRoutes.addTopic);
          },
        ),
        CommonAdminListView(
          item: (context, index) => TopicDetailCard(),
          itemCount: 10,
        ),
      ],
    );
  }
}
