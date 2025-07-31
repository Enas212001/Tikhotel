import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'requested_by.dart';

class RequestTypeSelectionDialog extends StatelessWidget {
  const RequestTypeSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            top: 100.h,
            left: 24.w,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RequestTypeCheckbox(
                    title: S.of(context).guest,
                    onTap: () {
                      Navigator.of(context).pop();
                      GoRouter.of(context).push(AppRoutes.addRequest);
                      getIt.get<CacheHelper>().saveData(
                        key: CacheKey.requestedBy,
                        value: 'Guest',
                      );
                    },
                  ),
                  RequestTypeCheckbox(
                    title: S.of(context).sampleDataWorkOrder,
                    onTap: () {
                      Navigator.of(context).pop();
                      GoRouter.of(context).push(AppRoutes.addRequest);
                      getIt.get<CacheHelper>().saveData(
                        key: CacheKey.requestedBy,
                        value: 'Work Order',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
