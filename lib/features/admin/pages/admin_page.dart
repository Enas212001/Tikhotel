import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/features/admin/pages/location_body.dart';
import 'package:ticket_flow/features/admin/pages/member_body.dart';
import 'package:ticket_flow/features/admin/pages/porblems_body.dart';
import 'package:ticket_flow/features/admin/pages/report_schedule_body.dart';
import 'package:ticket_flow/features/admin/pages/request_types_body.dart';
import 'package:ticket_flow/features/admin/pages/user_body.dart';
import 'package:ticket_flow/features/admin/pages/worker_body.dart';

import 'department_body.dart';
import 'topic_body.dart';

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
    'Topics',
    'Workers',
    'Locations',
    'Daily Report Members',
    'Request Types',
    'Problems',
    'Report Schedule',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopWidget(search: '', title: 'Administration'),
          ),
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
        return const DepartmentBody();
      case 2:
        return const TopicBody();
      case 3:
        return const WorkerBody();
      case 4:
        return const LocationBody();
      case 5:
        return const MemberBody();
      case 6:
        return const RequestTypesBody();
      case 7:
        return const ProblemsBody();
      case 8:
        return const ReportScheduleBody();
      default:
        return const SizedBox.shrink();
    }
  }
}
