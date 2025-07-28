import 'package:flutter/material.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'drop_down_user.dart';

class StatusDropDown extends StatelessWidget {
  const StatusDropDown({
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
      items: [S.of(context).active, S.of(context).inactive],
      label: S.of(context).status,
      value: value,
    );
  }
}
