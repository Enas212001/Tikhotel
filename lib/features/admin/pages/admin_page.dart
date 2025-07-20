import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/features/admin/pages/widgets/admin_list_view.dart';
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
            child: AdminListView(
              selectedIndex: selectedIndex,
              onIndexChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
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
