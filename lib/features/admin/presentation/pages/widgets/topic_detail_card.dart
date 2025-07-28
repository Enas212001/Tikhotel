import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/topic_cubit/topic_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'admin_card.dart';
import 'delete_topic.dart';

class TopicDetailCard extends StatelessWidget {
  const TopicDetailCard({super.key, required this.topic});
  final TopicItem topic;
  @override
  Widget build(BuildContext context) {
    return AdminCard(
      onDelete: () {
        showDialog(
          context: context,
          builder: (dialodContext) => DeleteTopicDialog(
            id: topic.id.toString(),
            parentContext: context,
          ),
        );
      },
      onEdit: () async {
        await context.push(AppRoutes.updateTopic, extra: topic);
        context.read<TopicCubit>().getTopics();
      },
      child: Column(
        children: [
          DetailItem(
            title: S.of(context).topicColon,
            value: topic.topic ?? '',
            hasIcon: true,
            image: Assets.imagesTopic,
          ),
          DetailItem(
            title: S.of(context).statusColon,
            value: topic.status ?? '',
            hasIcon: true,
            image: Assets.imagesFname,
          ),
          DetailItem(
            title: S.of(context).departmentColon,
            value: topic.departmentId.toString(),
            hasIcon: true,
            image: Assets.imagesDepartment,
          ),
        ],
      ),
    );
  }
}
