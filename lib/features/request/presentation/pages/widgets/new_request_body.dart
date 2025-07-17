import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';

import '../../../../../core/utils/widgets/top_widget.dart';
import 'reuest_info_card.dart';

class NewRequestBody extends StatelessWidget {
  const NewRequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: TopWidget(title: 'New Request', search: 'for any request'),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        SliverToBoxAdapter(
          child: AddFilterWidget(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.addRequest);
            },
            title: 'New Request',
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: RequestInfoCard(),
            ),
            childCount: 3,
          ),
        ),
      ],
    );
  }
}
