import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/utils/widgets/down_arrow.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/file_upload.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/message_text_field.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/title_on_border.dart';
import 'package:ticket_flow/generated/l10n.dart';

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
            TitleOnBorder(
              onUpload: () {},
              title: S.of(context).room,
              child: DownArrow(),
            ),
            TitleOnBorder(
              onUpload: () {},
              title: S.of(context).requestType,
              child: DownArrow(),
            ),
            TitleOnBorder(
              onUpload: () {},
              title: S.of(context).quantity,
              child: DownArrow(),
            ),
            TitleOnBorder(
              onUpload: () {},
              title: S.of(context).department,
              child: DownArrow(),
            ),
            CustomRequestTextField(
              label: S.of(context).compensation,
              isReadOnly: false,
            ),
            CustomRequestTextField(label: S.of(context).amount, isList: true),
            CustomRequestTextField(label: S.of(context).problem, isList: true),
            MessageTextField(value: '', label: S.of(context).message),
            SizedBox(height: 16.h),
            TitleOnBorder(
              onUpload: () {},
              title: S.of(context).file,
              child: FileUpload(),
            ),
            SizedBox(height: 16.h),
            CustomButton(
              text: S.of(context).save,
              isPrimary: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
