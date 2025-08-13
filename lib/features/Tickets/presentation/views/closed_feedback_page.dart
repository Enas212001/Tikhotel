import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/pagination_controller.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/closed_feedback_cubit/closed_feedback_cubit.dart';

import 'widgets/closed_feedback_body.dart';

class ClosedFeedbackPage extends StatelessWidget {
  const ClosedFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClosedFeedbackCubit()..fetchClosedFeedbackTickets(),
      child: Scaffold(
        drawer: MyAppDrawer(),
        body: ClosedFeedBackBody(),
        bottomNavigationBar:
            BlocBuilder<ClosedFeedbackCubit, ClosedFeedbackState>(
              builder: (context, state) {
                if (state is TicketClosedFeedbackSuccess) {
                  final totalPages =
                      (state.tickets.pagination!.total! /
                              state.tickets.pagination!.limit!)
                          .ceil();
                  return PaginationControls(
                    currentPage: state.tickets.pagination!.page!,
                    totalPages: totalPages,
                    onPageSelected: (page) {
                      context
                          .read<ClosedFeedbackCubit>()
                          .fetchClosedFeedbackTickets(page: page);
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
      ),
    );
  }
}
