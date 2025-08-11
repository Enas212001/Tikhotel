import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';

class PaginationControls extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageSelected;

  const PaginationControls({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.r),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalPages, (index) {
            final pageNumber = index + 1;
            return GestureDetector(
              onTap: () => onPageSelected(pageNumber),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: pageNumber == currentPage
                      ? AppColors.primary
                      : AppColors.border,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  pageNumber.toString(),
                  style: TextStyle(
                    color: pageNumber == currentPage
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
