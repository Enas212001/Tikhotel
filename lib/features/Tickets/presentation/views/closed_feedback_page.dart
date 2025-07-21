import 'package:flutter/material.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';

import 'widgets/closed_feedback_card.dart';

class ClosedFeedbackPage extends StatelessWidget {
  const ClosedFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: CommonPageWidget(
        title: 'Closed Feedback',
        search: 'for any closedFeedback',
        listView: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ClosedFeedbackCard();
          }, childCount: 10),
        ),
      ),
    );
  }
}
