import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/presentation/manager/department_cubit/department_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'admin_card.dart';
import 'delete_department.dart';

class DepartmentDetailCard extends StatelessWidget {
  const DepartmentDetailCard({super.key, required this.department});
  final DepartmentModel department;
  @override
  Widget build(BuildContext context) {
    return AdminCard(
      onDelete: () {
        showDialog(
          context: context,
          builder: (dialogcontext) => DeleteDepartment(
            id: department.id.toString(),
            parentContext: context,
          ),
        );
      },
      onEdit: () async {
        await context.push(AppRoutes.updateDepartment, extra: department);
        context.read<DepartmentCubit>().fetchDepartments();
      },
      child: Column(
        children: [
          DetailItem(
            title: S.of(context).statusColon,
            value: department.status!.contains('T')
                ? S.of(context).active
                : S.of(context).inactive,
            hasIcon: true,
            image: Assets.imagesFname,
          ),
          DetailItem(
            title: S.of(context).nameColon,
            value: department.name ?? '',
            hasIcon: true,
            image: Assets.imagesDepartment,
          ),
        ],
      ),
    );
  }
}
