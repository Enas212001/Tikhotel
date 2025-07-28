import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/features/admin/presentation/manager/topic_cubit/topic_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/delete_widget.dart';
import 'package:ticket_flow/generated/l10n.dart';

class DeleteTopicDialog extends StatelessWidget {
  const DeleteTopicDialog({
    super.key,
    required this.id,
    required this.parentContext,
  });

  final String id;
  final BuildContext parentContext;
  @override
  Widget build(BuildContext context) {
    return DeleteWidget(
      onDelete: () {
        parentContext.read<TopicCubit>().deleteTopic(id: id);
      },
      title: S.of(context).topic,
    );
  }
}
