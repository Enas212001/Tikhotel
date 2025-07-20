import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/generated/l10n.dart';

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
                  label: S.of(context).requestId,
                  value: '1324434',
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: S.of(context).startTime,
                  value: '7-7-2025',
                  isDate: true,
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: S.of(context).depTime,
                  value: '12-7-2025',
                  isDate: true,
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: S.of(context).department,
                  value: 'Housekeeping',
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: S.of(context).vacant,
                  value: '5005',
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: S.of(context).problem,
                  value: 'T.V Remote',
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: S.of(context).status,
                  value: 'Accepted',
                  isList: true,
                  onPressed: () {},
                ),
                CustomRequestTextField(
                  label: S.of(context).worker,
                  value: 'Mohamed ahmed',
                  isList: true,
                  onPressed: () {},
                ),
                CustomButton(
                  text: S.of(context).save,
                  isPrimary: true,
                  onPressed: () {},
                ),
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
