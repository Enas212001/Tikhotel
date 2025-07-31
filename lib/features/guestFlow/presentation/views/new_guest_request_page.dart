import 'package:flutter/material.dart';
import 'package:ticket_flow/app/guest_drawer.dart';

import 'widget/new_request_guest_body.dart';

class NewGuestRequestPage extends StatelessWidget {
  const NewGuestRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: GuestDrawer(), body: NewRequestGuestBody());
  }
}
