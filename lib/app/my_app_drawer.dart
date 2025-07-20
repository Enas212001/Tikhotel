import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      child: ListView(
        children: [
          DrawerHeader(child: Image.asset(Assets.imagesLogo)),
          DrawerItem(
            image: Assets.imagesDashboard,
            title: 'Dashboard',
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.dashboard);
            },
          ),
          DrawerItem(
            image: Assets.imagesGuests,
            title: 'Guests',
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.guest);
            },
          ),
          DrawerItem(
            image: Assets.imagesRequest,
            title: 'New Requests',
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.newRequest);
            },
          ),
          DrawerItem(
            image: Assets.imagesFeedback,
            title: 'Feedback',
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.feedback);
            },
          ),
          DrawerItem(
            image: Assets.imagesClosedFeedback,
            title: 'Closed Feedback',
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.closedFeedback);
            },
          ),
          DrawerItem(
            image: Assets.imagesClosedWorkOrder,
            title: 'Closed Work Orders',
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.closedWorkOrder);
            },
          ),
          DrawerItem(
            image: Assets.imagesReport,
            title: 'Reports',
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.report);
            },
          ),
          DrawerItem(
            image: Assets.imagesAdmin,
            title: 'Administration',
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.admin);
            },
          ),
          DrawerItem(image: Assets.imagesLogout, title: 'Logout', onTap: () {}),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });
  final String title, image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(image),
      title: Text(title, style: TextStyles.text14RegularGrey),
      onTap: onTap,
    );
  }
}
