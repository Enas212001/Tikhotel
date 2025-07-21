import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/card_detail.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/tickets_model/datum.dart';
import 'package:ticket_flow/generated/l10n.dart';

class ClosedWorkOrderCard extends StatelessWidget {
  const ClosedWorkOrderCard({super.key, required this.ticket});
  final Datum ticket;
  @override
  Widget build(BuildContext context) {
    return DetailCard(
      topCard: Column(
        children: [
          DetailItem(
            hasIcon: true,
            title: S.of(context).locationColon,
            value: ticket.locationId.toString(),
            image: Assets.imagesLocation,
          ),
          DetailItem(
            hasIcon: true,
            title: S.of(context).departmentColon,
            value: ticket.departmentId.toString(),
            image: Assets.imagesDepartment,
          ),
        ],
      ),
      bottomCard: Column(
        children: [
          DetailItem(
            title: S.of(context).requestedByColon,
            value: ticket.requestedBy.toString(),
          ),
          DetailItem(title: S.of(context).workerColon, value: ticket.workerId.toString()),
          DetailItem(title: S.of(context).closeTimeColon, value: ticket.closed.toString()),
          DetailItem(
            title: S.of(context).problemColon,
            value: ticket.problemId.toString(),
          ),
          DetailItem(
            title: S.of(context).messageColon,
            value: ticket.message.toString(),
          ),
        ],
      ),
    );
  }
}
