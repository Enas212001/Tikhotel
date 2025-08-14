import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/core/utils/widgets/pagination_controller.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/presentation/manager/topic_cubit/topic_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/generic_filter_dialog.dart';
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
            filterOnTap: () => showDialog(
              context: context,
              builder: (dialogContext) => GenericFilterDialog(
                filterOptions: [
                  FilterOption(
                    value: 'all',
                    label: S.of(context).all,
                    onTap: () => context.read<TopicCubit>().filterTopics('all'),
                  ),
                  FilterOption(
                    value: 'active',
                    label: S.of(context).active,
                    onTap: () =>
                        context.read<TopicCubit>().filterTopics('active'),
                  ),
                  FilterOption(
                    value: 'inactive',
                    label: S.of(context).inactive,
                    onTap: () =>
                        context.read<TopicCubit>().filterTopics('inactive'),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<TopicCubit, TopicState>(
            buildWhen: (previous, current) => current is! TopicFetching,
            builder: (context, state) {
              if (state is TopicFetching) {
                return const ShimmerLoadingList();
              } else if (state is TopicFetchingError) {
                return Center(child: Text(state.error));
              } else if (state is TopicFetched) {
                final totalPages =
                    (state.topics.pagination!.total! /
                            state.topics.pagination!.limit!)
                        .ceil();
                return Column(
                  children: [
                    PaginationControls(
                      currentPage: state.topics.pagination!.page!,
                      totalPages: totalPages,
                      onPageSelected: (page) {
                        context.read<TopicCubit>().getTopics(page: page);
                      },
                    ),
                    CommonAdminListView(
                      item: (context, index) =>
                          TopicDetailCard(topic: state.topics.data![index]),
                      itemCount: state.topics.data!.length,
                    ),
                  ],
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
