import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/app/my_app_drawer.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/features/admin/presentation/manager/department_cubit/department_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/location_cubit/location_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/member_cubit/member_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/problem_cubit/problem_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/request_type_cubit/request_type_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/topic_cubit/topic_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/worker_cubit/worker_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/admin_list_view.dart';
import 'package:ticket_flow/features/admin/presentation/pages/location_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/member_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/porblems_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/report_schedule_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/request_types_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/user_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/worker_body.dart';
import 'package:ticket_flow/generated/l10n.dart';

import '../manager/user_cubit/user_cubit.dart';
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
            child: TopWidget(search: '', title: S.of(context).administration),
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
        return BlocProvider(
          create: (context) => UserCubit()..getUsers(),
          child: const UsersBody(),
        );
      case 1:
        return BlocProvider(
          create: (context) => DepartmentCubit()..fetchDepartments(),
          child: const DepartmentBody(),
        );
      case 2:
        return BlocProvider(
          create: (context) => TopicCubit()..getTopics(),
          child: const TopicBody(),
        );
      case 3:
        return BlocProvider(
          create: (context) => WorkerCubit()..getWorkers(),
          child: const WorkerBody(),
        );
      case 4:
        return BlocProvider(
          create: (context) => LocationCubit()..getLocations(),
          child: const LocationBody(),
        );
      case 5:
        return BlocProvider(
          create: (context) => MemberCubit()..getMembers(),
          child: const MemberBody(),
        );
      case 6:
        return BlocProvider(
          create: (context) => RequestTypeCubit()..getRequestTypes(),
          child: const RequestTypesBody(),
        );
      case 7:
        return BlocProvider(
          create: (context) => ProblemCubit()..getProblems(),
          child: const ProblemsBody(),
        );
      case 8:
        return const ReportScheduleBody();
      default:
        return const SizedBox.shrink();
    }
  }
}
