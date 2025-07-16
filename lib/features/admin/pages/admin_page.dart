import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/features/admin/pages/user_body.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int selectedIndex = 0;
  final List<String> items = [
    'Users',
    'Departments',
    'Locations',
    'Daily Report Members',
    'Topics',
    'Workers',
    'Request Types',
    'Problems',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopWidget(search: 'user', title: 'Users'),
          ),
          // SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverToBoxAdapter(
            child: Container(
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w) +
                          EdgeInsets.only(top: 8.h),
                      child: IntrinsicWidth(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              items[index],
                              style: TextStyles.text12MediumPrimary.copyWith(
                                color: AppColors.grey,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Container(
                              height: 2.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.main
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: Center(child: _buildSelectedContent(selectedIndex)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedContent(int index) {
    switch (index) {
      case 0:
        return const UsersBody();
      case 1:
        return const Text(
          'You selected Departments!',
          style: TextStyle(fontSize: 20),
        );
      case 2:
        return const Text(
          'You selected Locations!',
          style: TextStyle(fontSize: 20),
        );
      case 3:
        return const Text(
          'You selected Daily Report Members!',
          style: TextStyle(fontSize: 20),
        );
      case 4:
        return const Text(
          'You selected Topics!',
          style: TextStyle(fontSize: 20),
        );
      case 5:
        return const Text(
          'You selected Workers!',
          style: TextStyle(fontSize: 20),
        );
      case 6:
        return const Text(
          'You selected Request Types!',
          style: TextStyle(fontSize: 20),
        );
      case 7:
        return const Text(
          'You selected Problems!',
          style: TextStyle(fontSize: 20),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
