import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/location_cubit/location_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/DropDown/status_drop_down_menu.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class UpdateLocationBody extends StatelessWidget {
  const UpdateLocationBody({super.key, required this.location});
  final LocationItem location;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is EditLocationSuccess) {
          context.pop();
          showToast(S.of(context).locationUpdated);
        }
        if (state is EditLocationFailed) {
          log(state.message);
          showToast(state.message);
        }
      },
      builder: (context, state) {
        final cubit = context.read<LocationCubit>();
        return AddOrUpdatePage(
          child: Column(
            children: [
              CustomRequestTextField(
                label: S.of(context).location,
                value: location.location ?? '',
                isReadOnly: false,
                onChanged: (value) =>
                    cubit.locationEditedController.text = value,
              ),
              StatusDropDown(
                onChanged: (value) => cubit.selectedEditedStatus = value,
                value: cubit.selectedEditedStatus,
              ),
            ],
          ),
          onPressed: () {
            cubit.updateLocation(location: location);
          },
        );
      },
    );
  }
}
