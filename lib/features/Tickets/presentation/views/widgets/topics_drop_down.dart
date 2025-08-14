import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/border_text_field.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_item.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/problem_cubit/problem_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

class ProblemsDropDown extends StatelessWidget {
  const ProblemsDropDown({
    super.key,
    this.value,
    this.onChanged,
    this.selectedDepartment,
  });

  final ProblemItem? value;
  final ValueChanged<ProblemItem?>? onChanged;
  final DepartmentItem? selectedDepartment;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProblemCubit()..getAllProblems(),
      child: BlocBuilder<ProblemCubit, ProblemState>(
        builder: (context, state) {
          if (state is AllProblemFetched) {
            if (state.problems.data?.isEmpty ?? true) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: DropdownButtonFormField<ProblemItem>(
                value: value,
                style: TextStyles.text12LightGrey,
                decoration: InputDecoration(
                  labelText: S.of(context).problem,
                  border: borderTextField(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyles.text14RegularGrey,
                ),
                items: state.problems.data!
                    .where(
                      (problem) =>
                          problem.departmentId == selectedDepartment?.id,
                    )
                    .map(
                      (problem) => DropdownMenuItem<ProblemItem>(
                        value: problem,
                        child: Text(problem.topic ?? ''),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
                validator: (value) => value == null
                    ? S.of(context).pleaseSelect(S.of(context).problem)
                    : null,
              ),
            );
          } else if (state is AllProblemFetchingError) {
            return Center(child: Text(state.error));
          } else if (state is AllProblemFetching) {
            return ShimmerCard(height: 40.h);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
