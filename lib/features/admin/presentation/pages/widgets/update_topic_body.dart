import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/topic_cubit/topic_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class UpdateTopicBody extends StatelessWidget {
  const UpdateTopicBody({super.key, required this.topic});
  final TopicItem topic;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TopicCubit>();
    return BlocConsumer<TopicCubit, TopicState>(
      listener: (context, state) {
        if (state is TopicEdited) {
          context.pop();
        } else if (state is TopicEditingError) {
          showToast(state.error);
          log(state.error);
        } else if (state is TopicEditing) {
          Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        return AddOrUpdatePage(
          onPressed: () {
            cubit.editTopic(id: topic.id.toString());
          },
          child: Column(
            children: [
              CustomRequestTextField(
                label: S.of(context).topicName,
                isReadOnly: false,
                value: topic.topic ?? '',
                onChanged: (value) {
                  cubit.topicEditController.text = value;
                },
              ),
              CustomRequestTextField(
                label: S.of(context).sla,
                isReadOnly: false,
                value: topic.sla?.toString() ?? '0',
                onChanged: (value) {
                  cubit.slaEditController.text = value;
                },
              ),
              CustomRequestTextField(
                label: S.of(context).department,
                isReadOnly: false,
                value: topic.departmentId?.toString() ?? '',
                onChanged: (value) {
                  cubit.departmentEditController.text = value;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
