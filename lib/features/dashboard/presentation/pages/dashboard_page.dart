import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/features/dashboard/presentation/manager/cubit/dashboard_cubit.dart';

import 'widget/dashboard_grid_view.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: BlocProvider(
        create: (context) => DashboardCubit()..getDashboard(),
        child: DashboardRefresh(),
      ),
    );
  }
}

class DashboardRefresh extends StatelessWidget {
  const DashboardRefresh({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<DashboardCubit>().getDashboard(),
      color: AppColors.primary,
      child: Column(
        children: [
          TopWidget(search: '', title: 'Dashboard', isDashboard: true),
          DashboardGridView(),
        ],
      ),
    );
  }
}
