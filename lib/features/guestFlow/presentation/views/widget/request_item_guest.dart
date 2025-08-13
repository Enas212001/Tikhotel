// ✅ Request Item Widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class RequestItemGuest extends StatelessWidget {
  final String title;
  final String data;
  final double? width;
  const RequestItemGuest({
    super.key,
    required this.title,
    required this.data,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyles.text12RegularLightGrey),
        SizedBox(
          width: width ?? 150.w,
          height: 35.h,
          child: Text(
            data,
            textAlign: TextAlign.center,
            style: TextStyles.text12MeduimGrey,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
