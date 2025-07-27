import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user_model.dart';
import 'package:ticket_flow/features/admin/presentation/manager/user_cubit/user_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/add_user_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/user_roles.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class UpdateUserBody extends StatelessWidget {
  const UpdateUserBody({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is EditUserSuccess) {
          context.pop();
        } else if (state is EditUserFailure) {
          showToast(state.message);
          log(state.message);
        } else if (state is EditUserLoading) {
          Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        return AddOrUpdatePage(
          child: Column(
            children: [
              UserRoles(isEdit: true),
              CustomRequestTextField(
                label: S.of(context).email,
                isReadOnly: false,
                value: user.email,
                onChanged: (value) {
                  cubit.emailControllerEdit.text = value;
                },
              ),
              CustomRequestTextField(
                label: S.of(context).password,
                isReadOnly: false,
                value: 'password',
                onChanged: (value) {
                  cubit.passwordControllerEdit.text = value;
                },
              ),
              CustomRequestTextField(
                label: S.of(context).name,
                isReadOnly: false,
                value: user.name,
                onChanged: (value) {
                  cubit.firstNameControllerEdit.text = value;
                },
              ),
              DepartmentDropDown(isEdit: true),
              StatusDropDown(isEdit: true),
              CustomRequestTextField(
                label: S.of(context).registrationDate,
                value: user.created,
              ),
              CustomRequestTextField(
                label: S.of(context).ipAddress,
                value: user.ip,
              ),
            ],
          ),
          onPressed: () {
            cubit.editUser(user.id.toString());
          },
        );
      },
    );
  }
}
