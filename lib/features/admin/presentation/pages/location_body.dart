import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/widgets/add_filter_widget.dart';
import 'package:ticket_flow/core/utils/widgets/pagination_controller.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/presentation/manager/location_cubit/location_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/generic_filter_dialog.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/common_admin_list_view.dart';
import 'widgets/location_card.dart';

class LocationBody extends StatelessWidget {
  const LocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is DeleteLocationSuccess) {
          context.read<LocationCubit>().getLocations();
          context.pop();
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            AddFilterWidget(
              title: S.of(context).addLocation,
              onTap: () async {
                await context.push(AppRoutes.addLocation);
                context.read<LocationCubit>().getLocations();
              },
              filterOnTap: () => showDialog(
                context: context,
                builder: (dialogContext) => GenericFilterDialog(
                  filterOptions: [
                    FilterOption(
                      value: 'all',
                      label: S.of(context).all,
                      onTap: () =>
                          context.read<LocationCubit>().filterLocations('all'),
                    ),
                    FilterOption(
                      value: 'active',
                      label: S.of(context).active,
                      onTap: () => context
                          .read<LocationCubit>()
                          .filterLocations('active'),
                    ),
                    FilterOption(
                      value: 'inactive',
                      label: S.of(context).inactive,
                      onTap: () => context
                          .read<LocationCubit>()
                          .filterLocations('inactive'),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<LocationCubit, LocationState>(
              buildWhen: (previous, current) => current is! LocationsLoading,
              builder: (context, state) {
                if (state is LocationsLoading) {
                  return const ShimmerLoadingList();
                } else if (state is LocationsLoadingError) {
                  return Center(child: Text(state.message));
                } else if (state is LocationsLoaded) {
                  final totalPages =
                      (state.locations.pagination!.total! /
                              state.locations.pagination!.limit!)
                          .ceil();
                  return Column(
                    children: [
                      PaginationControls(
                        currentPage: state.locations.pagination!.page!,
                        totalPages: totalPages,
                        onPageSelected: (page) {
                          context.read<LocationCubit>().getLocations(
                            page: page,
                          );
                        },
                      ),
                      CommonAdminListView(
                        item: (context, index) => LocationCard(
                          location: state.locations.data![index],
                        ),
                        itemCount: state.locations.data!.length,
                      ),
                    ],
                  );
                }
                return ShimmerLoadingList();
              },
            ),
          ],
        );
      },
    );
  }
}
