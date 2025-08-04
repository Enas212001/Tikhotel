import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/features/guestFlow/presentation/manager/cubit/guest_flow_cubit.dart';

import '../../../auth/presentation/pages/widgets/back_icon.dart';
import 'widget/guest_login_body.dart';

class GuestLoginPage extends StatelessWidget {
  const GuestLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackIcon()),
      body: BlocProvider(
        create: (context) => GuestFlowCubit(),
        child: GuestLoginBody(),
      ),
    );
  }
}
