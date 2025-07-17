import 'package:flutter/material.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';

import 'widgets/guest_card.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: CommonPageWidget(
        title: 'Guests',
        search: 'for any guest',
        listView: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return GuestCard();
          }, childCount: 10),
        ),
      ),
    );
  }
}
