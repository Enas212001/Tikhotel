import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/widgets/form_with_title.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/message_text_field.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/title_on_border.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/department_drop_down_menu.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/generated/l10n.dart';

class NewRequestGuestBody extends StatelessWidget {
  const NewRequestGuestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopWidget(
          search: '',
          title: S.of(context).newRequest,
          isDashboard: true,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 16.r) +
              EdgeInsets.only(bottom: 16.h),
          child: FormWithTitle(
            title: S.of(context).sendRequest,
            child: Column(
              children: [
                DepartmentDropDown(),
                MessageTextField(value: '', label: S.of(context).message),
                SizedBox(height: 16.h),
                UploadFile(onUpload: () {}, title: S.of(context).file),
                CustomRequestTextField(
                  label: S.of(context).verficationCode,
                  isReadOnly: false,
                ),
                CustomButton(
                  text: S.of(context).send,
                  isPrimary: true,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
