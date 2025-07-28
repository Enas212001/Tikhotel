import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/topic_cubit/topic_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/update_topic_body.dart';

class UpdateTopic extends StatelessWidget {
  const UpdateTopic({super.key, required this.topic});
  final TopicItem topic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TopicCubit(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(text: S.of(context).updateTopic),
              UpdateTopicBody(topic: topic),
            ],
          ),
        ),
      ),
    );
  }
}
