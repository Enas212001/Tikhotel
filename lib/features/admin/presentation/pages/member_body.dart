import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';

import 'widgets/common_admin_list_view.dart';
import 'widgets/member_card.dart';

class MemberBody extends StatelessWidget {
  const MemberBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddFilterWidget(
          title: 'Add Member',
          onTap: () {
            context.push(AppRoutes.addMember);
          },
        ),
        CommonAdminListView(
          item: (context, index) => MemberCard(),
          itemCount: 10,
        ),
      ],
    );
  }
}
