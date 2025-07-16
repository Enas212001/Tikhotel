import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/func/custom_show_dialog.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/features/request/presentation/pages/widgets/file_upload.dart';

import 'message_text_field.dart';
import 'success_message.dart';
import 'title_on_border.dart';

class ReplayMessage extends StatelessWidget {
  const ReplayMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: containerDecoration(),
        child: Column(
          children: [
            MessageTextField(value: '', label: 'Replay Message'),
            SizedBox(height: 16.h),
            TitleOnBorder(onUpload: () {}, title: 'File', child: FileUpload()),
            SizedBox(height: 16.h),
            CustomButton(
              text: 'Replay',
              onPressed: () {
                GoRouter.of(context).pop();
                customShowDialog(
                  context,
                  widget: SuccessMessage(
                    messageName: 'The replay has been added successfully',
                  ),
                );
              },
              isPrimary: true,
            ),
          ],
        ),
      ),
    );
  }
}
