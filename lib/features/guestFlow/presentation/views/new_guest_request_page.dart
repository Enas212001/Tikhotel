import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/app/guest_drawer.dart';
import 'package:ticket_flow/features/guestFlow/presentation/manager/ticket_guest_cubit/ticket_guest_cubit.dart';

import 'widget/new_request_guest_body.dart';

class NewGuestRequestPage extends StatelessWidget {
  const NewGuestRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GuestDrawer(),
      body: BlocProvider(
        create: (context) => GuestTicketsCubit(),
        child: NewRequestGuestBody(),
      ),
    );
  }
}
