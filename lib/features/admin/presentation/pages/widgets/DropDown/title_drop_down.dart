import 'package:flutter/material.dart';
import 'package:ticket_flow/generated/l10n.dart';

import '../drop_down_user.dart';

class TitleDropDown extends StatelessWidget {
  const TitleDropDown({
    super.key,
    this.isEdit = false,
    this.value,
    this.onChanged,
  });

  final bool isEdit;
  final String? value;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropDownUser(
      onChanged: onChanged,
      items: [
        S.of(context).mr,
        S.of(context).ms,
        S.of(context).mrs,
        S.of(context).dr,
        S.of(context).eng,
      ],
      label: S.of(context).title,
      value: value,
    );
  }
}
