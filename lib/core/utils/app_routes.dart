import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_item.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/features/admin/data/models/member_model/member_model.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_item.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_model.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user_model.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/department_cubit/department_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/location_cubit/location_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/member_cubit/member_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/problem_cubit/problem_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/request_type_cubit/request_type_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/topic_cubit/topic_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/user_cubit/user_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/manager/worker_cubit/worker_cubit.dart';
import 'package:ticket_flow/features/admin/presentation/pages/add_department_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/add_location_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/add_member_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/add_problem_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/add_request_type_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/add_worker_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/add_topic_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/add_user_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/admin_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/update_dep_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/update_location_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/update_member_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/update_problem_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/update_worker_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/update_type_page.dart';
import 'package:ticket_flow/features/admin/presentation/pages/update_topic.dart';
import 'package:ticket_flow/features/admin/presentation/pages/update_user_page.dart';
import 'package:ticket_flow/features/auth/presentation/pages/admin_login_page.dart';
import 'package:ticket_flow/features/auth/presentation/pages/forget_pass_page.dart';
import 'package:ticket_flow/features/guestFlow/data/models/guest_ticket_model/guest_ticket_item.dart';
import 'package:ticket_flow/features/guestFlow/presentation/views/guest_login_page.dart';
import 'package:ticket_flow/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/closed_feedback_page.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/feedback_page.dart';
import 'package:ticket_flow/features/guest/presentation/views/guest_page.dart';
import 'package:ticket_flow/features/guestFlow/presentation/views/new_guest_request_page.dart';
import 'package:ticket_flow/features/guestFlow/presentation/views/profile_page.dart';
import 'package:ticket_flow/features/guestFlow/presentation/views/requests_page.dart';
import 'package:ticket_flow/features/guestFlow/presentation/views/view_guest_request_page.dart';
import 'package:ticket_flow/features/report/presentation/pages/report_page.dart';
import 'package:ticket_flow/features/onboarding/onboarding_page.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/add_request_page.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/new_request_page.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/view_request_page.dart';
import 'package:ticket_flow/features/splash/splash_page.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/closed_work_order_page.dart';
import 'package:ticket_flow/generated/l10n.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String guestLogin = '/guestLogin';
  static const String adminLogin = '/adminLogin';
  static const String forgetPassword = '/forgotPassword';
  static const String newRequest = '/newRequest';
  static const String requestDetails = '/requestDetails';
  static const String addRequest = '/addRequest';
  static const String guest = '/guest';
  static const String feedback = '/feedback';
  static const String closedFeedback = '/closedFeedback';
  static const String closedWorkOrder = '/closedWorkOrder';
  static const String report = '/report';
  static const String addTopic = '/addTopic';
  static const String reportSchedule = '/reportSchedule';
  static const String admin = '/admin';
  static const String addUser = '/addUser';
  static const String updateUser = '/updateUser';
  static const String addDepartment = '/addDepartment';
  static const String updateDepartment = '/updateDepartment';
  static const String dashboard = '/dashboard';
  static const String updateTopic = '/updateTopic';
  static const String addWorker = '/addWorker';
  static const String updateWorker = '/updateWorker';
  static const String addLocation = '/addLocation';
  static const String updateLocation = '/updateLocation';
  static const String addMember = '/addMember';
  static const String updateMember = '/updateMember';
  static const String addProblem = '/addProblem';
  static const String updateProblem = '/updateProblem';
  static const String addRequestType = '/addRequestType';
  static const String updateRequestType = '/updateRequestType';
  static const String requestsGuestPage = '/requestsGuestPage';
  static const String viewRequestGuestPage = '/viewRequestGuestPage';
  static const String newRequestGuestPage = '/newRequestGuestPage';
  static const String profilePage = '/profilePage';
  static final router = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashPage()),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: guestLogin,
        builder: (context, state) => const GuestLoginPage(),
      ),
      GoRoute(
        path: adminLogin,
        builder: (context, state) => const AdminLoginPage(),
      ),
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => const ForgetPassPage(),
      ),
      GoRoute(
        path: newRequest,
        builder: (context, state) => const NewRequestPage(),
      ),
      GoRoute(
        path: requestDetails,
        builder: (context, state) {
          final request = state.extra as TicketItem;
          return ViewRequestPage(ticket: request);
        },
      ),
      GoRoute(
        path: addRequest,
        builder: (context, state) => const AddRequestPage(),
      ),
      GoRoute(path: guest, builder: (context, state) => const GuestPage()),
      GoRoute(
        path: feedback,
        builder: (context, state) => const FeedbackPage(),
      ),
      GoRoute(
        path: closedFeedback,
        builder: (context, state) => const ClosedFeedbackPage(),
      ),
      GoRoute(
        path: closedWorkOrder,
        builder: (context, state) => const ClosedWorkOrderPage(),
      ),
      GoRoute(path: report, builder: (context, state) => const ReportPage()),
      GoRoute(
        path: admin,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => UserCubit()..getUsers()),
            BlocProvider(create: (_) => DepartmentCubit()..fetchDepartments()),
            BlocProvider(create: (_) => TopicCubit()..getTopics()),
            BlocProvider(create: (_) => WorkerCubit()..getWorkers()),
            BlocProvider(create: (_) => LocationCubit()..getLocations()),
            BlocProvider(create: (_) => MemberCubit()..getMembers()),
            BlocProvider(create: (_) => RequestTypeCubit()..getRequestTypes()),
            BlocProvider(create: (_) => ProblemCubit()..getProblems()),
          ],
          child: const AdminPage(),
        ),
      ),
      GoRoute(path: addUser, builder: (context, state) => const AddUserPage()),
      GoRoute(
        path: updateUser,
        builder: (context, state) {
          final user = state.extra as UserModel;
          return UpdateUserPage(user: user);
        },
      ),
      GoRoute(
        path: addDepartment,
        builder: (context, state) => const AddDepartmentPage(),
      ),
      GoRoute(
        path: updateDepartment,
        builder: (context, state) {
          final department = state.extra as DepartmentModel;
          return UpdateDepPage(department: department);
        },
      ),
      GoRoute(
        path: dashboard,
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: addTopic,
        builder: (context, state) => const AddTopicPage(),
      ),
      GoRoute(
        path: updateTopic,
        builder: (context, state) {
          final topic = state.extra as TopicItem;
          return UpdateTopic(topic: topic);
        },
      ),
      GoRoute(
        path: addWorker,
        builder: (context, state) => const AddWorkerPage(),
      ),
      GoRoute(
        path: updateWorker,
        builder: (context, state) {
          final workerItem = state.extra as WorkerItem;
          return UpdateWorkerPage(workerItem: workerItem);
        },
      ),
      GoRoute(
        path: addLocation,
        builder: (context, state) => const AddLocationPage(),
      ),
      GoRoute(
        path: updateLocation,
        builder: (context, state) {
          final location = state.extra as LocationItem;
          return UpdateLocationPage(location: location);
        },
      ),
      GoRoute(
        path: addMember,
        builder: (context, state) => const AddMemberPage(),
      ),
      GoRoute(
        path: updateMember,
        builder: (context, state) {
          final member = state.extra as MemberModel;
          return UpdateMemberPage(member: member);
        },
      ),
      GoRoute(
        path: addProblem,
        builder: (context, state) => const AddProblemPage(),
      ),
      GoRoute(
        path: updateProblem,
        builder: (context, state) {
          final problem = state.extra as ProblemItem;
          return UpdateProblemPage(problem: problem);
        },
      ),
      GoRoute(
        path: addRequestType,
        builder: (context, state) => const AddRequestTypePage(),
      ),
      GoRoute(
        path: updateRequestType,
        builder: (context, state) {
          final requestType = state.extra as RequestTypeModel?;
          if (requestType == null) {
            return Scaffold(
              body: Center(child: Text(S.current.anUnexpectedErrorOccurred)),
            );
          }
          return UpdateTypePage(requestType: requestType);
        },
      ),
      GoRoute(
        path: requestsGuestPage,
        builder: (context, state) => const RequestsPage(),
      ),
      GoRoute(
        path: viewRequestGuestPage,
        builder: (context, state) {
          final ticketModel = state.extra as GuestTicketItem;
          return ViewGuestRequestPage(ticketModel: ticketModel);
        },
      ),
      GoRoute(
        path: newRequestGuestPage,
        builder: (context, state) => const NewGuestRequestPage(),
      ),
      GoRoute(
        path: profilePage,
        builder: (context, state) {
          return const ProfilePage();
        },
      ),
    ],
  );
}
