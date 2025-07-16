import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/utils/widgets/down_arrow.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/file_upload.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/message_text_field.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/title_on_border.dart';

import 'request_text_field.dart';

class AddRequestBody extends StatelessWidget {
  const AddRequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16.r),
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: containerDecoration(),
        child: Column(
          children: [
            TitleOnBorder(onUpload: () {}, title: 'Room', child: DownArrow()),
            TitleOnBorder(
              onUpload: () {},
              title: 'Request Type',
              child: DownArrow(),
            ),
            TitleOnBorder(
              onUpload: () {},
              title: 'Quantity',
              child: DownArrow(),
            ),
            TitleOnBorder(
              onUpload: () {},
              title: 'Department',
              child: DownArrow(),
            ),
            CustomRequestTextField(label: 'Compensation', isReadOnly: false),
            TitleOnBorder(onUpload: () {}, title: 'Amount', child: DownArrow()),
            TitleOnBorder(
              onUpload: () {},
              title: 'Problem',
              child: DownArrow(),
            ),
            MessageTextField(value: '', label: 'Message'),
            SizedBox(height: 16.h),
            TitleOnBorder(onUpload: () {}, title: 'File', child: FileUpload()),
            SizedBox(height: 16.h),
            CustomButton(text: 'Save', isPrimary: true, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
