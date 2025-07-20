import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/generated/l10n.dart';

class DetailCard extends StatefulWidget {
  const DetailCard({
    super.key,
    required this.topCard,
    required this.bottomCard,
  });
  final Widget topCard, bottomCard;
  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: containerDecoration(),
      child: Column(
        children: [
          widget.topCard,
          Divider(color: AppColors.divider, height: 1),
          SizedBox(height: 12.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isExpanded
                          ? S.of(context).hideDetails
                          : S.of(context).viewDetails,
                      style: TextStyles.text12RegularGrey.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 18.sp,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text('7/2/2025', style: TextStyles.text12RegularLightGrey),
            ],
          ),
          SizedBox(height: 6.h),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.centerLeft,
            child: isExpanded ? widget.bottomCard : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
