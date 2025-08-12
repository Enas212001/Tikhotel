import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import '../../core/utils/assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _textRevealController;
  late AnimationController _iconAppearMoveController;
  late AnimationController _logoMoveController;

  late Animation<double> _textReveal;
  late Animation<double> _iconOpacity;
  late Animation<double> _iconOffset;
  late Animation<Offset> _logoMove;
  late Animation<double> _logoScale;
  @override
  void initState() {
    super.initState();

    // 1. Initialize all controllers first
    _textRevealController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _iconAppearMoveController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _logoMoveController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // 2. Now create the animations
    _logoScale = Tween<double>(begin: 1.0, end: 0.6).animate(
      CurvedAnimation(parent: _logoMoveController, curve: Curves.easeInOut),
    );
    _textReveal = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textRevealController, curve: Curves.easeIn),
    );
    _iconOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _iconAppearMoveController, curve: Curves.easeIn),
    );
    _iconOffset = Tween<double>(begin: 40.h, end: 0.0).animate(
      CurvedAnimation(parent: _iconAppearMoveController, curve: Curves.easeOut),
    );
    _logoMove = Tween<Offset>(begin: Offset.zero, end: Offset(0, -2.6)).animate(
      CurvedAnimation(parent: _logoMoveController, curve: Curves.easeInOut),
    );

    _startSequence();
  }

  Future<void> _startSequence() async {
    await _textRevealController.forward();
    await _iconAppearMoveController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    await _logoMoveController.forward();
    final cache = getIt<CacheHelper>();
    final isAdminLoggedIn = cache.getData(key: CacheKey.adminLoggedIn) == true;
    final isGuestLoggedIn = cache.getData(key: CacheKey.guestLoggedIn) == true;
    if (isAdminLoggedIn) {
      if (mounted) context.go(AppRoutes.admin);
    } else if (isGuestLoggedIn) {
      if (mounted) context.go(AppRoutes.requestsGuestPage);
    } else {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) context.go('/onboarding');
    }
  }

  @override
  void dispose() {
    _textRevealController.dispose();
    _iconAppearMoveController.dispose();
    _logoMoveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Center(
            child: SlideTransition(
              position: _logoMove,
              child: ScaleTransition(
                scale: _logoScale,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBuilder(
                      animation: _iconAppearMoveController,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _iconOpacity.value,
                          child: Transform.translate(
                            offset: Offset(0, _iconOffset.value),
                            child: child,
                          ),
                        );
                      },
                      child: Image.asset(
                        Assets.imagesLogoIcon,
                        height: 75.h,
                        width: 35.w,
                      ),
                    ),
                    SizeTransition(
                      sizeFactor: _textReveal,
                      axis: Axis.horizontal,
                      axisAlignment: -1.0,
                      child: Image.asset(Assets.imagesLogoText, height: 30.h),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
