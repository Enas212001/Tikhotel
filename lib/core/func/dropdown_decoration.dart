import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/border_text_field.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/generated/l10n.dart';

PopupProps<T> dropdownDecoration<T>(BuildContext context) {
  return PopupProps.menu(
    showSearchBox: true,
    fit: FlexFit.loose,
    searchFieldProps: TextFieldProps(
      decoration: InputDecoration(
        hintText: S.of(context).search,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabled: true,
        border: borderTextField(),
        enabledBorder: borderTextField(),
        focusedBorder: borderTextField(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      ),
    ),
    constraints: BoxConstraints(),
    menuProps: MenuProps(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      elevation: 4,
      shadowColor: Colors.black54,
    ),
  );
}
