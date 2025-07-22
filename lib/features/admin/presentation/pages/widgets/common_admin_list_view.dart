import 'package:flutter/material.dart';

class CommonAdminListView extends StatelessWidget {
  const CommonAdminListView({
    super.key,
    required this.item,
    required this.itemCount,
  });
  final Widget? Function(BuildContext, int) item;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: item,
    );
  }
}
