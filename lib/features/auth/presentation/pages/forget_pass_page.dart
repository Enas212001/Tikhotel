import 'package:flutter/material.dart';

import 'widgets/back_icon.dart';
import 'widgets/forget_pass_body.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackIcon()),
      body: ForgetPassBody(),
    );
  }
}
