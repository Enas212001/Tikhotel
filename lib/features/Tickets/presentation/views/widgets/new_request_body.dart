import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/cubit/ticket_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import '../../../../../core/utils/widgets/top_widget.dart';
import 'request_info_card.dart';
import 'request_type_selection_dialog.dart';
import '../../../../../core/utils/widgets/shimmer_loading.dart';

class NewRequestBody extends StatelessWidget {
  const NewRequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<TicketCubit>().fetchRequests(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopWidget(
              title: S.of(context).newRequest,
              search: S.of(context).forAnyRequest,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverToBoxAdapter(
            child: AddFilterWidget(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const RequestTypeSelectionDialog(),
                );
              },
              title: S.of(context).newRequest,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          BlocBuilder<TicketCubit, TicketState>(
            builder: (context, state) {
              if (state is RequestLoading) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return ShimmerCard();
                  }, childCount: 7),
                );
              }
              if (state is RequestSuccess) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return RequestInfoCard(ticket: state.tickets[index]);
                  }, childCount: state.tickets.length),
                );
              }
              if (state is RequestFailure) {
                return SliverFillRemaining(
                  child: Center(child: Text(state.message)),
                );
              }
              return SliverFillRemaining(child: Center(child: Text('No data')));
            },
          ),
        ],
      ),
    );
  }
}
