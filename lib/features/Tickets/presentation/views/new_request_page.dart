import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/features/Tickets/presentation/manager/request_cubit/request_cubit.dart';

import 'widgets/new_request_body.dart';

class NewRequestPage extends StatelessWidget {
  const NewRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: BlocProvider(
        create: (context) => RequestCubit()..fetchRequests(),
        child: NewRequestBody(),
      ),
    );
  }
}
