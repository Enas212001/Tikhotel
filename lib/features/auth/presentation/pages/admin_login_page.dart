import 'package:flutter/material.dart';
import 'package:ticket_flow/features/auth/presentation/pages/widgets/back_icon.dart';

import 'widgets/admin_login_body.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackIcon()),
      body: AdminLoginBody(),
    );
  }
}
