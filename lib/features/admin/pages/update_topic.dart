import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';

import 'widgets/update_topic_body.dart';

class UpdateTopic extends StatelessWidget {
  const UpdateTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(text: 'Update Topic'),
            UpdateTopicBody(),
          ],
        ),
      ),
    );
  }
}
