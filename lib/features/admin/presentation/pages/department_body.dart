import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/core/utils/widgets/pagination_controller.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/presentation/manager/department_cubit/department_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/department_card.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/generic_filter_dialog.dart';
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
            filterOnTap: () => showDialog(
              context: context,
              builder: (dialogContext) => GenericFilterDialog(
                filterOptions: [
                  FilterOption(
                    value: 'all',
                    label: S.of(context).all,
                    onTap: () => context
                        .read<DepartmentCubit>()
                        .filterDepartments('all'),
                  ),
                  FilterOption(
                    value: 'active',
                    label: S.of(context).active,
                    onTap: () => context
                        .read<DepartmentCubit>()
                        .filterDepartments('active'),
                  ),
                  FilterOption(
                    value: 'inactive',
                    label: S.of(context).inactive,
                    onTap: () => context
                        .read<DepartmentCubit>()
                        .filterDepartments('inactive'),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<DepartmentCubit, DepartmentState>(
            builder: (context, state) {
              if (state is DepartmentFetchLoading) {
                return const ShimmerLoadingList();
              } else if (state is DepartmentFetchFailure) {
                log(state.message);
                return Center(child: Text(state.message));
              } else if (state is DepartmentFetchSuccess) {
                final totalPages =
                    (state.departments.pagination!.total! /
                            state.departments.pagination!.limit!)
                        .ceil();
                return Column(
                  children: [
                    PaginationControls(
                      currentPage: state.departments.pagination!.page!,
                      totalPages: totalPages,
                      onPageSelected: (page) {
                        context.read<DepartmentCubit>().fetchDepartments(
                          page: page,
                        );
                      },
                    ),
                    CommonAdminListView(
                      item: (context, index) => DepartmentDetailCard(
                        department: state.departments.data![index],
                      ),
                      itemCount: state.departments.data!.length,
                    ),
                  ],
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
