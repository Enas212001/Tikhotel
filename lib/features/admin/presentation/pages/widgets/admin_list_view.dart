import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';

import 'admin_list_view_item.dart';

class AdminListView extends StatefulWidget {
  const AdminListView({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  final int selectedIndex;
  final Function(int) onIndexChanged;

  @override
  State<AdminListView> createState() => _AdminListViewState();
}

class _AdminListViewState extends State<AdminListView> {
  late ScrollController _scrollController;
  bool _showLeftArrow = false;
  bool _showRightArrow = true;

  final List<String> items = [
    'Users',
    'Departments',
    'Topics',
    'Workers',
    'Locations',
    'Daily Report Members',
    'Request Types',
    'Problems',
    'Report Schedule',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      final showLeftArrow = _scrollController.offset > 0;
      final showRightArrow =
          _scrollController.offset < _scrollController.position.maxScrollExtent;

      if (showLeftArrow != _showLeftArrow ||
          showRightArrow != _showRightArrow) {
        setState(() {
          _showLeftArrow = showLeftArrow;
          _showRightArrow = showRightArrow;
        });
      }
    }
  }

  void _scrollToPrevious() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.offset - 150,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToNext() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.offset + 150,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16.r,
            offset: Offset(4.r, 4.r),
          ),
        ],
      ),
      child: Row(
        children: [
          if (_showLeftArrow)
            SizedBox(
              width: 30.w,
              height: 50.h,
              child: IconButton(
                onPressed: _scrollToPrevious,
                icon: Icon(
                  Icons.keyboard_double_arrow_left_outlined,
                  color: AppColors.primary,
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final isSelected = widget.selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    widget.onIndexChanged(index);
                  },
                  child: AdminListViewItem(
                    items: items[index],
                    isSelected: isSelected,
                  ),
                );
              },
            ),
          ),
          if (_showRightArrow)
            SizedBox(
              width: 40.w,
              height: 50.h,
              child: IconButton(
                onPressed: _scrollToNext,
                icon: Icon(
                  Icons.keyboard_double_arrow_right_outlined,
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
