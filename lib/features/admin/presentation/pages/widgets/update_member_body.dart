import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/data/models/member_model/member_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/member_cubit/member_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/DropDown/status_drop_down_menu.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/DropDown/title_drop_down.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class UpdateMemberBody extends StatelessWidget {
  const UpdateMemberBody({super.key, required this.member});
  final MemberItem member;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MemberCubit>();
    return BlocConsumer<MemberCubit, MemberState>(
      listener: (context, state) {
        if (state is MemberEdited) {
          context.pop();
        } else if (state is MemberEditingError) {
          showToast(state.error);
          log(state.error);
        } else if (state is MemberEditing) {
          Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        return AddOrUpdatePage(
          child: Column(
            children: [
              TitleDropDown(
                onChanged: (value) => cubit.selectedEditedTitle = (value),
                value: cubit.selectedEditedTitle,
              ),
              CustomRequestTextField(
                label: S.of(context).name,
                isReadOnly: false,
                value: member.name ?? '',
                onChanged: (value) {
                  cubit.nameEditController.text = value;
                },
              ),
              CustomRequestTextField(
                label: S.of(context).email,
                isReadOnly: false,
                value: member.email ?? '',
                onChanged: (value) {
                  cubit.emailEditController.text = value;
                },
              ),
              StatusDropDown(
                onChanged: (value) => cubit.selectedEditedStatus = value,
                value: cubit.selectedEditedStatus,
              ),
            ],
          ),
          onPressed: () {
            cubit.editMember(member: member);
          },
        );
      },
    );
  }
}
