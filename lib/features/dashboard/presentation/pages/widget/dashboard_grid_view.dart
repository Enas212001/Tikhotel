import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/features/dashboard/presentation/manager/cubit/dashboard_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'dashboard_item.dart';
import 'dashboard_loading.dart';

class DashboardGridView extends StatelessWidget {
  const DashboardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading) {
          return DashboardLoadingWidget();
        }
        if (state is DashboardFailure) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(18.r),
              child: Text(state.message),
            ),
          );
        }
        if (state is DashboardSuccess) {
          final dashboard = state.dashboard;
          return Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(10.r),
              childAspectRatio: 1.3,
              children: [
                DashboardItem(
                  title: S.of(context).newRequest,
                  asset: Assets.imagesNewRequest,
                  number: dashboard.data?.newR ?? 0,
                  percent: (dashboard.data?.total ?? 0) != 0
                      ? double.parse(
                          (((dashboard.data?.newR ?? 0) /
                                      (dashboard.data?.total ?? 1)) *
                                  100)
                              .toStringAsFixed(1),
                        )
                      : 0,
                  isUp: true,
                ),
                DashboardItem(
                  title: S.of(context).pendingRequests,
                  asset: Assets.imagesPendingRequest,
                  number: dashboard.data?.pending ?? 0,
                  percent: (dashboard.data?.total ?? 0) != 0
                      ? double.parse(
                          (((dashboard.data?.pending ?? 0) /
                                      (dashboard.data?.total ?? 1)) *
                                  100)
                              .toStringAsFixed(1),
                        )
                      : 0,
                  isUp: false,
                ),
                DashboardItem(
                  title: S.of(context).activeRequests,
                  asset: Assets.imagesPendingRequest,
                  number: dashboard.data?.active ?? 0,
                  percent: (dashboard.data?.total ?? 0) != 0
                      ? double.parse(
                          (((dashboard.data?.active ?? 0) /
                                      (dashboard.data?.total ?? 1)) *
                                  100)
                              .toStringAsFixed(1),
                        )
                      : 0,
                  isUp: false,
                ),
                DashboardItem(
                  title: S.of(context).closedRequests,
                  asset: Assets.imagesNewRequest,
                  number: dashboard.data?.closed ?? 0,
                  percent: (dashboard.data?.total ?? 0) != 0
                      ? double.parse(
                          (((dashboard.data?.closed ?? 0) /
                                      (dashboard.data?.total ?? 1)) *
                                  100)
                              .toStringAsFixed(1),
                        )
                      : 0,
                  isUp: true,
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
