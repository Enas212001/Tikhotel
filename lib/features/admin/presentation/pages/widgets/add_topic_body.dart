import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/admin/presentation/manager/topic_cubit/topic_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/add_update_page.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/department_drop_down_menu.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/status_drop_down_menu.dart';
import 'package:ticket_flow/generated/l10n.dart';

class AddTopicBody extends StatelessWidget {
  const AddTopicBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TopicCubit>();
    return BlocConsumer<TopicCubit, TopicState>(
      listener: (context, state) {
        if (state is TopicAdded) {
          context.pop();
        } else if (state is TopicAddingError) {
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
                  label: S.of(context).topicName,
                  isReadOnly: false,
                  controller: cubit.topicController,
                ),
                CustomRequestTextField(
                  label: S.of(context).sla,
                  isReadOnly: false,
                  controller: cubit.slaController,
                ),
                DepartmentDropDown(
                  value: cubit.selectedDepartment,
                  onChanged: (value) => cubit.selectedDepartment = value,
                ),
                StatusDropDown(
                  value: cubit.selectedStatus,
                  onChanged: (value) => cubit.selectedStatus = value,
                ),
              ],
            ),
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.addTopic();
              }
            },
          ),
        );
      },
    );
  }
}
