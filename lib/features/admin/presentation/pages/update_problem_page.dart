import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_item.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/update_problem_body.dart';

class UpdateProblemPage extends StatelessWidget {
  const UpdateProblemPage({super.key, required this.problem});
  final ProblemItem problem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(text: S.of(context).updateProblem),
            UpdateProblemBody(problem: problem),
          ],
        ),
      ),
    );
  }
}
