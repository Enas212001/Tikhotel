import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
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
          DrawerItem(
            image: Assets.imagesLogout,
            title: S.of(context).logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
