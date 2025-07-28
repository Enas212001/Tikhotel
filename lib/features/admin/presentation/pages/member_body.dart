import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/presentation/manager/member_cubit/member_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/common_admin_list_view.dart';
import 'widgets/member_card.dart';

class MemberBody extends StatelessWidget {
  const MemberBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MemberCubit, MemberState>(
      listener: (context, state) {
        if (state is MemberDeleted) {
          context.read<MemberCubit>().getMembers();
          context.pop();
        }
      },
      child: Column(
        children: [
          AddFilterWidget(
            title: S.of(context).addMember,
            onTap: () async {
              await context.push(AppRoutes.addMember);
              context.read<MemberCubit>().getMembers();
            },
          ),
          BlocBuilder<MemberCubit, MemberState>(
            builder: (context, state) {
              if (state is MemberLoading) {
                return const ShimmerLoadingList();
              } else if (state is MemberError) {
                log(state.message);
                return Center(child: Text(state.message));
              } else if (state is MemberLoaded) {
                return CommonAdminListView(
                  item: (context, index) =>
                      MemberCard(member: state.members[index]),
                  itemCount: state.members.length,
                );
              }
              return const ShimmerLoadingList();
            },
          ),
        ],
      ),
    );
  }
}
