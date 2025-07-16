import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';

import 'message_replay.dart';
import 'request_text_field.dart';

class EditRequest extends StatelessWidget {
  const EditRequest({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: containerDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomRequestTextField(
                  label: 'Request ID',
                  value: '1324434',
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: 'Start Time',
                  value: '7-7-2025',
                  isDate: true,
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: 'Dep time Date',
                  value: '12-7-2025',
                  isDate: true,
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: 'Department',
                  value: 'Housekeeping',
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: 'Vacant',
                  value: '5005',
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: 'Problem',
                  value: 'T.V Remote',
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: 'Status',
                  value: 'Accepted',
                  isList: true,
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: 'Worker',
                  value: 'Mohamed ahmed',
                  isList: true,
                  onPressed: () {},
                ),
                CustomButton(text: 'Save', isPrimary: true, onPressed: () {}),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          MessageReplay(scrollController: scrollController),
        ],
      ),
    );
  }

  
}
