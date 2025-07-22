import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/generated/l10n.dart';

class GuestsLoadingShimmer extends StatelessWidget {
  const GuestsLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonPageWidget(
      title: S.of(context).guests,
      search: S.of(context).forAnyGuest,
      listView: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ShimmerCard(),
          childCount: 6,
        ),
      ),
    );
  }
}
