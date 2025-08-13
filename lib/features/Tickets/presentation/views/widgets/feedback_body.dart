import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/feedback_cubit/feedback_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import '../../../../../core/utils/widgets/shimmer_loading.dart';
import 'feedback_card.dart';

class FeedbackBody extends StatelessWidget {
  const FeedbackBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          context.read<FeedbackCubit>().fetchFeedbackTickets(page: 1),
      color: AppColors.newColor,
      child: BlocBuilder<FeedbackCubit, FeedbackState>(
        builder: (context, state) {
          if (state is TicketFeedbackLoading) {
            return CommonPageWidget(
              title: S.of(context).feedback,
              search: S.of(context).forAnyFeedback,
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
              title: S.of(context).feedback,
              search: S.of(context).forAnyFeedback,
              onChanged: (value) =>
                  context.read<FeedbackCubit>().searchFeedBackTickets(value),
              listView: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      FeedbackCard(ticket: state.tickets.data![index]),
                  childCount: state.tickets.data!.length,
                ),
              ),
            );
          }
          if (state is TicketFeedbackFailure) {
            return CommonPageWidget(
              title: S.of(context).feedback,
              search: S.of(context).forAnyFeedback,
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
