import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/widgets/card_detail.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/edit_or_delete.dart';

class AdminDeatailsCard extends StatelessWidget {
  const AdminDeatailsCard({
    super.key,
    required this.topCard,
    required this.bottomCard,
    required this.onDelete,
    required this.route,
    required this.date,
  });
  final Widget topCard, bottomCard;
  final VoidCallback onDelete;
  final String route;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Stack(
        children: [
          DetailCard(topCard: topCard, bottomCard: bottomCard, date: date),
          EditOrDelete(route: route, onDelete: onDelete),
        ],
      ),
    );
  }
}
