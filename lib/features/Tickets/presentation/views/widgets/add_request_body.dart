import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/func/custom_show_dialog.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/cubit/ticket_cubit.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/quantity_drop_down.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_type_drop_down.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/topics_drop_down.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/worker_drop_down.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/department_drop_down_menu.dart';
import 'package:ticket_flow/features/report/presentation/pages/widget/location_drop_down.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/file_upload.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/message_text_field.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/title_on_border.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'request_text_field.dart';
import 'success_message.dart';

class AddRequestBody extends StatelessWidget {
  const AddRequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listener: (context, state) {
        if (state is AddTicketSuccess) {
          context.pop();
          customShowDialog(
            context,
            widget: SuccessMessage(
              messageName: S.of(context).theReplayHasBeenAddedSuccessfully,
            ),
          );
        } else if (state is AddTicketFailure) {
          showToast(state.message);
        }
      },
      builder: (context, state) {
        final cubit = context.read<TicketCubit>();
        return Padding(
          padding: EdgeInsetsGeometry.all(16.r),
          child: Container(
            padding: EdgeInsets.all(20.r),
            decoration: containerDecoration(),
            child: Column(
              children: [
                LocationDropDown(
                  onChanged: (value) => cubit.locationId = value,
                  value: cubit.locationId,
                ),
                RequestTypeDropDown(
                  onChanged: (value) => cubit.selectedRequestType = value,
                  value: cubit.selectedRequestType,
                ),
                QuantityDropDown(),
                DepartmentDropDown(
                  onChanged: (value) => cubit.selectedDepartment = value,
                  value: cubit.selectedDepartment,
                ),
                CustomRequestTextField(
                  label: S.of(context).compensation,
                  isReadOnly: false,
                  controller: cubit.compensationController,
                ),
                CustomRequestTextField(
                  label: S.of(context).amount,
                  isList: true,
                  isReadOnly: false,
                  controller: cubit.amountEgp,
                ),
                TopicsDropDown(
                  value: cubit.problemId,
                  onChanged: (value) => cubit.problemId = value,
                ),
                WorkerDropDown(
                  value: cubit.workerId,
                  onChanged: (value) => cubit.workerId = value,
                ),
                MessageTextField(
                  controller: cubit.messageController,
                  label: S.of(context).message,
                ),
                SizedBox(height: 16.h),
                UploadFile(
                  onUpload: () {},
                  title: S.of(context).file,
                  child: FileUpload(),
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  text: S.of(context).save,
                  isPrimary: true,
                  onPressed: () {
                    cubit.addTicket();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
