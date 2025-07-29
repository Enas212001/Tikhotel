import 'package:flutter/material.dart';
import 'package:ticket_flow/core/func/refactor_date.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/card_detail.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/datum.dart';
import 'package:ticket_flow/generated/l10n.dart';

class ClosedWorkOrderCard extends StatelessWidget {
  const ClosedWorkOrderCard({super.key, required this.ticket});
  final TicketItem ticket;
  @override
  Widget build(BuildContext context) {
    return DetailCard(
      date: refactorDateWithTime(ticket.created.toString()),
      topCard: Column(
        children: [
          DetailItem(
            hasIcon: true,
            title: S.of(context).locationColon,
            value: ticket.locationName.toString(),
            image: Assets.imagesLocation,
          ),
          DetailItem(
            hasIcon: true,
            title: S.of(context).departmentColon,
            value: ticket.departmentName ?? '',
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
          DetailItem(
            title: S.of(context).workerColon,
            value: ticket.workerFname.toString(),
          ),
          DetailItem(
            title: S.of(context).closeTimeColon,
            value: refactorDateWithTime(ticket.closed.toString()),
          ),
          DetailItem(
            title: S.of(context).problemColon,
            value: ticket.problemTopic.toString(),
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
