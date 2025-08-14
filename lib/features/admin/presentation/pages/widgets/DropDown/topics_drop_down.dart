import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/border_text_field.dart';
import 'package:ticket_flow/core/func/dropdown_decoration.dart';
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
            final problems =
                state.problems.data
                    ?.where((p) => p.departmentId == selectedDepartment?.id)
                    .toList() ??
                [];
            if (problems.isEmpty) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: DropdownSearch<ProblemItem>(
                selectedItem: value,
                compareFn: (item, selectedItem) => item.id == selectedItem.id,
                items: (filter, _) {
                  if (filter.isEmpty) return problems;
                  return problems
                      .where(
                        (p) => (p.topic ?? '').toLowerCase().contains(
                          filter.toLowerCase(),
                        ),
                      )
                      .toList();
                },
                itemAsString: (item) => item.topic ?? '',
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    labelText: S.of(context).problem,
                    border: borderTextField(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyles.text14RegularGrey,
                  ),
                ),
                popupProps: dropdownDecoration<ProblemItem>(context),
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
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
