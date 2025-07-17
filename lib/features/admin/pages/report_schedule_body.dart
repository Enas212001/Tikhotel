import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';

class ReportScheduleBody extends StatelessWidget {
  const ReportScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [AddFilterWidget(title: 'Add Report Schedule', onTap: () {})],
    );
  }
}
