import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/generated/l10n.dart';

import '../../../../../core/utils/widgets/top_widget.dart';
import 'request_info_card.dart';
import 'request_type_selection_dialog.dart';

class NewRequestBody extends StatelessWidget {
  const NewRequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: TopWidget(
            title: S.of(context).newRequest,
            search: S.of(context).forAnyRequest,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        SliverToBoxAdapter(
          child: AddFilterWidget(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const RequestTypeSelectionDialog(),
              );
            },
            title: S.of(context).newRequest,
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
