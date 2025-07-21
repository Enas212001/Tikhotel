import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/cubit/ticket_cubit.dart';

import 'feedback_card.dart';
import 'shimmer_loading.dart';

class FeedbackBody extends StatelessWidget {
  const FeedbackBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TicketCubit>().fetchFeedbackTickets(),
      color: AppColors.newColor,
      child: BlocBuilder<TicketCubit, TicketState>(
        builder: (context, state) {
          if (state is TicketFeedbackLoading) {
            return CommonPageWidget(
              title: 'Feedback',
              search: 'for any feedback',
              listView: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const ShimmerCard(),
                  childCount: 6,
                ),
              ),
            );
          }
          if (state is TicketFeedbackSuccess) {
            return CommonPageWidget(
              title: 'Feedback',
              search: 'for any feedback',
              listView: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return FeedbackCard(ticket: state.tickets[index]);
                }, childCount: state.tickets.length),
              ),
            );
          }
          if (state is TicketFeedbackFailure) {
            return CommonPageWidget(
              title: 'Feedback',
              search: 'for any feedback',
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
