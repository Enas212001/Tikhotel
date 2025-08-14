import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/presentation/manager/location_cubit/location_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/DropDown/status_drop_down_menu.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'add_update_page.dart';

class AddLocationBody extends StatelessWidget {
  const AddLocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LocationCubit>();
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is AddLocationSuccess) {
          context.pop();
          showToast(S.of(context).locationAdded);
        } else if (state is AddLocationFailed) {
          showToast(state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formAddLocationKey,
          child: AddOrUpdatePage(
            child: Column(
              children: [
                CustomRequestTextField(
                  label: S.of(context).location,
                  isReadOnly: false,
                  controller: cubit.locationController,
                ),
                StatusDropDown(
                  onChanged: (value) => cubit.selectedStatus = value,
                  value: cubit.selectedStatus,
                ),
              ],
            ),
            onPressed: () {
              if (cubit.formAddLocationKey.currentState!.validate()) {
                cubit.addLocation();
              }
            },
          ),
        );
      },
    );
  }
}
