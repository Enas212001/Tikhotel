import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/core/utils/widgets/pagination_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/cubit/ticket_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'closed_feedback_card.dart';
import '../../../../../core/utils/widgets/shimmer_loading.dart';

class ClosedFeedBackBody extends StatefulWidget {
  const ClosedFeedBackBody({super.key});

  @override
  State<ClosedFeedBackBody> createState() => _ClosedFeedBackBodyState();
}

class _ClosedFeedBackBodyState extends State<ClosedFeedBackBody> {

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TicketCubit>().fetchClosedFeedbackTickets(),
      child: BlocBuilder<TicketCubit, TicketState>(
        builder: (context, state) {
          if (state is TicketClosedFeedbackLoading) {
            return CommonPageWidget(
              title: S.of(context).closedFeedback,
              search: S.of(context).forAnyClosedFeedback,
              listView: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const ShimmerCard(),
                  childCount: 6,
                ),
              ),
            );
          }
          if (state is TicketClosedFeedbackSuccess) {
            return _buildPagedClosedFeedbackList(context, state);
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

  Widget _buildPagedClosedFeedbackList(
    BuildContext context,
    TicketClosedFeedbackSuccess state,
  ) {
    return Column(
      children: [
        // Header with title and search
        TopWidget(
          title: S.of(context).closedFeedback,
          search: S.of(context).forAnyClosedFeedback,
          onChanged: (value) =>
              context.read<TicketCubit>().searchClosedFeedbackTickets(value),
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
                    return ClosedFeedbackCard(ticket: state.tickets[index]);
                  },
                ),
        ),

        // Pagination widget
        PaginationWidget(
          currentPage: state.currentPage,
          totalPages: state.totalPages,
          totalItems: state.totalItems,
          onPageChanged: (page) =>
              context.read<TicketCubit>().goToClosedFeedbackPage(page),
        ),
      ],
    );
  }
}
