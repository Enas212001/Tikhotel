import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/admin/presentation/manager/worker_cubit/worker_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/add_worker_body.dart';

class AddWorkerPage extends StatelessWidget {
  const AddWorkerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => WorkerCubit(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(text: S.of(context).addWorker),
              AddWorkerBody(),
            ],
          ),
        ),
      ),
    );
  }
}
