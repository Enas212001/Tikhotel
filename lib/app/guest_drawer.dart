import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'drawer.item.dart';

class GuestDrawer extends StatelessWidget {
  const GuestDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      child: ListView(
        children: [
          DrawerHeader(child: Image.asset(Assets.imagesLogo)),
          DrawerItem(
            image: Assets.imagesClosedFeedback,
            title: S.of(context).requests,
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.requestsGuestPage);
            },
          ),
          DrawerItem(
            image: Assets.imagesNewRequestGuest,
            title: S.of(context).newRequest,
            onTap: () {
              GoRouter.of(
                context,
              ).pushReplacement(AppRoutes.newRequestGuestPage);
            },
          ),
          DrawerItem(
            image: Assets.imagesProfile,
            title: S.of(context).profile,
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.profilePage);
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
