import 'package:flutter/material.dart';

import 'member_card.dart';

class CommonAdminListView extends StatelessWidget {
  const CommonAdminListView({super.key, this.item, this.itemCount = 10});
  final Widget? item;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) => item ?? MemberCard(),
    );
  }
}
