import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/ticket_cubit/ticket_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'closed_work_order_card.dart';

class ClosedWorkOrderBody extends StatelessWidget {
  const ClosedWorkOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          context.read<TicketCubit>().fetchClosedWorkOrderTickets(page: 1),
      color: AppColors.newColor,
      child: BlocBuilder<TicketCubit, TicketState>(
        builder: (context, state) {
          if (state is TicketClosedWorkOrderLoading) {
            return CommonPageWidget(
              title: S.of(context).closedWorkOrder,
              search: S.of(context).forAnyClosedWorkOrder,
              listView: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ShimmerCard();
                }, childCount: 7),
              ),
            );
          }
          if (state is TicketClosedWorkOrderSuccess) {
            return CommonPageWidget(
              title: S.of(context).closedWorkOrder,
              search: S.of(context).forAnyClosedWorkOrder,
              onChanged: (value) => context
                  .read<TicketCubit>()
                  .searchClosedWorkOrderTickets(value),
              listView: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ClosedWorkOrderCard(ticket: state.tickets[index]);
                }, childCount: state.tickets.length),
              ),
            );
          }
          if (state is TicketClosedWorkOrderFailure) {
            return CommonPageWidget(
              title: S.of(context).closedWorkOrder,
              search: S.of(context).forAnyClosedWorkOrder,
              listView: SliverFillRemaining(
                child: Center(child: Text(state.message)),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
