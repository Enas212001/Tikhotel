import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'top_widget.dart';

class CommonPageWidget extends StatelessWidget {
  const CommonPageWidget({
    super.key,
    required this.title,
    required this.search,
    required this.listView,
    this.onChanged,
    this.footer,
  });
  final String title, search;
  final Widget listView;
  final ValueChanged<String>? onChanged;
  final Widget? footer;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: TopWidget(title: title, search: search, onChanged: onChanged),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        listView,
        SliverToBoxAdapter(child: footer),
      ],
    );
  }
}
