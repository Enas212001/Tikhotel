import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/features/admin/presentation/manager/user_cubit/user_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'delete_widget.dart';

class DeleteUserDialog extends StatelessWidget {
  final String id;
  final BuildContext parentContext;
  const DeleteUserDialog({
    super.key,
    required this.id,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    return DeleteWidget(
      onDelete: () {
        parentContext.read<UserCubit>().deleteUser(id);
      },
      title: S.of(context).user,
    );
  }
}
