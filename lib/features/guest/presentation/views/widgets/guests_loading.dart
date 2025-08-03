import 'package:flutter/material.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';

class GuestsLoadingShimmer extends StatelessWidget {
  const GuestsLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ShimmerCard(),
        childCount: 6,
      ),
    );
  }
}
