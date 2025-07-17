import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';

import 'admin_card.dart';
import 'delete_topic.dart';

class TopicDetailCard extends StatelessWidget {
  const TopicDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminCard(
      deleteWidget: DeleteTopicDialog(),
      route: AppRoutes.updateTopic,
      child: Column(
        children: [
          DetailItem(
            title: 'Topic:',
            value: 'Test',
            hasIcon: true,
            image: Assets.imagesTopic,
          ),
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
