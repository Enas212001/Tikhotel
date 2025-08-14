import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/refactor_date.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/detail_item.dart';
import 'package:ticket_flow/features/admin/data/models/user/user_model.dart';
import 'package:ticket_flow/features/admin/presentation/manager/user_cubit/user_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'admin_details_card.dart';
import 'delete_user.dart';

class UserDetailCard extends StatelessWidget {
  const UserDetailCard({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return AdminDeatailsCard(
      date: refactorDateWithTime(user.created),
      topCard: Column(
        children: [
          DetailItem(
            title: S.of(context).nameColon,
            value: user.name ?? '',
            hasIcon: true,
            image: Assets.imagesFname,
          ),
          DetailItem(
            title: S.of(context).departmentColon,
            value: user.departments ?? '',
            hasIcon: true,
            image: Assets.imagesDepartment,
          ),
        ],
      ),
      bottomCard: Column(
        children: [
          DetailItem(title: S.of(context).emailColon, value: user.email ?? ''),
          DetailItem(title: S.of(context).roleColon, value: user.role ?? ''),
          DetailItem(
            title: S.of(context).statusColon,
            value: user.isActive ?? '',
          ),
        ],
      ),
      onDelete: () {
        showDialog(
          context: context,
          builder: (dialogContext) =>
              DeleteUserDialog(id: user.id.toString(), parentContext: context),
        );
      },
      onEdit: () async {
        await context.push(AppRoutes.updateUser, extra: user);
        context.read<UserCubit>().getUsers();
      },
    );
  }
}
