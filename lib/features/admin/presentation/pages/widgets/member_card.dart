import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/admin/data/models/member_model/member_model.dart';
import 'package:ticket_flow/features/admin/presentation/manager/member_cubit/member_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/admin_card.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'delete_membber.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({super.key, required this.member});
  final MemberModel member;
  @override
  Widget build(BuildContext context) {
    return AdminCard(
      onDelete: () {
        showDialog(
          context: context,
          builder: (dialogContext) => DeleteMemberDialog(
            id: member.id.toString(),
            parentContext: context,
          ),
        );
      },
      onEdit: () async {
        await context.push(AppRoutes.updateMember, extra: member);
        context.read<MemberCubit>().getMembers();
      },
      child: Column(
        children: [
          DetailItem(
            title: S.of(context).nameColon,
            value: member.name ?? '',
            hasIcon: true,
            image: Assets.imagesFname,
          ),
          DetailItem(
            title: S.of(context).statusColon,
            value: member.status ?? '',
            hasIcon: true,
            image: Assets.imagesLocation,
          ),
          DetailItem(
            title: S.of(context).emailColon,
            value: member.email ?? '',
            hasIcon: true,
            image: Assets.imagesEmail,
          ),
        ],
      ),
    );
  }
}
