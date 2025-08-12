import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/pagination_controller.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/ticket_cubit/ticket_cubit.dart';

import 'widgets/closed_work_order_body.dart';

class ClosedWorkOrderPage extends StatelessWidget {
  const ClosedWorkOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TicketCubit()..fetchClosedWorkOrderTickets(),
      child: Scaffold(
        drawer: MyAppDrawer(),
        body: ClosedWorkOrderBody(),
        bottomNavigationBar: BlocBuilder<TicketCubit, TicketState>(
          builder: (context, state) {
            if (state is TicketClosedWorkOrderSuccess) {
              final totalPages =
                  (state.pagination.total! / state.pagination.limit!).ceil();
              return PaginationControls(
                currentPage: state.pagination.page!,
                totalPages: totalPages,
                onPageSelected: (page) {
                  context.read<TicketCubit>().fetchClosedWorkOrderTickets(page: page);
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
