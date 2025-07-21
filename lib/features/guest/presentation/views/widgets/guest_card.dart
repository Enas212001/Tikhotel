import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/card_detail.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/guest/data/models/guest_model/guest_model.dart';
import 'package:ticket_flow/generated/l10n.dart';

class GuestCard extends StatelessWidget {
  const GuestCard({super.key, required this.guest});
  final GuestModel guest;
  @override
  Widget build(BuildContext context) {
    String refactorDate(String? dateStr) {
      if (dateStr == null || dateStr == 'N/A') return 'N/A';
      final dateTime = DateTime.tryParse(dateStr);
      if (dateTime == null) return dateStr;
      return '${dateTime.year.toString().padLeft(4, '0')}-'
          '${dateTime.month.toString().padLeft(2, '0')}-'
          '${dateTime.day.toString().padLeft(2, '0')},'
          '${dateTime.hour.toString().padLeft(2, '0')}:'
          '${dateTime.minute.toString().padLeft(2, '0')}';
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: DetailCard(
        date: refactorDate(guest.lastLogin),
        topCard: Column(
          children: [
            DetailItem(
              hasIcon: true,
              title: S.of(context).firstNameColon,
              value: guest.fname!,
            ),
            DetailItem(
              title: S.of(context).roomColon,
              value: guest.room.toString(),
              image: Assets.imagesRoom,
              hasIcon: true,
            ),
          ],
        ),
        bottomCard: Column(
          children: [
            DetailItem(title: S.of(context).lastNameColon, value: guest.name!),
            DetailItem(
              title: S.of(context).requestsColon,
              value: guest.ticketCount.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
