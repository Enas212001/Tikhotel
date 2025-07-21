import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/cubit/ticket_cubit.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/shimmer_loading.dart';

import 'widgets/closed_work_order_card.dart';

class ClosedWorkOrderPage extends StatelessWidget {
  const ClosedWorkOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: BlocProvider(
        create: (context) => TicketCubit()..fetchClosedWorkOrderTickets(),
        child: ClosedWorkOrderBody(),
      ),
    );
  }
}

class ClosedWorkOrderBody extends StatelessWidget {
  const ClosedWorkOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          context.read<TicketCubit>().fetchClosedWorkOrderTickets(),
      color: AppColors.newColor,
      child: BlocBuilder<TicketCubit, TicketState>(
        builder: (context, state) {
          if (state is TicketClosedWorkOrderLoading) {
            return CommonPageWidget(
              title: 'Closed Work Order',
              search: 'for any closedWorkOrder',
              listView: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ShimmerCard();
                }, childCount: 7),
              ),
            );
          }
          if (state is TicketClosedWorkOrderSuccess) {
            return CommonPageWidget(
              title: 'Closed Work Order',
              search: 'for any closedWorkOrder',
              listView: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ClosedWorkOrderCard(ticket: state.tickets[index]);
                }, childCount: state.tickets.length),
              ),
            );
          }
          if (state is TicketClosedWorkOrderFailure) {
            return CommonPageWidget(
              title: 'Closed Work Order',
              search: 'for any closedWorkOrder',
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
