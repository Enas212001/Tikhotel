import 'package:flutter/material.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';

import 'widgets/new_request_body.dart';

class NewRequestPage extends StatelessWidget {
  const NewRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: NewRequestBody(),
    );
  }
}
