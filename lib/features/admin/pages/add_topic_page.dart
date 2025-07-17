import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';

import 'widgets/add_topic_body.dart';

class AddTopicPage extends StatelessWidget {
  const AddTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(text: 'Add Topic'),
            AddTopicBody(),
          ],
        ),
      ),
    );
  }
}
