import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/cubit/ticket_cubit.dart';

import 'widgets/closed_work_order_body.dart';

class ClosedWorkOrderPage extends StatelessWidget {
  const ClosedWorkOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: BlocProvider(
        create: (context) => TicketCubit()..fetchClosedWorkOrderTickets(),
        child: ClosedWorkOrderBody(),
      ),
    );
  }
}
