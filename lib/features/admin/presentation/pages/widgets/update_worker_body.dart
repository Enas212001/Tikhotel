import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/worker_cubit/worker_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/add_worker_body.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';
import 'department_drop_down_menu.dart';
import 'status_drop_down_menu.dart';

class UpdateWorkerBody extends StatelessWidget {
  const UpdateWorkerBody({super.key, required this.workerItem});
  final WorkerItem workerItem;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkerCubit, WorkerState>(
      listener: (context, state) {
        if (state is EditWorkerSuccess) {
          showToast(S.of(context).workerUpdated);
          context.pop();
        } else if (state is EditWorkerFailure) {
          log(state.message);
          showToast(state.message);
        } else if (state is EditWorkerLoading) {
          Center(child: CircularProgressIndicator(color: AppColors.primary));
        }
      },
      builder: (context, state) {
        final cubit = context.read<WorkerCubit>();
        return AddOrUpdatePage(
          child: Column(
            children: [
              CustomRequestTextField(
                label: S.of(context).workerName,
                isReadOnly: false,
                value: workerItem.fname ?? '',
                onChanged: (value) => cubit.nameEditController.text = value,
              ),
              CustomRequestTextField(
                label: S.of(context).phoneNumber,
                isReadOnly: false,
                value: workerItem.phone.toString(),
                onChanged: (value) => cubit.phoneEditController.text = value,
              ),
              DepartmentDropDown(
                value: cubit.selectedEditedDepartment,
                onChanged: (value) => cubit.selectedEditedDepartment = value,
              ),
              StatusDropDown(
                onChanged: (value) => cubit.selectedEditedStatus = value,
                value: cubit.selectedEditedStatus,
              ),
              AllowWhatsApp(cubit: cubit, value: cubit.allowWhatsapp),
            ],
          ),
          onPressed: () {
            cubit.editWorker(id: workerItem.id.toString());
          },
        );
      },
    );
  }
}
