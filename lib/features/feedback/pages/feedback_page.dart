import 'package:flutter/material.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';

import 'widget/feedback_card.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: CommonPageWidget(
        title: 'Feedback',
        search: 'for any feedback',
        listView: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return FeedbackCard();
          }, childCount: 10),
        ),
      ),
    );
  }
}
