import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/core/utils/widgets/pagination_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/cubit/ticket_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'feedback_card.dart';
import '../../../../../core/utils/widgets/shimmer_loading.dart';

class FeedbackBody extends StatefulWidget {
  const FeedbackBody({super.key});

  @override
  State<FeedbackBody> createState() => _FeedbackBodyState();
}

class _FeedbackBodyState extends State<FeedbackBody> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TicketCubit>().fetchFeedbackTickets(),
      child: BlocBuilder<TicketCubit, TicketState>(
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
            return _buildPagedFeedbackList(context, state);
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

  Widget _buildPagedFeedbackList(
    BuildContext context,
    TicketFeedbackSuccess state,
  ) {
    return Column(
      children: [
        // Header with title and search
        TopWidget(
          title: S.of(context).feedback,
          search: S.of(context).forAnyFeedback,
          onChanged: (value) =>
              context.read<TicketCubit>().searchFeedBackTickets(value),
        ),
        SizedBox(height: 16.h),

        // Tickets list
        Expanded(
          child: state.tickets.isEmpty
              ? Center(
                  child: Text(
                    S.of(context).noDataAvailable,
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state.tickets.length,
                  itemBuilder: (context, index) {
                    return FeedbackCard(ticket: state.tickets[index]);
                  },
                ),
        ),

        // Pagination widget
        PaginationWidget(
          currentPage: state.currentPage,
          totalPages: state.totalPages,
          totalItems: state.totalItems,
          onPageChanged: (page) =>
              context.read<TicketCubit>().goToFeedbackPage(page),
        ),
      ],
    );
  }
}
