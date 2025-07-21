import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/widgets/form_with_title.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';
import 'package:ticket_flow/generated/l10n.dart';

class ReportScheduleBody extends StatelessWidget {
  const ReportScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          FormWithTitle(
            title: S.of(context).scheduleAReport,
            buttonText: S.of(context).submit,
            child: Column(
              children: [
                CustomRequestTextField(
                  label: S.of(context).reportName,
                  isReadOnly: false,
                ),
                CustomRequestTextField(
                  label: S.of(context).reportTime,
                  isDate: true,
                ),
                CustomRequestTextField(
                  label: S.of(context).runDate,
                  isList: true,
                ),
                CustomRequestTextField(
                  label: S.of(context).status,
                  isList: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
