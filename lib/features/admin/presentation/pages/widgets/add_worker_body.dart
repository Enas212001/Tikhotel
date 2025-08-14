import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/presentation/manager/worker_cubit/worker_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/DropDown/status_drop_down_menu.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';
import 'allow_whatsapp.dart';
import 'DropDown/department_single_select.dart';

class AddWorkerBody extends StatelessWidget {
  const AddWorkerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkerCubit, WorkerState>(
      listener: (context, state) {
        if (state is AddWorkerSuccess) {
          showToast(S.of(context).workerAdded);
          context.pop();
        } else if (state is AddWorkerFailure) {
          showToast(state.message);
        } else if (state is AddWorkerLoading) {
          Center(child: CircularProgressIndicator(color: AppColors.primary));
        }
      },
      builder: (context, state) {
        final cubit = context.watch<WorkerCubit>();
        return Form(
          key: cubit.formKey,
          child: AddOrUpdatePage(
            child: Column(
              children: [
                CustomRequestTextField(
                  label: S.of(context).workerName,
                  isReadOnly: false,
                  controller: cubit.nameController,
                ),
                CustomRequestTextField(
                  label: S.of(context).phoneNumber,
                  isReadOnly: false,
                  controller: cubit.phoneController,
                ),
                DepartmentSingleSelect(
                  onChanged: (value) => cubit.selectedDepartment = value,
                  value: cubit.selectedDepartment,
                ),
                StatusDropDown(
                  onChanged: (value) => cubit.selectedStatus = value,
                  value: cubit.selectedStatus,
                ),
                AllowWhatsApp(
                  value: cubit.allowWhatsapp,
                  onChanged: (value) => cubit.toggleWhatsapp(value),
                ),
              ],
            ),
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.addWorker();
              }
            },
          ),
        );
      },
    );
  }
}
