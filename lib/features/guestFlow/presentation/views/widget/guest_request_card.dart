import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/ticket_shape_border.dart';
import 'package:ticket_flow/features/guestFlow/data/models/guest_ticket_model/guest_ticket_item.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'doted_line_border.dart';
import 'request_item_guest.dart';

class GuestRequestCard extends StatelessWidget {
  const GuestRequestCard({super.key, required this.ticketModel});
  final GuestTicketItem ticketModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.push(AppRoutes.viewRequestGuestPage, extra: ticketModel),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 20.w) +
            EdgeInsets.only(bottom: 16.h),
        child: CustomPaint(
          painter: DottedTicketBorderPainter(
            borderRadius: 12.r,
            notchRadius: 16.r,
            color: AppColors.primary,
          ),
          child: Material(
            color: AppColors.ticket,
            shape: TicketShapeBorder(borderRadius: 12.r, notchRadius: 16.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: CustomPaint(
                          painter: DottedLinePainter(
                            color: AppColors.primary,
                            startFraction: 0.30.w,
                            endFraction: 0.62.w,
                            showEdgeRhombus: true, // ✅ enables diamond markers
                            rhombusSize: 8.0, // ✅ diamond size
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RequestItemGuest(
                            title: S.of(context).requestId,
                            data: ticketModel.id.toString(),
                            width: 100.w,
                          ),
                          RequestItemGuest(
                            title: S.of(context).status,
                            data: ticketModel.status == 'In Progress'
                                ? S.of(context).accepted
                                : ticketModel.status == 'RepliedByClient'
                                ? S.of(context).repliedByGuest
                                : ticketModel.status == 'Closed'
                                ? S.of(context).closed
                                : ticketModel.status == 'RepliedBySupport'
                                ? S.of(context).repliedByDep
                                : ticketModel.status == 'ClosedWithFeedback'
                                ? S.of(context).closed
                                : ticketModel.status == 'Hold'
                                ? S.of(context).hold
                                : ticketModel.status == 'New'
                                ? S.of(context).neW
                                : '',
                            width: 100.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    height: 1,
                    child: CustomPaint(
                      painter: DottedLinePainter(
                        color: AppColors.upload,
                        startFraction: 0.05.w,
                        endFraction: 0.88.w,
                        showEdgeRhombus: true, // ✅ enables diamond markers
                        rhombusSize: 8.0, // ✅ diamond size
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RequestItemGuest(
                          title: S.of(context).replay,
                          data: ticketModel.message ?? '',
                        ),
                        RequestItemGuest(
                          title: S.of(context).lastReplay,
                          data: ticketModel.ticketFeedback ?? '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
