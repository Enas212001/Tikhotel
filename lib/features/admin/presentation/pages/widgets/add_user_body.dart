import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/border_text_field.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/features/admin/presentation/manager/cubit/user_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/add_update_page.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/generated/l10n.dart';

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
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formAddUserKey,
          child: AddOrUpdatePage(
            child: Column(
              children: [
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is RolesState) {
                      if (state.loading) {
                        return CircularProgressIndicator();
                      }
                      return DropDownUser(
                        onTap: () => context.read<UserCubit>().getRoles(),
                        onChanged: (value) =>
                            context.read<UserCubit>().setRole(value),
                        items: state.roles
                            .map((role) => role.role ?? '')
                            .toList(),
                        label: S.of(context).role,
                        value: state.selectedRole,
                      );
                    }
                    return DropDownUser(
                      onTap: () => context.read<UserCubit>().getRoles(),
                      onChanged: (value) =>
                          context.read<UserCubit>().setRole(value),
                      items: const [],
                      label: S.of(context).role,
                      value: null,
                    );
                  },
                ),
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
                DropDownUser(
                  items: [S.of(context).department, S.of(context).active],
                  label: S.of(context).department,
                  value: cubit.selectedDepartment,
                  onChanged: (value) => cubit.setDepartment(value),
                ),
                DropDownUser(
                  onChanged: (value) => cubit.setStatus(value),
                  items: [S.of(context).active, S.of(context).inactive],
                  label: S.of(context).status,
                  value: cubit.selectedStatus,
                ),
                DropDownUser(
                  value: cubit.selectedOperational,
                  items: [S.of(context).active, S.of(context).inactive],
                  label: S.of(context).operational,
                  onChanged: (value) => cubit.setOperational(value),
                ),
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

class DropDownUser extends StatelessWidget {
  const DropDownUser({
    super.key,
    required this.items,
    required this.label,
    this.value,
    this.onChanged,
    this.onTap,
  });
  final String? value;
  final List<String> items;
  final String label;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: DropdownButtonFormField<String>(
        value: value,
        style: TextStyles.text12LightGrey,
        decoration: InputDecoration(
          labelText: label,
          border: borderTextField(),
          
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyles.text14RegularGrey,
        ),

        items: items
            .map(
              (status) => DropdownMenuItem(value: status, child: Text(status)),
            )
            .toList(),
        onChanged: onChanged,
        validator: (value) =>
            value == null ? S.of(context).pleaseSelect(label) : null,
        onTap: onTap,
      ),
    );
  }
}
