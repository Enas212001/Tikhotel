import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/assets.dart';

import 'message_text_field.dart';

class MessageReplay extends StatelessWidget {
  final ScrollController scrollController;
  const MessageReplay({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MessageTextField(value: 'test', label: 'Message', isReadOnly: true),
        Positioned(
          top: 16.r,
          right: 16.r,
          child: GestureDetector(
            onTap: () {
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
            child: SvgPicture.asset(Assets.imagesReply),
          ),
        ),
      ],
    );
  }
}
