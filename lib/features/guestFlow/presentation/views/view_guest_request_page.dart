import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/app/guest_drawer.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/func/custom_show_dialog.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/message_text_field.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/replay_message.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/success_message.dart';
import 'package:ticket_flow/features/guestFlow/data/models/guest_ticket_model/guest_ticket_item.dart';
import 'package:ticket_flow/generated/l10n.dart';

import '../manager/ticket_guest_cubit/ticket_guest_cubit.dart';

class ViewGuestRequestPage extends StatelessWidget {
  const ViewGuestRequestPage({super.key, required this.ticketModel});
  final GuestTicketItem ticketModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GuestDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(text: S.of(context).viewRequest),
            Padding(
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
                          value: ticketModel.ticketId ?? '',
                        ),
                        CustomRequestTextField(
                          label: S.of(context).startTime,
                          value: ticketModel.created ?? '',
                          isDate: true,
                        ),
                        CustomRequestTextField(
                          label: S.of(context).by,
                          value: ticketModel.requestedBy ?? '',
                        ),
                        MessageTextField(
                          value: ticketModel.message ?? '',
                          label: S.of(context).message,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BlocProvider(
              create: (context) => GuestTicketsCubit(),
              child: BlocConsumer<GuestTicketsCubit, GuestTicketsState>(
                listener: (context, state) {
                  if (state is AddGuestReplySuccess) {
                    GoRouter.of(context).pop();
                    customShowDialog(
                      context,
                      widget: SuccessMessage(
                        messageName: S
                            .of(context)
                            .theReplayHasBeenAddedSuccessfully,
                      ),
                    );
                  } else if (state is AddGuestReplyFailure) {
                    showToast(state.message);
                  }
                },
                builder: (context, state) {
                  final cubit = context.read<GuestTicketsCubit>();
                  return ReplayMessage(
                    isGuest: true,
                    messageSend: (value) => cubit.replyController.text = value,
                    rating: (value) => cubit.ratingController.text = value,
                    onButtonPressed: () {
                      cubit.addGuestReply();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
