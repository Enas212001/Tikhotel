import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';

import 'widget/closed_feedback_card.dart';

class ClosedFeedbackPage extends StatelessWidget {
  const ClosedFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonPageWidget(
        title: 'Closed Feedback',
        search: 'closedFeedback',
        listView: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ClosedFeedbackCard();
          }, childCount: 10),
        ),
      ),
    );
  }
}
