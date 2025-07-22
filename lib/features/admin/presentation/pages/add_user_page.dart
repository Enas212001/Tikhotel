import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/admin/presentation/manager/cubit/user_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/add_user_body.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => UserCubit()..getRoles(),
          child: Column(
            children: [
              CustomAppBar(text: S.of(context).addUser),
              AddUserBody(),
            ],
          ),
        ),
      ),
    );
  }
}
