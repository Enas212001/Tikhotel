import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_model.dart';
import 'package:ticket_flow/features/admin/presentation/manager/request_type_cubit/request_type_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/update_type_body.dart';

class UpdateTypePage extends StatelessWidget {
  const UpdateTypePage({super.key, required this.requestType});
  final RequestTypeModel requestType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => RequestTypeCubit(),
          child: Column(
            children: [
              CustomAppBar(text: S.of(context).updateRequestType),
              UpdateTypeBody(requestType: requestType),
            ],
          ),
        ),
      ),
    );
  }
}
