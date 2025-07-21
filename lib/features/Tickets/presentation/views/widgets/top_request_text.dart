import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class TopText extends StatelessWidget {
  const TopText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyles.text10MediumWhite);
  }
}
