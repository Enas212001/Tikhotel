import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/custom_show_dialog.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/widgets/form_with_title.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/message_text_field.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/success_message.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/title_on_border.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/DropDown/department_single_select.dart';
import 'package:ticket_flow/features/guestFlow/presentation/manager/ticket_guest_cubit/ticket_guest_cubit.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/generated/l10n.dart';

class NewRequestGuestBody extends StatelessWidget {
  const NewRequestGuestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GuestTicketsCubit, GuestTicketsState>(
      listener: (context, state) {
        if (state is AddGuestTicketSuccess) {
          customShowDialog(
            context,
            widget: SuccessMessage(messageName: S.of(context).ticketAdded),
          );
        } else if (state is AddGuestTicketFailure) {
          showToast(state.message);
        }
      },
      builder: (context, state) {
        final cubit = context.read<GuestTicketsCubit>();
        return Column(
          children: [
            TopWidget(
              search: '',
              title: S.of(context).newRequest,
              noSearchBar: true,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.r) +
                  EdgeInsets.only(bottom: 16.h),
              child: FormWithTitle(
                title: S.of(context).sendRequest,
                child: Column(
                  children: [
                    DepartmentSingleSelect(
                      onChanged: (value) => cubit.departmentItem = value,
                    ),
                    MessageTextField(
                      value: cubit.messageController.text,
                      label: S.of(context).message,
                      onChanged: (value) =>
                          cubit.messageController.text = value,
                    ),
                    SizedBox(height: 16.h),
                    UploadFile(onUpload: () {}, title: S.of(context).file),
                    CustomRequestTextField(
                      label: S.of(context).verficationCode,
                      isReadOnly: true,
                    ),
                    CustomButton(
                      text: S.of(context).send,
                      isPrimary: true,
                      onPressed: () {
                        cubit.addGuestTicket();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
