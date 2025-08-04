import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/cubit/ticket_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'closed_feedback_card.dart';
import '../../../../../core/utils/widgets/shimmer_loading.dart';

class ClosedFeedBackBody extends StatelessWidget {
  const ClosedFeedBackBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TicketCubit>().fetchClosedFeedbackTickets(),
      color: AppColors.newColor,
      child: BlocBuilder<TicketCubit, TicketState>(
        builder: (context, state) {
          if (state is TicketClosedFeedbackLoading) {
            return CommonPageWidget(
              title: S.of(context).closedFeedback,
              search: S.of(context).forAnyClosedFeedback,
              listView: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ShimmerCard();
                }, childCount: 7),
              ),
            );
          }
          if (state is TicketClosedFeedbackSuccess) {
            return CommonPageWidget(
              title: S.of(context).closedFeedback,
              search: S.of(context).forAnyClosedFeedback,
              onChanged: (value) => context
                  .read<TicketCubit>()
                  .searchClosedFeedbackTickets(value),
              listView: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ClosedFeedbackCard(ticket: state.tickets[index]);
                }, childCount: state.tickets.length),
              ),
            );
          }
          if (state is TicketClosedFeedbackFailure) {
            return CommonPageWidget(
              title: S.of(context).closedFeedback,
              search: S.of(context).forAnyClosedFeedback,
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
