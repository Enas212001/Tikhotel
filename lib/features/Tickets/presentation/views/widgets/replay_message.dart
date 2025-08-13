import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/file_upload.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'message_text_field.dart';
import 'title_on_border.dart';

class ReplayMessage extends StatelessWidget {
  const ReplayMessage({
    super.key,
    this.isGuest = false,
    this.messageSend,
    this.rating,
    required this.onButtonPressed,
  });
  final bool isGuest;
  final Function(String)? messageSend, rating;
  final VoidCallback onButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: containerDecoration(),
        child: Column(
          children: [
            MessageTextField(
              label: S.of(context).replayMessage,
              onChanged: messageSend,
            ),
            SizedBox(height: 16.h),
            UploadFile(
              onUpload: () {},
              title: S.of(context).file,
              child: FileUpload(),
            ),
            SizedBox(height: 16.h),
            isGuest
                ? Column(
                    children: [
                      MessageTextField(
                        label: S.of(context).rating,
                        onChanged: rating,
                      ),
                      SizedBox(height: 16.h),
                    ],
                  )
                : SizedBox.shrink(),
            CustomButton(
              text: S.of(context).replay,
              onPressed: onButtonPressed,
              isPrimary: true,
            ),
          ],
        ),
      ),
    );
  }
}
