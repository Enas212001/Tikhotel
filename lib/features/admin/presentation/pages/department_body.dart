import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/presentation/manager/department_cubit/department_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/department_card.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/common_admin_list_view.dart';

class DepartmentBody extends StatelessWidget {
  const DepartmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DepartmentCubit, DepartmentState>(
      listener: (context, state) {
        if (state is DepartmentDeleted) {
          context.read<DepartmentCubit>().fetchDepartments();
          context.pop();
        }
      },
      child: Column(
        children: [
          AddFilterWidget(
            title: S.of(context).addDepartment,
            onTap: () async {
              await context.push(AppRoutes.addDepartment);
              context.read<DepartmentCubit>().fetchDepartments();
            },
          ),
          BlocBuilder<DepartmentCubit, DepartmentState>(
            builder: (context, state) {
              if (state is DepartmentFetchLoading) {
                return const ShimmerLoadingList();
              } else if (state is DepartmentFetchFailure) {
                log(state.message);
                return Center(child: Text(state.message));
              } else if (state is DepartmentFetchSuccess) {
                return CommonAdminListView(
                  item: (context, index) => DepartmentDetailCard(
                    department: state.departments[index],
                  ),
                  itemCount: state.departments.length,
                );
              }
              return ShimmerLoadingList();
            },
          ),
        ],
      ),
    );
  }
}
