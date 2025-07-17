import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';

class LocationBody extends StatelessWidget {
  const LocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [AddFilterWidget(title: 'Add Location', onTap: () {})],
    );
  }
}
