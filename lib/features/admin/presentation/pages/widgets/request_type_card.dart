import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/request_type_cubit/request_type_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/admin_card.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'delete_type.dart';

class RequestTypeCard extends StatelessWidget {
  const RequestTypeCard({super.key, required this.requestType});
  final RequestTypeItem requestType;

  @override
  Widget build(BuildContext context) {
    return AdminCard(
      onDelete: () {
        showDialog(
          context: context,
          builder: (dialogContext) => DeleteTypeDialog(
            id: requestType.newReqId.toString(),
            parentContext: context,
          ),
        );
      },
      onEdit: () async {
        await context.push(AppRoutes.updateRequestType, extra: requestType);
        // Refresh data when returning from update page
        context.read<RequestTypeCubit>().getRequestTypes();
      },
      child: DetailItem(
        title: S.current.typeColon,
        value: requestType.requestType ?? '',
        hasIcon: true,
        image: Assets.imagesLocation,
      ),
    );
  }
}
