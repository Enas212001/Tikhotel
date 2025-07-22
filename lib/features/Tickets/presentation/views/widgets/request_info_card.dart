import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/datum.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'request_text.dart';
import 'ticket_shape_border.dart';
import 'top_request_text.dart';

class RequestInfoCard extends StatelessWidget {
  const RequestInfoCard({super.key, required this.ticket});
  final Datum ticket;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.requestDetails);
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 20.w) +
            EdgeInsets.only(bottom: 16.h),
        child: Material(
          color: AppColors.ticket,
          shape: TicketShapeBorder(
            borderRadius: 12.r,
            notchRadius: 16.r, // adjust as needed
          ),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top bar
              Container(
                height: 40.h,
                padding: EdgeInsets.only(top: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TopText(text: S.of(context).location),
                        TopText(text: ticket.locationName.toString()),
                      ],
                    ),
                    Column(
                      children: [
                        TopText(text: S.of(context).requestedBy),
                        TopText(text: ticket.requestedBy.toString()),
                      ],
                    ),
                    Column(
                      children: [
                        TopText(text: S.of(context).guest),
                        TopText(text: ticket.status.toString()),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 10.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RequestText(text: S.of(context).department),
                          RequestText(text: S.of(context).worker),
                          RequestText(text: S.of(context).startTime),
                          RequestText(text: S.of(context).depTime),
                          RequestText(text: S.of(context).problem),
                          RequestText(text: S.of(context).message),
                        ],
                      ),
                    ),
                    // Right column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RequestText(text: ticket.departmentId.toString()),
                          RequestText(text: ticket.workerFname.toString()),
                          RequestText(text: ticket.created.toString()),
                          RequestText(text: ticket.closed.toString()),
                          RequestText(text: ticket.problemTopic.toString()),
                          RequestText(text: ticket.message.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
