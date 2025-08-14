import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_item.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/ticket_cubit/ticket_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/DropDown/department_single_select.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/DropDown/status_drop_down_menu.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/DropDown/worker_drop_down.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'message_replay.dart';
import 'request_text_field.dart';

class EditRequest extends StatelessWidget {
  const EditRequest({
    super.key,
    required this.scrollController,
    required this.ticket,
  });
  final ScrollController scrollController;
  final TicketItem ticket;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TicketCubit>();
    return BlocConsumer<TicketCubit, TicketState>(
      listener: (context, state) {
        if (state is EditTicketSuccess) {
          context.pop();
          showToast(S.of(context).ticketUpdated);
        }
        if (state is EditTicketFailure) {
          log(state.message);
          showToast(state.message);
        }
      },
      builder: (context, state) {
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
                      value: ticket.id.toString(),
                    ),
                    CustomRequestTextField(
                      label: S.of(context).startTime,
                      value: ticket.created,
                      isDate: true,
                    ),
                    CustomRequestTextField(
                      label: S.of(context).depTime,
                      value: ticket.closed,
                      isDate: true,
                    ),
                    DepartmentSingleSelect(
                      value: cubit.selectedDepartment,
                      onChanged: (value) => cubit.selectedDepartment = value,
                    ),
                    CustomRequestTextField(
                      label: S.of(context).room,
                      value: ticket.status,
                    ),
                    CustomRequestTextField(
                      label: S.of(context).problem,
                      value: ticket.problemTopic,
                    ),
                    StatusDropDown(
                      value: cubit.selectedStatus,
                      onChanged: (value) => cubit.selectedStatus = value,
                    ),
                    WorkerDropDown(
                      value: cubit.workerId,
                      onChanged: (value) => cubit.workerId = value,
                    ),
                    CustomButton(
                      text: S.of(context).save,
                      isPrimary: true,
                      onPressed: () {
                        cubit.editTicket(ticket);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              MessageReplay(scrollController: scrollController, ticket: ticket),
            ],
          ),
        );
      },
    );
  }
}
