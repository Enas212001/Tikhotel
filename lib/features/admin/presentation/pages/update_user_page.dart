import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user_model.dart';
import 'package:ticket_flow/features/admin/presentation/manager/cubit/user_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/update_user_body.dart';

class UpdateUserPage extends StatelessWidget {
  const UpdateUserPage({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => UserCubit()..getRoles(),
          child: Column(
            children: [
              CustomAppBar(text: S.of(context).updateUser),
              UpdateUserBody(user: user),
            ],
          ),
        ),
      ),
    );
  }
}
