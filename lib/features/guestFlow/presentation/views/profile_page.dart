import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/app/guest_drawer.dart';
import 'package:ticket_flow/features/guestFlow/presentation/manager/cubit/guest_flow_cubit.dart';

import 'widget/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GuestDrawer(),
      body: BlocProvider(
        create: (context) => GuestFlowCubit(),
        child: ProfileBody(),
      ),
    );
  }
}
