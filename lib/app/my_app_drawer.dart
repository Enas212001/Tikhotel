import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'drawer.item.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      child: ListView(
        children: [
          Image.asset(Assets.imagesLogo, height: 150.h),
          DrawerItem(
            image: Assets.imagesDashboard,
            title: S.of(context).dashboard,
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.dashboard);
            },
          ),
          DrawerItem(
            image: Assets.imagesGuests,
            title: S.of(context).guests,
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.guest);
            },
          ),
          DrawerItem(
            image: Assets.imagesRequest,
            title: S.of(context).newRequest,
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.newRequest);
            },
          ),
          DrawerItem(
            image: Assets.imagesFeedback,
            title: S.of(context).feedback,
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.feedback);
            },
          ),
          DrawerItem(
            image: Assets.imagesClosedFeedback,
            title: S.of(context).closedFeedback,
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.closedFeedback);
            },
          ),
          DrawerItem(
            image: Assets.imagesClosedWorkOrder,
            title: S.of(context).closedWorkOrder,
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.closedWorkOrder);
            },
          ),
          DrawerItem(
            image: Assets.imagesReport,
            title: S.of(context).reports,
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.report);
            },
          ),
          DrawerItem(
            image: Assets.imagesAdmin,
            title: S.of(context).administration,
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.admin);
            },
          ),
          BlocProvider(
            create: (context) => AuthCubit(),
            child: Builder(
              builder: (blocContext) {
                return BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LogoutSuccess) {
                      context.go(AppRoutes.onboarding);
                    } else if (state is LogoutFailure) {
                      showToast(state.message);
                    }
                  },
                  builder: (context, state) {
                    return DrawerItem(
                      image: Assets.imagesLogout,
                      title: S.of(blocContext).logout,
                      onTap: () {
                        BlocProvider.of<AuthCubit>(blocContext).logout();
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
