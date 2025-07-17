import 'package:flutter/material.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';

import 'widgets/closed_work_order_card.dart';

class ClosedWorkOrderPage extends StatelessWidget {
  const ClosedWorkOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: CommonPageWidget(
        title: 'Closed Work Order',
        search: 'for any closedWorkOrder',
        listView: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ClosedWorkOrderCard();
          }, childCount: 10),
        ),
      ),
    );
  }
}
