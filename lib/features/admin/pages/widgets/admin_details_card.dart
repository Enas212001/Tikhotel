import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/widgets/card_detail.dart';
import 'package:ticket_flow/features/admin/pages/widgets/edit_or_delete.dart';

class AdminDeatailsCard extends StatelessWidget {
  const AdminDeatailsCard({
    super.key,
    required this.topCard,
    required this.bottomCard,
    required this.deleteWidget,
    required this.route,
  });
  final Widget topCard, bottomCard, deleteWidget;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Stack(
        children: [
          DetailCard(topCard: topCard, bottomCard: bottomCard),
          EditOrDelete(route: route, deleteWidget: deleteWidget),
        ],
      ),
    );
  }
}
