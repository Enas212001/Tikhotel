import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/func/custom_show_dialog.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/cubit/ticket_cubit.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/file_upload.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'message_text_field.dart';
import 'success_message.dart';
import 'title_on_border.dart';

class ReplayMessage extends StatelessWidget {
  const ReplayMessage({super.key, this.isGuest = false});
  final bool isGuest;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listener: (context, state) {
        if (state is ReplayMessageSuccess) {
          GoRouter.of(context).pop();
          customShowDialog(
            context,
            widget: SuccessMessage(
              messageName: S.of(context).theReplayHasBeenAddedSuccessfully,
            ),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<TicketCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            padding: EdgeInsets.all(20.r),
            decoration: containerDecoration(),
            child: Column(
              children: [
                MessageTextField(
                  label: S.of(context).replayMessage,
                  onChanged: (value) => cubit.replayController.text = value,
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
                          MessageTextField(label: S.of(context).rating),
                          SizedBox(height: 16.h),
                        ],
                      )
                    : SizedBox.shrink(),
                CustomButton(
                  text: S.of(context).replay,
                  onPressed: () {
                    GoRouter.of(context).pop();
                    customShowDialog(
                      context,
                      widget: SuccessMessage(
                        messageName: S
                            .of(context)
                            .theReplayHasBeenAddedSuccessfully,
                      ),
                    );
                  },
                  isPrimary: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
