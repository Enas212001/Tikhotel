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
import 'package:ticket_flow/features/admin/presentation/pages/location_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/member_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/porblems_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/report_schedule_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/request_types_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/user_body.dart';
import 'package:ticket_flow/features/admin/presentation/pages/widgets/admin_list_view.dart';
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
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopWidget(
              controller: searchController,
              title: S.of(context).administration,
              onChanged: (query) {
                switch (selectedIndex) {
                  case 0:
                    context.read<UserCubit>().searchUsers(query);
                    break;
                  case 1:
                    context.read<DepartmentCubit>().searchDepartments(query);
                    break;
                  case 2:
                    context.read<TopicCubit>().searchTopics(query);
                    break;
                  case 3:
                    context.read<WorkerCubit>().searchWorker(query);
                    break;
                  case 4:
                    context.read<LocationCubit>().searchLocation(query);
                    break;
                  case 5:
                    context.read<MemberCubit>().searchMember(query);
                    break;
                  case 6:
                    context.read<RequestTypeCubit>().searchRequestType(query);
                    break;
                  case 7:
                    context.read<ProblemCubit>().searchProblem(query);
                    break;
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: AdminListView(
              selectedIndex: selectedIndex,
              onIndexChanged: (index) {
                setState(() {
                  selectedIndex = index;
                  searchController.clear();
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
