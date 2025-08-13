import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/presentation/manager/request_type_cubit/request_type_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/generic_filter_dialog.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/common_admin_list_view.dart';
import 'widgets/request_type_card.dart';

class RequestTypesBody extends StatelessWidget {
  const RequestTypesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestTypeCubit, RequestTypeState>(
      listener: (context, state) {
        if (state is RequestTypeDeleted) {
          showToast(state.message);
          context.read<RequestTypeCubit>().getRequestTypes();
          context.pop();
        } else if (state is RequestTypeDeleteFailure) {
          showToast(state.error);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            AddFilterWidget(
              title: S.of(context).addRequestType,
              onTap: () async {
                await context.push(AppRoutes.addRequestType);
                context.read<RequestTypeCubit>().getRequestTypes();
              },
              filterOnTap: () => showDialog(
                context: context,
                builder: (dialogContext) => GenericFilterDialog(
                  filterOptions: [
                    FilterOption(
                      value: 'all',
                      label: S.of(context).all,
                      onTap: () => context
                          .read<RequestTypeCubit>()
                          .filterRequestTypes('all'),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<RequestTypeCubit, RequestTypeState>(
              builder: (context, state) {
                if (state is RequestTypeLoaded) {
                  return CommonAdminListView(
                    item: (context, index) => RequestTypeCard(
                      requestType: state.requestTypes.data![index],
                    ),
                    itemCount: state.requestTypes.data!.length,
                  );
                } else if (state is RequestTypeFailure) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(18.r),
                      child: Text(state.error),
                    ),
                  );
                } else if (state is RequestTypeLoading) {
                  return const ShimmerLoadingList();
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        );
      },
    );
  }
}
