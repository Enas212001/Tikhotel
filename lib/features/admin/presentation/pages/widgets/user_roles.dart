import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/border_text_field.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/features/admin/data/models/role_model/role_model.dart';
import 'package:ticket_flow/features/admin/presentation/manager/user_cubit/user_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

class UserRoles extends StatelessWidget {
  const UserRoles({super.key, this.isEdit = false});
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        // if (state is RolesLoading) {
        //   return const Center(child: CircularProgressIndicator());
        // }
        if (state is RolesFailure) {
          return Center(child: Text(state.message));
        }
        if (state is RolesLoaded) {
          return Padding(
            padding: EdgeInsets.only(bottom: 14.h),
            child: DropdownButtonFormField<RoleModel>(
              value: isEdit
                  ? cubit.selectedRoleEdit ?? cubit.selectedRole
                  : cubit.selectedRole ?? state.roles.first,
              style: TextStyles.text12LightGrey,
              decoration: InputDecoration(
                labelText: S.of(context).role,
                border: borderTextField(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyles.text14RegularGrey,
              ),
              items: state.roles
                  .map(
                    (role) => DropdownMenuItem<RoleModel>(
                      value: role,
                      child: Text(role.role ?? ''),
                    ),
                  )
                  .toList(),
              onChanged: (RoleModel? value) =>
                  isEdit ? cubit.setRoleEdit(value) : cubit.setRole(value),
              validator: (value) => value == null
                  ? S.of(context).pleaseSelect(S.of(context).role)
                  : null,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
