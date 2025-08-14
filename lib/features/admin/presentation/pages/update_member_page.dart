import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/admin/data/models/member_model/member_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/member_cubit/member_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/update_member_body.dart';

class UpdateMemberPage extends StatelessWidget {
  const UpdateMemberPage({super.key, required this.member});
  final MemberItem member;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MemberCubit(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(text: S.of(context).updateMember),
              UpdateMemberBody(member: member),
            ],
          ),
        ),
      ),
    );
  }
}
