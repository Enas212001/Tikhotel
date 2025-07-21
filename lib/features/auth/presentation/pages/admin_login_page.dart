import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:ticket_flow/features/auth/presentation/pages/widgets/back_icon.dart';

import 'widgets/admin_login_body.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackIcon()),
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: AdminLoginBody(),
      ),
    );
  }
}
