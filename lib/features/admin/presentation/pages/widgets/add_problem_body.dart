import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/presentation/manager/problem_cubit/problem_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class AddProblemBody extends StatelessWidget {
  const AddProblemBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProblemCubit>();
    return BlocConsumer<ProblemCubit, ProblemState>(
      listener: (context, state) {
        if (state is ProblemAdded) {
          context.pop();
        } else if (state is ProblemAddingError) {
          showToast(state.error);
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: AddOrUpdatePage(
            child: Column(
              children: [
                CustomRequestTextField(
                  label: S.of(context).problemTopic,
                  isReadOnly: false,
                  controller: cubit.topicController,
                ),
                CustomRequestTextField(
                  label: S.of(context).department,
                  controller: cubit.departmentController,
                  isReadOnly: false,
                ),
                CustomRequestTextField(
                  label: S.of(context).sla,
                  isReadOnly: false,
                  controller: cubit.slaController,
                ),
              ],
            ),
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.addProblem();
              }
            },
          ),
        );
      },
    );
  }
}
