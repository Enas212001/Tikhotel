import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';

import 'widget/report_by_date.dart';
import 'widget/report_by_room.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(text: 'Reports'),
            SizedBox(height: 16.h),
            ReportByDate(),
            SizedBox(height: 16.h),
            ReportByRoom(),
          ],
        ),
      ),
    );
  }
}
