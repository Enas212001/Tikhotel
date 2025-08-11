import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/presentation/manager/user_cubit/user_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/generic_filter_dialog.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/common_admin_list_view.dart';
import 'widgets/user_detail_card.dart';

class UsersBody extends StatelessWidget {
  const UsersBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is DeleteUserSuccess) {
          showToast(state.message);
          context.read<UserCubit>().getUsers();
          Navigator.of(context).pop();
        } else if (state is DeleteUserFailure) {
          showToast(state.message);
        }
      },
      child: Column(
        children: [
          AddFilterWidget(
            title: S.of(context).addUser,
            onTap: () async {
              await context.push(AppRoutes.addUser);
              context.read<UserCubit>().getUsers();
            },
            filterOnTap: () => showDialog(
              context: context,
              builder: (dialogContext) => GenericFilterDialog(
                filterOptions: [
                  FilterOption(
                    value: 'all',
                    label: S.of(context).all,
                    onTap: () => context.read<UserCubit>().filterUsers('all'),
                  ),
                  FilterOption(
                    value: 'active',
                    label: S.of(context).active,
                    onTap: () => context.read<UserCubit>().filterUsers('active'),
                  ),
                  FilterOption(
                    value: 'inactive',
                    label: S.of(context).inactive,
                    onTap: () => context.read<UserCubit>().filterUsers('inactive'),
                  ),
                ],
              ),
            ),
          ),
          RefreshIndicator(
            onRefresh: () => context.read<UserCubit>().getUsers(),
            color: Theme.of(context).colorScheme.primary,
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is GetUsersSuccess) {
                  return CommonAdminListView(
                    item: (context, index) =>
                        UserDetailCard(user: state.users[index]),
                    itemCount: state.users.length,
                  );
                } else if (state is GetUsersFailure) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(18.r),
                      child: Text(state.message),
                    ),
                  );
                } else if (state is GetUsersLoading) {
                  return const ShimmerLoadingList();
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
