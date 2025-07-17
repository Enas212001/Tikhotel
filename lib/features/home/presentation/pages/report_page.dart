import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';

import 'widget/report_by_date.dart';
import 'widget/report_by_room.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopWidget(search: '', title: 'Reports', isDashboard: true),
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
