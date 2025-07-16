import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/card_detail.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';

class ClosedWorkOrderCard extends StatelessWidget {
  const ClosedWorkOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DetailCard(
      topCard: Column(
        children: [
          DetailItem(
            hasIcon: true,
            title: 'Location:',
            value: '6001 ',
            image: Assets.resourceImagesLocation,
          ),
          DetailItem(
            hasIcon: true,
            title: 'Department:',
            value: 'Engineering',
            image: Assets.resourceImagesDepartment,
          ),
        ],
      ),
      bottomCard: Column(
        children: [
          DetailItem(title: 'Requested by :', value: 'Work order'),
          DetailItem(title: 'Worker :', value: 'Ahmed mohamed'),
          DetailItem(title: 'Close time :', value: '14-7-2025'),
          DetailItem(title: 'Problem :', value: 'Bed leg broken'),
          DetailItem(title: 'Message :', value: 'Bed leg broken'),
        ],
      ),
    );
  }
}
