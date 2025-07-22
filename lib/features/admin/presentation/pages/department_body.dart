import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/department_card.dart';

import 'widgets/common_admin_list_view.dart';

class DepartmentBody extends StatelessWidget {
  const DepartmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddFilterWidget(
          title: 'Add Department',
          onTap: () {
            context.push(AppRoutes.addDepartment);
          },
        ),
        CommonAdminListView(
          item: (context, index) => DepartmentDetailCard(),
          itemCount: 10,
        ),
      ],
    );
  }
}
