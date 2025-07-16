import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/request_text_field.dart';

class ReportByDate extends StatelessWidget {
  const ReportByDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: containerDecoration(),
        child: Column(
          children: [
            Text('Report by Date', style: TextStyles.text14RegularGrey),
            SizedBox(height: 12.h),
            CustomRequestTextField(
              label: 'Date From',
              isDate: true,
              value: '12-7-2025',
            ),
            CustomRequestTextField(
              label: 'Date To',
              isDate: true,
              value: '12-7-2025',
            ),
            CustomRequestTextField(
              label: 'Department',
              value: 'Housekeeping',
              isList: true,
            ),
            SizedBox(height: 20.h),
            CustomButton(text: 'Generate', onPressed: () {}, isPrimary: true),
          ],
        ),
      ),
    );
  }
}
