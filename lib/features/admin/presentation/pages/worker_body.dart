import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/core/utils/widgets/pagination_controller.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/presentation/manager/worker_cubit/worker_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/generic_filter_dialog.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/common_admin_list_view.dart';
import 'widgets/woker_detail_card.dart';

class WorkerBody extends StatelessWidget {
  const WorkerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkerCubit, WorkerState>(
      listener: (context, state) {
        if (state is DeleteWorkerSuccess) {
          context.read<WorkerCubit>().getWorkers();
          context.pop();
        }
      },
      child: Column(
        children: [
          AddFilterWidget(
            title: S.of(context).addWorker,
            onTap: () async {
              await context.push(AppRoutes.addWorker);
              context.read<WorkerCubit>().getWorkers();
            },
            filterOnTap: () => showDialog(
              context: context,
              builder: (dialogContext) => GenericFilterDialog(
                filterOptions: [
                  FilterOption(
                    value: 'all',
                    label: S.of(context).all,
                    onTap: () =>
                        context.read<WorkerCubit>().filterWorkers('all'),
                  ),
                  FilterOption(
                    value: 'active',
                    label: S.of(context).active,
                    onTap: () =>
                        context.read<WorkerCubit>().filterWorkers('active'),
                  ),
                  FilterOption(
                    value: 'inactive',
                    label: S.of(context).inactive,
                    onTap: () =>
                        context.read<WorkerCubit>().filterWorkers('inactive'),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<WorkerCubit, WorkerState>(
            builder: (context, state) {
              if (state is FetchWorkerSuccess) {
                final totalPages =
                    (state.workers.pagination!.total! /
                            state.workers.pagination!.limit!)
                        .ceil();
                return Column(
                  children: [
                    PaginationControls(
                      currentPage: state.workers.pagination!.page!,
                      totalPages: totalPages,
                      onPageSelected: (page) {
                        context.read<WorkerCubit>().getWorkers(page: page);
                      },
                    ),
                    CommonAdminListView(
                      item: (context, index) =>
                          WokerDetailCard(worker: state.workers.data![index]),
                      itemCount: state.workers.data!.length,
                    ),
                  ],
                );
              }
              if (state is FetchWorkerFailure) {
                return Center(child: Text(state.message));
              } else if (state is FetchWorkerLoading) {
                return ShimmerLoadingList();
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
