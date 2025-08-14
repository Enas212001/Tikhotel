import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/department_cubit/department_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

class DepartmentMultiSelect extends StatelessWidget {
  const DepartmentMultiSelect({
    super.key,
    required this.selectedDepartments,
    this.onConfirm,
  });

  final List<DepartmentItem> selectedDepartments;
  final ValueChanged<List<DepartmentItem>>? onConfirm;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentCubit()..fetchDepartments(),
      child: BlocBuilder<DepartmentCubit, DepartmentState>(
        builder: (context, state) {
          if (state is DepartmentFetchSuccess) {
            return Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: MultiSelectDialogField<DepartmentItem>(
                items: state.departments.data!
                    .map(
                      (dept) => MultiSelectItem<DepartmentItem>(
                        dept,
                        dept.name ?? '',
                      ),
                    )
                    .toList(),
                buttonIcon: const Icon(Icons.arrow_drop_down),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                initialValue: selectedDepartments,
                title: Text(
                  S.of(context).department,
                  style: TextStyles.text12LightGrey,
                ),
                buttonText: Text(
                  S.of(context).department,
                  style: TextStyles.text12LightGrey,
                ),
                searchable: true,
                listType: MultiSelectListType.CHIP, // nice chip style
                onConfirm: (values) {
                  if (onConfirm != null) onConfirm!(values);
                },
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return S.of(context).pleaseSelect(S.of(context).department);
                  }
                  return null;
                },
              ),
            );
          } else if (state is DepartmentFetchFailure) {
            return Center(child: Text(state.message));
          } else if (state is DepartmentFetchLoading) {
            return ShimmerCard(height: 40.h);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
