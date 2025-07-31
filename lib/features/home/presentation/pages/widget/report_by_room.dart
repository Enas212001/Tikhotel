import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/widgets/form_with_title.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/department_drop_down_menu.dart';
import 'package:ticket_flow/features/home/presentation/manager/cubit/report_cubit.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'location_drop_down.dart';

class ReportByRoom extends StatelessWidget {
  const ReportByRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportCubit(),
      child: BlocConsumer<ReportCubit, ReportState>(
        listener: (context, state) {
          if (state is FetchReportByRoomFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            log(state.message);
          } else if (state is FetchReportByRoomSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Room report fetched successfully!"),
              ),
            );
            context.read<ReportCubit>().generatePdfByRoom(
              state.reports,
              context.read<ReportCubit>().selectedLocation?.location ??
                  'Unknown',
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ReportCubit>();
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16.r) +
                EdgeInsets.only(bottom: 16.h),
            child: FormWithTitle(
              title: S.of(context).reportByRoom,
              child: Column(
                children: [
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
                  LocationDropDown(
                    value: cubit.selectedLocation,
                    onChanged: (value) => cubit.selectedLocation = value,
                  ),
                  DepartmentDropDown(
                    value: cubit.selectedDepartment,
                    onChanged: (value) => cubit.selectedDepartment = value,
                  ),
                  CustomButton(
                    text: state is FetchReportByRoomFailure
                        ? S.of(context).loading
                        : S.of(context).generate,
                    onPressed: () => cubit.getReportByRoom(),
                    isPrimary: true,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
