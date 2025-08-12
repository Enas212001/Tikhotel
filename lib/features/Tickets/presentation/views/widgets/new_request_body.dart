import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/ticket_cubit/ticket_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/generic_filter_dialog.dart';
import 'package:ticket_flow/generated/l10n.dart';

import '../../../../../core/utils/widgets/shimmer_loading.dart';
import '../../../../../core/utils/widgets/top_widget.dart';
import 'request_info_card.dart';
import 'request_type_selection_dialog.dart';

class NewRequestBody extends StatelessWidget {
  const NewRequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TicketCubit>().fetchRequests(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopWidget(
              title: S.of(context).newRequest,
              search: S.of(context).forAnyRequest,
              onChanged: (value) =>
                  context.read<TicketCubit>().searchRequestsTickets(value),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverToBoxAdapter(
            child: AddFilterWidget(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const RequestTypeSelectionDialog(),
                );
              },
              title: S.of(context).newRequest,
              filterOnTap: () => showDialog(
                context: context,
                builder: (dialogContext) => GenericFilterDialog(
                  filterOptions: [
                    FilterOption(
                      value: 'all',
                      label: S.of(context).all,
                      onTap: () =>
                          context.read<TicketCubit>().filterRequestsTickets('all'),
                    ),
                    FilterOption(
                      value: 'new',
                      label: S.of(context).neW,
                      onTap: () =>
                          context.read<TicketCubit>().filterRequestsTickets('new'),
                    ),
                    FilterOption(
                      value: 'accepted',
                      label: S.of(context).accepted,
                      onTap: () =>
                          context.read<TicketCubit>().filterRequestsTickets('accepted'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          BlocBuilder<TicketCubit, TicketState>(
            builder: (context, state) {
              if (state is RequestLoading) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return ShimmerCard();
                  }, childCount: 4),
                );
              }
              if (state is RequestSuccess) {
                if (state.tickets.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(child: Text(S.of(context).noRequests)),
                  );
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return RequestInfoCard(ticket: state.tickets[index]);
                  }, childCount: state.tickets.length),
                );
              }
              if (state is RequestFailure) {
                return SliverFillRemaining(
                  child: Center(child: Text(state.message)),
                );
              }
              return SliverFillRemaining(child: Center(child: Text('No data')));
            },
          ),
        ],
      ),
    );
  }
}
