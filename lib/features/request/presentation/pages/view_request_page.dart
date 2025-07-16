import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/edit_request.dart';
import 'widgets/replay_message.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';

class ViewRequestPage extends StatefulWidget {
  const ViewRequestPage({super.key});

  @override
  State<ViewRequestPage> createState() => _ViewRequestPageState();
}

class _ViewRequestPageState extends State<ViewRequestPage> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            CustomAppBar(text: 'View Request'),
            EditRequest(scrollController: scrollController),
            SizedBox(height: 16.h),
            ReplayMessage(),
          ],
        ),
      ),
    );
  }
}