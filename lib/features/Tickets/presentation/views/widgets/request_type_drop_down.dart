import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/border_text_field.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_model.dart';
import 'package:ticket_flow/features/admin/presentation/manager/request_type_cubit/request_type_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

class RequestTypeDropDown extends StatelessWidget {
  const RequestTypeDropDown({super.key, this.value, this.onChanged});

  final RequestTypeModel? value;
  final ValueChanged<RequestTypeModel?>? onChanged;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestTypeCubit()..getRequestTypes(),
      child: BlocBuilder<RequestTypeCubit, RequestTypeState>(
        builder: (context, state) {
          if (state is RequestTypeLoaded) {
            return Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: DropdownButtonFormField<RequestTypeModel>(
                value: value,
                style: TextStyles.text12LightGrey,
                decoration: InputDecoration(
                  labelText: S.of(context).requestType,
                  border: borderTextField(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyles.text14RegularGrey,
                ),
                items: state.requestTypes
                    .map(
                      (location) => DropdownMenuItem<RequestTypeModel>(
                        value: location,
                        child: Text(location.requestType ?? ''),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
                validator: (value) => value == null
                    ? S.of(context).pleaseSelect(S.of(context).requestType)
                    : null,
              ),
            );
          } else if (state is RequestTypeFailure) {
            return Center(child: Text(state.error));
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
