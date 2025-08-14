import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/presentation/manager/user_cubit/user_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/add_update_page.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'department_muliple_select.dart';
import 'drop_down_user.dart';
import 'status_drop_down_menu.dart';
import 'user_roles.dart';

class AddUserBody extends StatelessWidget {
  const AddUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is AddUserSuccess) {
          context.pop();
        } else if (state is AddUserFailure) {
          log(state.message);
          showToast(state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formAddUserKey,
          child: AddOrUpdatePage(
            child: Column(
              children: [
                UserRoles(),
                CustomRequestTextField(
                  label: S.of(context).email,
                  isReadOnly: false,
                  controller: cubit.emailController,
                ),
                CustomRequestTextField(
                  label: S.of(context).password,
                  isReadOnly: false,
                  controller: cubit.passwordController,
                ),
                CustomRequestTextField(
                  label: S.of(context).name,
                  isReadOnly: false,
                  controller: cubit.firstNameController,
                ),
                DepartmentMultiSelect(
                  selectedDepartments: cubit.selectedDepartments,
                  onConfirm: (values) => cubit.selectedDepartments = values,
                ),
                StatusDropDown(
                  onChanged: (value) => cubit.selectedStatus = value,
                  value: cubit.selectedStatus,
                ),
                OperationalDropDown(),
              ],
            ),
            onPressed: () {
              if (cubit.formAddUserKey.currentState!.validate()) {
                cubit.addUser();
              }
            },
          ),
        );
      },
    );
  }
}

class OperationalDropDown extends StatelessWidget {
  const OperationalDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return DropDownUser(
      value: cubit.selectedOperational,
      items: [S.of(context).active, S.of(context).inactive],
      label: S.of(context).operational,
      onChanged: (value) => cubit.selectedOperational = (value),
    );
  }
}
