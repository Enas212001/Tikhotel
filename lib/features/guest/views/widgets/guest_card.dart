import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/card_detail.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';

class GuestCard extends StatelessWidget {
  const GuestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: DetailCard(
        topCard: Column(
          children: [
            DetailItem(hasIcon: true, title: 'First Name:', value: 'John'),
            DetailItem(
              title: 'Room:',
              value: '9027',
              image: Assets.resourceImagesRoom,
              hasIcon: true,
            ),
          ],
        ),
        bottomCard: Column(
          children: [
            DetailItem(title: 'Last Name :', value: 'Doe'),
            DetailItem(title: 'Requests :', value: '0'),
          ],
        ),
      ),
    );
  }
}
