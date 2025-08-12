import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/presentation/manager/department_cubit/department_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/status_drop_down_menu.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class UpdateDepBody extends StatelessWidget {
  const UpdateDepBody({super.key, required this.department});
  final DepartmentModel department;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DepartmentCubit>();
    return BlocConsumer<DepartmentCubit, DepartmentState>(
      listener: (context, state) {
        if (state is DepartmentEdited) {
          context.pop();
          showToast(S.of(context).departmentUpdated);
        } else if (state is DepartmentEditFailure) {
          showToast(state.message);
        }
      },
      builder: (context, state) {
        return AddOrUpdatePage(
          child: Column(
            children: [
              CustomRequestTextField(
                label: S.of(context).department,
                isReadOnly: false,
                value: department.name ?? '',
                onChanged: (value) {
                  cubit.nameEditedController.text = value;
                },
              ),
              StatusDropDown(
                onChanged: (value) => cubit.selectedEditedStatus = value,
                value: cubit.selectedEditedStatus,
              ),
            ],
          ),
          onPressed: () {
            cubit.editDepartment(department: department);
          },
        );
      },
    );
  }
}
