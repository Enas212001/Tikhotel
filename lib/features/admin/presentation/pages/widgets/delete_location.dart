import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/features/admin/presentation/manager/location_cubit/location_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'delete_widget.dart';

class DeleteLocationDialog extends StatelessWidget {
  const DeleteLocationDialog({
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
        parentContext.read<LocationCubit>().deleteLocation(id: id);
      },
      title: S.of(context).location,
    );
  }
}
