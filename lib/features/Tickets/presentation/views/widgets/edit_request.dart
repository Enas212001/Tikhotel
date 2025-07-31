import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/datum.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'message_replay.dart';
import 'request_text_field.dart';

class EditRequest extends StatelessWidget {
  const EditRequest({
    super.key,
    required this.scrollController,
    required this.ticket,
  });
  final ScrollController scrollController;
  final TicketItem ticket;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: containerDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomRequestTextField(
                  label: S.of(context).requestId,
                  value: ticket.id.toString(),
                ),
                CustomRequestTextField(
                  label: S.of(context).startTime,
                  value: ticket.created,
                  isDate: true,
                ),
                CustomRequestTextField(
                  label: S.of(context).depTime,
                  value: ticket.closed,
                  isDate: true,
                ),
                CustomRequestTextField(
                  label: S.of(context).department,
                  value: ticket.departmentName,
                ),
                CustomRequestTextField(
                  label: S.of(context).vacant,
                  value: ticket.status,
                ),
                CustomRequestTextField(
                  label: S.of(context).problem,
                  value: ticket.problemTopic,
                ),
                CustomRequestTextField(
                  label: S.of(context).status,
                  value: ticket.status,
                  isList: true,
                ),
                CustomRequestTextField(
                  label: S.of(context).worker,
                  value: ticket.workerFname,
                  isList: true,
                ),
                CustomButton(
                  text: S.of(context).save,
                  isPrimary: true,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          MessageReplay(scrollController: scrollController, ticket: ticket),
        ],
      ),
    );
  }
}
