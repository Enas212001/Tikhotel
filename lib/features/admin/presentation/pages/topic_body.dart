import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/presentation/manager/topic_cubit/topic_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/common_admin_list_view.dart';
import 'widgets/topic_detail_card.dart';

class TopicBody extends StatelessWidget {
  const TopicBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TopicCubit, TopicState>(
      listener: (context, state) {
        if (state is TopicDeleted) {
          context.read<TopicCubit>().getTopics();
          context.pop();
        } else if (state is TopicEdited) {
          context.read<TopicCubit>().getTopics();
        } else if (state is TopicDeletingError || state is TopicEditingError) {
          showToast(state.toString());
        } else if (state is TopicDeleting) {
          Center(child: CircularProgressIndicator(color: AppColors.primary));
        }
      },
      child: Column(
        children: [
          AddFilterWidget(
            title: S.of(context).addTopic,
            onTap: () async {
              await context.push(AppRoutes.addTopic);
              context.read<TopicCubit>().getTopics();
            },
          ),
          BlocBuilder<TopicCubit, TopicState>(
            builder: (context, state) {
              if (state is TopicFetching) {
                return const ShimmerLoadingList();
              } else if (state is TopicFetchingError) {
                return Center(child: Text(state.error));
              } else if (state is TopicFetched) {
                return CommonAdminListView(
                  item: (context, index) =>
                      TopicDetailCard(topic: state.topics[index]),
                  itemCount: state.topics.length,
                );
              }
              return const ShimmerLoadingList();
            },
          ),
        ],
      ),
    );
  }
}
