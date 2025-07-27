import 'package:flutter/material.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_item.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class UpdateProblemBody extends StatelessWidget {
  const UpdateProblemBody({super.key, required this.problem});
  final ProblemItem problem;

  @override
  Widget build(BuildContext context) {
    return AddOrUpdatePage(
      child: Column(
        children: [
          CustomRequestTextField(
            label: S.of(context).problemTopic,
            isReadOnly: false,
            value: problem.topic ?? '',
          ),
          CustomRequestTextField(
            label: S.of(context).department,
            isList: true,
            value: problem.departmentId.toString(),
          ),
          CustomRequestTextField(
            label: S.of(context).sla,
            isReadOnly: false,
            value: problem.sla.toString(),
          ),
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
