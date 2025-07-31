import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/widgets/form_with_title.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/department_drop_down_menu.dart';
import 'package:ticket_flow/features/home/presentation/manager/cubit/report_cubit.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/generated/l10n.dart';

class ReportByDate extends StatelessWidget {
  const ReportByDate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportCubit, ReportState>(
      listener: (context, state) {
        if (state is FetchReportByDateFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          log(state.message);
        } else if (state is FetchReportByDateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Report fetched successfully!")),
          );
          context.read<ReportCubit>().generatePdf(state.reports);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ReportCubit>();
        return Padding(
          padding: const EdgeInsets.all(16),
          child: FormWithTitle(
            title: S.of(context).reportByDate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                CustomRequestTextField(
                  label: S.of(context).dateFrom,
                  controller: cubit.dateFromController,
                  isDate: true,
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      cubit.dateFromController.text =
                          "${picked.year}-${picked.month}-${picked.day}";
                    }
                  },
                ),
                SizedBox(height: 12.h),
                CustomRequestTextField(
                  label: S.of(context).dateTo,
                  controller: cubit.dateToController,
                  isDate: true,
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      cubit.dateToController.text =
                          "${picked.year}-${picked.month}-${picked.day}";
                    }
                  },
                ),
                SizedBox(height: 12.h),
                DepartmentDropDown(
                  value: cubit.selectedDepartment,
                  onChanged: (value) =>
                      cubit.selectedDepartment = value, // ✅ updates cubit
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  text: state is FetchReportByDateLoading
                      ? S.of(context).loading
                      : S.of(context).generate,
                  onPressed: () => cubit.getReportByDate(),
                  isPrimary: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DateItem extends StatelessWidget {
  const DateItem({super.key, required this.label, this.controller, this.onTap});

  final String label;
  final TextEditingController? controller;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Padding(
          padding: EdgeInsets.all(10.r),
          child: SvgPicture.asset(Assets.imagesDate),
        ),
        border: borderOutlined(),
        enabledBorder: borderOutlined(),
        focusedBorder: borderOutlined(),
      ),
      onTap: onTap,
    );
  }

  OutlineInputBorder borderOutlined() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: AppColors.border, width: 1.w),
    );
  }
}
