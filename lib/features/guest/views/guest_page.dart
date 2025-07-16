import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';

import 'widgets/guest_card.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonPageWidget(
        title: 'Guests',
        search: 'guest',
        listView: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return GuestCard();
          }, childCount: 10),
        ),
      ),
    );
  }
}
