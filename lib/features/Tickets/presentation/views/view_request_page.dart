import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_show_dialog.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_item.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/ticket_cubit/ticket_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/edit_request.dart';
import 'widgets/replay_message.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import 'widgets/success_message.dart';

class ViewRequestPage extends StatefulWidget {
  const ViewRequestPage({super.key, required this.ticket});
  final TicketItem ticket;
  @override
  State<ViewRequestPage> createState() => _ViewRequestPageState();
}

class _ViewRequestPageState extends State<ViewRequestPage> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TicketCubit(),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              CustomAppBar(text: S.of(context).viewRequest),
              EditRequest(
                scrollController: scrollController,
                ticket: widget.ticket,
              ),
              BlocConsumer<TicketCubit, TicketState>(
                listener: (context, state) {
                  if (state is ReplayMessageSuccess) {
                    GoRouter.of(context).pop();
                    customShowDialog(
                      context,
                      widget: SuccessMessage(
                        messageName: S
                            .of(context)
                            .theReplayHasBeenAddedSuccessfully,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final cubit = context.read<TicketCubit>();
                  return ReplayMessage(
                    messageSend: (value) => cubit.replayController.text = value,
                    onButtonPressed: () {
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
