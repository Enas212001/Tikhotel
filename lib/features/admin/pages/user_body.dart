import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';

import 'widgets/common_admin_list_view.dart';
import 'widgets/user_detail_card.dart';

class UsersBody extends StatelessWidget {
  const UsersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddFilterWidget(
          title: 'Add User',
          onTap: () {
            context.push(AppRoutes.addUser);
          },
        ),
        CommonAdminListView(item: UserDetailCard()),
      ],
    );
  }
}
