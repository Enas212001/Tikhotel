import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/widgets/common_page_widget.dart';
import 'package:ticket_flow/features/guest/presentation/manager/cubit/guest_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'guest_card.dart';
import 'guests_loading.dart';

class GuestBody extends StatelessWidget {
  const GuestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<GuestCubit>().fetchGuests(),
      color: AppColors.primary,
      child: BlocBuilder<GuestCubit, GuestState>(
        builder: (context, state) {
          if (state is GuestLoading) {
            return GuestsLoadingShimmer();
          }
          if (state is GuestFailure) {
            log(state.message);
            return CommonPageWidget(
              title: S.of(context).guests,
              search: S.of(context).forAnyGuest,
              listView: SliverFillRemaining(
                child: Center(child: Text(state.message)),
              ),
            );
          }
          if (state is GuestSuccess) {
            return CommonPageWidget(
              title: S.of(context).guests,
              search: S.of(context).forAnyGuest,
              listView: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return GuestCard(guest: state.guests[index]);
                }, childCount: state.guests.length),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
