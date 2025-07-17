import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';

class ProblemsBody extends StatelessWidget {
  const ProblemsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [AddFilterWidget(title: 'Add Problem', onTap: () {})],
    );
  }
}