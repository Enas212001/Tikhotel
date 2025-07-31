import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/location_cubit/location_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/admin_card.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'delete_location.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.location});
  final LocationItem location;
  @override
  Widget build(BuildContext context) {
    return AdminCard(
      onDelete: () {
        showDialog(
          context: context,
          builder: (dialogContext) => DeleteLocationDialog(
            id: location.id.toString(),
            parentContext: context,
          ),
        );
      },
      onEdit: () async {
        await context.push(AppRoutes.updateLocation, extra: location);
        context.read<LocationCubit>().getLocations();
      },
      child: Column(
        children: [
          DetailItem(
            title: S.of(context).locationColon,
            value: location.location ?? '',
            hasIcon: true,
            image: Assets.imagesTopic,
          ),
          DetailItem(
            title: S.of(context).statusColon,
            value: location.status!.contains('T')
                ? S.of(context).active
                : S.of(context).inactive,
            hasIcon: true,
            image: Assets.imagesFname,
          ),
        ],
      ),
    );
  }
}
