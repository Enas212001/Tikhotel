import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/presentation/manager/request_type_cubit/request_type_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class AddTypeBody extends StatelessWidget {
  const AddTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RequestTypeCubit>();
    return BlocConsumer<RequestTypeCubit, RequestTypeState>(
      listener: (context, state) {
        if (state is RequestTypeAdded) {
          showToast(state.requestType.requestType ?? '');
          context.pop();
        } else if (state is RequestTypeAddFailure) {
          showToast(state.error);
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formAddRequestTypeKey,
          child: AddOrUpdatePage(
            child: Column(
              children: [
                CustomRequestTextField(
                  label: S.of(context).requestType,
                  isReadOnly: false,
                  controller: cubit.requestTypeControllerAdd,
                ),
              ],
            ),
            onPressed: () {
              if (cubit.formAddRequestTypeKey.currentState!.validate()) {
                cubit.addRequestType();
              }
            },
          ),
        );
      },
    );
  }
}
