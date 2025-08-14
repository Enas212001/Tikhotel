import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/core/utils/widgets/pagination_controller.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/presentation/manager/problem_cubit/problem_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/common_admin_list_view.dart';
import 'widgets/problem_card.dart';

class ProblemsBody extends StatelessWidget {
  const ProblemsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProblemCubit, ProblemState>(
      listener: (context, state) {
        if (state is ProblemAdded) {
          context.read<ProblemCubit>().getProblems();
        }
        if (state is ProblemEdited) {
          context.read<ProblemCubit>().getProblems();
        }
        if (state is ProblemDeleted) {
          showToast(state.message);
          context.read<ProblemCubit>().getProblems();
          context.pop();
        }
      },
      child: Column(
        children: [
          AddFilterWidget(
            title: S.of(context).addProblem,
            onTap: () async {
              await context.push(AppRoutes.addProblem);
              context.read<ProblemCubit>().getProblems();
            },
          ),
          BlocBuilder<ProblemCubit, ProblemState>(
            builder: (context, state) {
              if (state is ProblemFetching) {
                return const ShimmerLoadingList();
              }
              if (state is ProblemFetchingError) {
                return Center(child: Text(state.error));
              }
              if (state is ProblemFetched) {
                final totalPages =
                    (state.problems.pagination!.total! / state.problems.pagination!.limit!).ceil();
                return Column(
                  children: [
                    PaginationControls(
                      currentPage: state.problems.pagination!.page!,
                      totalPages: totalPages,
                      onPageSelected: (page) {
                        context.read<ProblemCubit>().getProblems(page: page);
                      },
                    ),
                    CommonAdminListView(
                      item: (context, index) =>
                          ProblemCard(problem: state.problems.data![index]),
                      itemCount: state.problems.data?.length ?? 0,
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
