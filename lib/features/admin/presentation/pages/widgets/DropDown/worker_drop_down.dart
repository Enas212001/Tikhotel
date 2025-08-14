import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/border_text_field.dart';
import 'package:ticket_flow/core/func/dropdown_decoration.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/worker_cubit/worker_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

class WorkerDropDown extends StatelessWidget {
  const WorkerDropDown({super.key, this.value, this.onChanged});

  final WorkerItem? value;
  final ValueChanged<WorkerItem?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkerCubit()..getAllWorkers(),
      child: BlocBuilder<WorkerCubit, WorkerState>(
        builder: (context, state) {
          if (state is FetchAllWorkerSuccess) {
            final workers = state.workers;

            if (workers.isEmpty) {
              return const SizedBox.shrink();
            }

            return Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: DropdownSearch<WorkerItem>(
                selectedItem: value,
                compareFn: (item, selected) => item.id == selected.id,
                items: (filter, _) {
                  if (filter.isEmpty) return workers;
                  return workers
                      .where(
                        (w) => (w.fname ?? '').toLowerCase().contains(
                          filter.toLowerCase(),
                        ),
                      )
                      .toList();
                },
                itemAsString: (item) => item.fname ?? '',
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    labelText: S.of(context).worker,
                    border: borderTextField(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyles.text14RegularGrey,
                  ),
                ),
                popupProps: dropdownDecoration<WorkerItem>(context),
                onChanged: onChanged,
                validator: (value) => value == null
                    ? S.of(context).pleaseSelect(S.of(context).worker)
                    : null,
              ),
            );
          } else if (state is FetchAllWorkerFailure) {
            return Center(child: Text(state.message));
          } else if (state is FetchAllWorkerLoading) {
            return ShimmerCard(height: 40.h);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
