import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/features/admin/presentation/manager/request_type_cubit/request_type_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'delete_widget.dart';

class DeleteTypeDialog extends StatelessWidget {
  final String id;
  final BuildContext parentContext;
  const DeleteTypeDialog({
    super.key,
    required this.id,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    return DeleteWidget(
      onDelete: () {
        parentContext.read<RequestTypeCubit>().deleteRequestType(id);
      },
      title: S.of(context).requestType,
    );
  }
}
