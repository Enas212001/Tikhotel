import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final Function(int) onPageChanged;
  final bool showPageInfo;

  const PaginationWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    required this.totalItems,
    this.showPageInfo = true,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) return const SizedBox.shrink();

    return Column(
      children: [
        // Pagination controls
        _buildPaginationControls(context),

        // Page info
        if (showPageInfo)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Page $currentPage of $totalPages • $totalItems total items',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
          ),
      ],
    );
  }

  Widget _buildPaginationControls(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
      child: Column(
        children: [
          // Navigation buttons row
          Row(
            children: [
              // Previous button
              SizedBox(
                width: 40.w,
                height: 32.h,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: currentPage > 1
                      ? () => onPageChanged(currentPage - 1)
                      : null,
                  icon: Icon(
                    Icons.chevron_left,
                    size: 20.sp,
                    color: currentPage > 1 ? null : Colors.grey,
                  ),
                ),
              ),

              // Page numbers - using Wrap to prevent overflow
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 2.w,
                  children: _buildPageNumbers(context),
                ),
              ),

              // Next button
              SizedBox(
                width: 40.w,
                height: 32.h,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: currentPage < totalPages
                      ? () => onPageChanged(currentPage + 1)
                      : null,
                  icon: Icon(
                    Icons.chevron_right,
                    size: 20.sp,
                    color: currentPage < totalPages ? null : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageNumbers(BuildContext context) {
    List<Widget> pageNumbers = [];

    // For small number of pages, show all
    if (totalPages <= 5) {
      for (int i = 1; i <= totalPages; i++) {
        pageNumbers.add(_buildPageButton(context, i, currentPage == i));
      }
      return pageNumbers;
    }

    // For many pages, show smart pagination
    // Always show first page
    pageNumbers.add(_buildPageButton(context, 1, currentPage == 1));

    if (currentPage > 3) {
      pageNumbers.add(_buildEllipsis());
    }

    // Show current page and neighbors
    int start = (currentPage - 1).clamp(2, totalPages - 1);
    int end = (currentPage + 1).clamp(2, totalPages - 1);

    for (int i = start; i <= end; i++) {
      if (i != 1 && i != totalPages) {
        pageNumbers.add(_buildPageButton(context, i, currentPage == i));
      }
    }

    if (currentPage < totalPages - 2) {
      pageNumbers.add(_buildEllipsis());
    }

    // Always show last page if more than 1 page
    if (totalPages > 1) {
      pageNumbers.add(
        _buildPageButton(context, totalPages, currentPage == totalPages),
      );
    }

    return pageNumbers;
  }

  Widget _buildPageButton(BuildContext context, int pageNumber, bool isActive) {
    return GestureDetector(
      onTap: isActive ? null : () => onPageChanged(pageNumber),
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(
            color: isActive
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(
          child: Text(
            pageNumber.toString(),
            style: TextStyle(
              color: isActive
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyMedium?.color,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEllipsis() {
    return SizedBox(
      width: 28.w,
      height: 28.h,
      child: Center(
        child: Text(
          '...',
          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
        ),
      ),
    );
  }
}
