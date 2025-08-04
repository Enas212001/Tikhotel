import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/refactor_date.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/core/utils/widgets/card_detail.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/datum.dart';
import 'package:ticket_flow/generated/l10n.dart';

class FeedbackCard extends StatelessWidget {
  const FeedbackCard({super.key, required this.ticket});
  final TicketItem ticket;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Stack(
        children: [
          DetailCard(
            date: refactorDateWithTime(ticket.created.toString()),
            topCard: Column(
              children: [
                DetailItem(
                  hasIcon: true,
                  title: S.of(context).locationColon,
                  value: ticket.locationName ?? '',
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
                  value: ticket.workerFname ?? '',
                ),
                DetailItem(
                  title: S.of(context).closeTimeColon,
                  value: refactorDateWithTime(ticket.closed.toString()),
                ),
                DetailItem(
                  title: S.of(context).problemColon,
                  value: ticket.problemTopic ?? '',
                ),
                DetailItem(
                  title: S.of(context).messageColon,
                  value: ticket.message ?? '',
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.h,
            right: 12.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.newBgColor,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                ticket.status.toString(),
                style: TextStyles.text12RegularGrey.copyWith(
                  color: AppColors.newColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
