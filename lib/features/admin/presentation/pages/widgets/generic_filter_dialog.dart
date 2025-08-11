import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/requested_by.dart';

class FilterOption {
  final String value;
  final String label;
  final VoidCallback onTap;

  FilterOption({
    required this.value,
    required this.label,
    required this.onTap,
  });
}

class GenericFilterDialog extends StatelessWidget {
  final List<FilterOption> filterOptions;

  const GenericFilterDialog({
    super.key,
    required this.filterOptions,
  });

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
            top: 150.h,
            right: 24.w,
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
                children: filterOptions
                    .map((option) => RequestTypeCheckbox(
                          title: option.label,
                          onTap: () {
                            Navigator.of(context).pop();
                            option.onTap();
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
