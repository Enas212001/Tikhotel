import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/features/admin/presentation/manager/problem_cubit/problem_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'delete_widget.dart';

class DeleteProblemDialog extends StatelessWidget {
  const DeleteProblemDialog({
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
        parentContext.read<ProblemCubit>().deleteTopic(id: id);
      },
      title: S.of(context).problem,
    );
  }
}
