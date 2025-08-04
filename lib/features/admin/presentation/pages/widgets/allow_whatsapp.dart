import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/generated/l10n.dart';

class AllowWhatsApp extends StatelessWidget {
  const AllowWhatsApp({super.key, required this.value, this.onChanged});

  final bool value;
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(S.of(context).allowWhatsapp),
      trailing: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
        ),
      ),
    );
  }
}
