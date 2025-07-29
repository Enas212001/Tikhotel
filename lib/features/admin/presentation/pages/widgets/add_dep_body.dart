import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/presentation/manager/department_cubit/department_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/status_drop_down_menu.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class AddDepBody extends StatelessWidget {
  const AddDepBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DepartmentCubit>();
    return BlocConsumer<DepartmentCubit, DepartmentState>(
      listener: (context, state) {
        if (state is DepartmentAdded) {
          context.pop();
          showToast(S.of(context).departmentAdded);
        } else if (state is DepartmentAddFailure) {
          showToast(state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: AddOrUpdatePage(
            child: Column(
              children: [
                CustomRequestTextField(
                  label: S.of(context).department,
                  isReadOnly: false,
                  controller: cubit.nameController,
                ),
                StatusDropDown(
                  onChanged: (value) => cubit.selectedStatus = value,
                  value: cubit.selectedStatus,
                ),
              ],
            ),
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.addDepartment();
              }
            },
          ),
        );
      },
    );
  }
}
