import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/presentation/manager/member_cubit/member_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/generic_filter_dialog.dart';
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
            filterOnTap: () => showDialog(
              context: context,
              builder: (dialogContext) => GenericFilterDialog(
                filterOptions: [
                  FilterOption(
                    value: 'all',
                    label: S.of(context).all,
                    onTap: () => context.read<MemberCubit>().filterMembers('all'),
                  ),
                  FilterOption(
                    value: 'active',
                    label: S.of(context).active,
                    onTap: () => context.read<MemberCubit>().filterMembers('active'),
                  ),
                  FilterOption(
                    value: 'inactive',
                    label: S.of(context).inactive,
                    onTap: () => context.read<MemberCubit>().filterMembers('inactive'),
                  ),
                ],
              ),
            ),
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
