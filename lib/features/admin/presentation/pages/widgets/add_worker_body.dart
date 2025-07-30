import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/presentation/manager/worker_cubit/worker_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/department_drop_down_menu.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/status_drop_down_menu.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

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
                DepartmentDropDown(
                  onChanged: (value) => cubit.selectedDepartment = value,
                  value: cubit.selectedDepartment,
                ),
                StatusDropDown(
                  onChanged: (value) => cubit.selectedStatus = value,
                  value: cubit.selectedStatus,
                ),
                AllowWhatsApp(cubit: cubit, value: cubit.allowWhatsapp),
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

class AllowWhatsApp extends StatelessWidget {
  const AllowWhatsApp({super.key, required this.cubit, required this.value});

  final WorkerCubit cubit;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(S.of(context).allowWhatsapp),
      trailing: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: value,
          onChanged: (value) => cubit.toggleWhatsapp(value),
          activeColor: AppColors.primary,
        ),
      ),
    );
  }
}
