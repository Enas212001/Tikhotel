import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/generated/l10n.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.title,
    this.hintText,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String title;
  final String? hintText;
  final bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary,
      enableSuggestions: true,
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).pleaseEnter(widget.title);
        }
        return null;
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: borderTextField(),
        focusedBorder: borderTextField(),
        enabledBorder: borderTextField(),
        hintText: widget.hintText,
        hintStyle: TextStyles.text12RegularLightGrey,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.lightGrey,
                ),
                onPressed: _toggleVisibility,
              )
            : null,
      ),
    );
  }

  OutlineInputBorder borderTextField() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColors.border, width: 1.w),
    );
  }
}
