import 'package:flutter/material.dart';

import 'widgets/new_request_body.dart';

class NewRequestPage extends StatelessWidget {
  const NewRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NewRequestBody());
  }
}
