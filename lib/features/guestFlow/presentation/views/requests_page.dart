import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/app/guest_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/features/guestFlow/presentation/manager/ticket_guest_cubit/ticket_guest_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widget/guest_request_card.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GuestDrawer(),
      body: BlocProvider(
        create: (context) => GuestTicketsCubit()..getGuestTicketsData(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: TopWidget(
                title: S.of(context).newRequest,
                search: S.of(context).forAnyRequest,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            BlocBuilder<GuestTicketsCubit, GuestTicketsState>(
              builder: (context, state) {
                if (state is TicketsGuestSuccess) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return GuestRequestCard(
                        ticketModel: state.ticketModel.data![index],
                      );
                    }, childCount: state.ticketModel.data!.length),
                  );
                }
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
