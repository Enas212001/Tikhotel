import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/pagination_controller.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/ticket_cubit/ticket_cubit.dart';

import 'widgets/closed_feedback_body.dart';

class ClosedFeedbackPage extends StatelessWidget {
  const ClosedFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TicketCubit()..fetchClosedFeedbackTickets(),
      child: Scaffold(
        drawer: MyAppDrawer(),
        body: ClosedFeedBackBody(),
        bottomNavigationBar: BlocBuilder<TicketCubit, TicketState>(
          builder: (context, state) {
            if (state is TicketClosedFeedbackSuccess) {
              final totalPages =
                  (state.pagination.total! / state.pagination.limit!).ceil();
              return PaginationControls(
                currentPage: state.pagination.page!,
                totalPages: totalPages,
                onPageSelected: (page) {
                  context.read<TicketCubit>().fetchClosedFeedbackTickets(page: page);
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
