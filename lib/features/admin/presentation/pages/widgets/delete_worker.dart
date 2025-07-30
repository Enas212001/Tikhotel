import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/features/admin/presentation/manager/worker_cubit/worker_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'delete_widget.dart';

class DeleteWorkerDialog extends StatelessWidget {
  const DeleteWorkerDialog({
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
        parentContext.read<WorkerCubit>().deleteWorker(id: id);
      },
      title: S.of(context).worker,
    );
  }
}
