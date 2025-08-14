import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/border_text_field.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/ticket_cubit/ticket_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

class QuantityDropDown extends StatelessWidget {
  const QuantityDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final quantityList = [0, 1, 2, 3, 4, 5];
    final cubit = context.read<TicketCubit>();
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: DropdownButtonFormField<int>(
        value: cubit.quantity,
        style: TextStyles.text12LightGrey,
        decoration: InputDecoration(
          labelText: S.of(context).quantity,
          border: borderTextField(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyles.text14RegularGrey,
        ),
        items: quantityList
            .map(
              (quantity) => DropdownMenuItem<int>(
                value: quantity,
                child: Text(quantity.toString()),
              ),
            )
            .toList(),
        onChanged: (int? value) => cubit.quantity = value,
        validator: (value) => value == null
            ? S.of(context).pleaseSelect(S.of(context).topic)
            : null,
      ),
    );
  }
}
