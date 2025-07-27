import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/problem_cubit/problem_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class UpdateProblemBody extends StatelessWidget {
  const UpdateProblemBody({super.key, required this.problem});
  final ProblemItem problem;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProblemCubit>();

    // Initialize controllers if empty
    if (cubit.topicEditController.text.isEmpty) {
      cubit.topicEditController.text = problem.topic ?? '';
    }
    if (cubit.departmentEditController.text.isEmpty) {
      cubit.departmentEditController.text =
          problem.departmentId?.toString() ?? '';
    }
    if (cubit.slaEditController.text.isEmpty) {
      cubit.slaEditController.text = problem.sla?.toString() ?? '';
    }

    return BlocConsumer<ProblemCubit, ProblemState>(
      listener: (context, state) {
        if (state is ProblemEdited) {
          context.pop();
        } else if (state is ProblemEditingError) {
          showToast(state.error);
          log(state.error);
        } else if (state is ProblemEditing) {
          Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        return AddOrUpdatePage(
          child: Column(
            children: [
              CustomRequestTextField(
                label: S.of(context).problemTopic,
                isReadOnly: false,
                value: problem.topic ?? '',
                onChanged: (value) {
                  cubit.topicEditController.text = value;
                },
              ),
              CustomRequestTextField(
                label: S.of(context).department,
                isList: true,
                value: problem.departmentId.toString(),
                onChanged: (value) {
                  cubit.departmentEditController.text = value;
                },
              ),
              CustomRequestTextField(
                label: S.of(context).sla,
                isReadOnly: false,
                value: problem.sla.toString(),
                onChanged: (value) {
                  cubit.slaEditController.text = value;
                },
              ),
            ],
          ),
          onPressed: () {
            cubit.editProblem(id: problem.id.toString());
          },
        );
      },
    );
  }
}
