import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/card_detail.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/delete_worker.dart';

import 'edit_or_delete.dart';
import 'switch_detail.dart';

class WokerDetailCard extends StatelessWidget {
  const WokerDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Stack(
        children: [
          DetailCard(
            date: '1/1/2025',
            topCard: Column(
              children: [
                DetailItem(
                  title: 'Name:',
                  value: 'Tasneem',
                  hasIcon: true,
                  image: Assets.imagesFname,
                ),
                SwitchDetail(
                  title: 'Status:',
                  hasIcon: true,
                  image: Assets.imagesDepartment,
                ),
              ],
            ),
            bottomCard: Column(
              children: [
                DetailItem(title: 'Phone Number:', value: '01246534'),
                SwitchDetail(title: 'Allow Whatsapp'),
              ],
            ),
          ),
          EditOrDelete(
            onEdit: () {
              context.push(AppRoutes.updateWorker);
            },
            onDelete: () {
              showDialog(
                context: context,
                builder: (context) => DeleteWorkerDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
