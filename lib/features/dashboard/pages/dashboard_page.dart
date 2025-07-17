import 'package:flutter/material.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';

import 'widget/dashboard_grid_view.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: Column(
        children: [
          TopWidget(search: '', title: 'Dashboard', isDashboard: true),
          DashboardGridView(),
        ],
      ),
    );
  }
}
