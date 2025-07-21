import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/widgets/form_with_title.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/generated/l10n.dart';

class ReportByRoom extends StatelessWidget {
  const ReportByRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16.r) +
          EdgeInsets.only(bottom: 16.h),
      child: FormWithTitle(
        title: S.of(context).reportByRoom,
        buttonText: S.of(context).generate,
        child: Column(
          children: [
            CustomRequestTextField(
              label: S.of(context).dateFrom,
              isDate: true,
              value: '12-7-2025',
            ),
            CustomRequestTextField(
              label: S.of(context).dateTo,
              isDate: true,
              value: '12-7-2025',
            ),
            CustomRequestTextField(
              label: S.of(context).location,
              value: '1001',
              isList: true,
            ),
            CustomRequestTextField(
              label: S.of(context).department,
              value: 'Housekeeping',
              isList: true,
            ),
          ],
        ),
      ),
    );
  }
}
