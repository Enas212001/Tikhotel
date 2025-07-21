import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/features/guest/presentation/manager/cubit/guest_cubit.dart';

import 'widgets/guest_body.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: BlocProvider(
        create: (context) => GuestCubit()..fetchGuests(),
        child: GuestBody(),
      ),
    );
  }
}
