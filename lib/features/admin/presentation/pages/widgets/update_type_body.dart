import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/request_type_cubit/request_type_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class UpdateTypeBody extends StatelessWidget {
  const UpdateTypeBody({super.key, required this.requestType});
  final RequestTypeItem requestType;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RequestTypeCubit>();
    return BlocConsumer<RequestTypeCubit, RequestTypeState>(
      listener: (context, state) {
        if (state is RequestTypeEdited) {
          context.pop();
        } else if (state is RequestTypeEditFailure) {
          showToast(state.error);
          log(state.error);
        } else if (state is RequestTypeEditing) {
          Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        return AddOrUpdatePage(
          child: Column(
            children: [
              CustomRequestTextField(
                label: S.of(context).requestType,
                isReadOnly: false,
                value: requestType.requestType ?? '',
                onChanged: (value) {
                  cubit.requestTypeControllerEdit.text = value;
                },
              ),
            ],
          ),
          onPressed: () {
            cubit.editRequestType(requestType: requestType);
          },
        );
      },
    );
  }
}
