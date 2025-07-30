import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/presentation/manager/worker_cubit/worker_cubit.dart';
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
          ),
          BlocBuilder<WorkerCubit, WorkerState>(
            builder: (context, state) {
              if (state is FetchWorkerSuccess) {
                return CommonAdminListView(
                  item: (context, index) =>
                      WokerDetailCard(worker: state.workers[index]),
                  itemCount: state.workers.length,
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
