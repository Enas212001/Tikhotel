import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/features/admin/pages/widgets/department_card.dart';

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
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => DepartmentDetailCard(),
        ),
      ],
    );
  }
}
