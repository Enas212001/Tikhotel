import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/card_detail.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/worker_cubit/worker_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/delete_worker.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'edit_or_delete.dart';
import 'switch_detail.dart';

class WokerDetailCard extends StatelessWidget {
  const WokerDetailCard({super.key, required this.worker});
  final WorkerItem worker;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Stack(
        children: [
          DetailCard(
            date: '',
            topCard: Column(
              children: [
                DetailItem(
                  title: S.of(context).nameColon,
                  value: worker.fname ?? '',
                  hasIcon: true,
                  image: Assets.imagesFname,
                ),
                SwitchDetail(
                  title: S.of(context).statusColon,
                  hasIcon: true,
                  image: Assets.imagesDepartment,
                  value: worker.status!.contains("T") ? true : false,
                ),
              ],
            ),
            bottomCard: Column(
              children: [
                DetailItem(
                  title: S.of(context).phoneNumberColon,
                  value: worker.phone.toString(),
                ),
                DetailItem(
                  title: S.of(context).departmentColon,
                  value: worker.departmentName ?? '',
                ),
                SwitchDetail(
                  title: S.of(context).allowWhatsapp,
                  value: worker.stWhatsapp == 1 ? true : false,
                ),
              ],
            ),
          ),
          EditOrDelete(
            onEdit: () {
              context.push(AppRoutes.updateWorker, extra: worker);
              context.read<WorkerCubit>().getWorkers();
            },
            onDelete: () {
              showDialog(
                context: context,
                builder: (dialogContext) => DeleteWorkerDialog(
                  parentContext: context,
                  id: worker.id.toString(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
