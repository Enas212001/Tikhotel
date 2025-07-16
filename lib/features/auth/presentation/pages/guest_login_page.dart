import 'package:flutter/material.dart';

import 'widgets/back_icon.dart';
import 'widgets/guest_login_body.dart';

class GuestLoginPage extends StatelessWidget {
  const GuestLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackIcon()),
      body: GuestLoginBody(),
    );
  }
}
