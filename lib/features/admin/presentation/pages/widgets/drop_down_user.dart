import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/border_text_field.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/generated/l10n.dart';

class DropDownUser extends StatelessWidget {
  const DropDownUser({
    super.key,
    required this.items,
    required this.label,
    this.value,
    this.onChanged,
    this.onTap,
  });
  final String? value;
  final List<String> items;
  final String label;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: DropdownButtonFormField<String>(
        value: value,
        style: TextStyles.text12LightGrey,
        decoration: InputDecoration(
          labelText: label,
          border: borderTextField(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyles.text14RegularGrey,
        ),
        items: items
            .map(
              (status) => DropdownMenuItem(
                value: status,
                child: Text(status, style: TextStyles.text12RegularGrey),
              ),
            )
            .toList(),
        onChanged: onChanged,
        validator: (value) =>
            value == null ? S.of(context).pleaseSelect(label) : null,
        onTap: onTap,
      ),
    );
  }
}
