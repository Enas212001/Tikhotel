import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/admin/presentation/manager/request_type_cubit/request_type_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/add_type_body.dart';

class AddRequestTypePage extends StatelessWidget {
  const AddRequestTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RequestTypeCubit(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(text: S.of(context).addRequestType),
              AddTypeBody(),
            ],
          ),
        ),
      ),
    );
  }
}
