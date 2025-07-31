import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/app/guest_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widget/guest_request_card.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GuestDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopWidget(
              title: S.of(context).newRequest,
              search: S.of(context).forAnyRequest,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return GuestRequestCard();
            }, childCount: 4),
          ),
        ],
      ),
    );
  }
}
