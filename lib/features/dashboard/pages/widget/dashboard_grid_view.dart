import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/assets.dart';

import 'dashboard_item.dart';

class DashboardGridView extends StatelessWidget {
  const DashboardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10.r),
        childAspectRatio: 1.3,
        children: const [
          DashboardItem(
            title: 'New Requests',
            asset: Assets.imagesNewRequest,
            number: 24,
            percent: 8.5,
            isUp: true,
          ),
          DashboardItem(
            title: 'Pending Requests',
            asset: Assets.imagesPendingRequest,
            number: 12,
            percent: 3.2,
            isUp: false,
          ),
          DashboardItem(
            title: 'Active Requests',
            asset: Assets.imagesPendingRequest,
            number: 40,
            percent: 5.1,
            isUp: false,
          ),
          DashboardItem(
            title: 'Closed Requests',
            asset: Assets.imagesNewRequest,
            number: 2,
            percent: 1.0,
            isUp: true,
          ),
        ],
      ),
    );
  }
}
