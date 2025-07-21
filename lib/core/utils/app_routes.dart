import 'package:go_router/go_router.dart';
import 'package:ticket_flow/features/admin/pages/add_department_page.dart';
import 'package:ticket_flow/features/admin/pages/add_location_page.dart';
import 'package:ticket_flow/features/admin/pages/add_member_page.dart';
import 'package:ticket_flow/features/admin/pages/add_problem_page.dart';
import 'package:ticket_flow/features/admin/pages/add_request_type_page.dart';
import 'package:ticket_flow/features/admin/pages/add_worker_page.dart';
import 'package:ticket_flow/features/admin/pages/add_topic_page.dart';
import 'package:ticket_flow/features/admin/pages/add_user_page.dart';
import 'package:ticket_flow/features/admin/pages/admin_page.dart';
import 'package:ticket_flow/features/admin/pages/update_dep_page.dart';
import 'package:ticket_flow/features/admin/pages/update_location_page.dart';
import 'package:ticket_flow/features/admin/pages/update_member_page.dart';
import 'package:ticket_flow/features/admin/pages/update_problem_page.dart';
import 'package:ticket_flow/features/admin/pages/update_worker_page.dart';
import 'package:ticket_flow/features/admin/pages/update_type_page.dart';
import 'package:ticket_flow/features/admin/pages/update_topic.dart';
import 'package:ticket_flow/features/admin/pages/update_user_page.dart';
import 'package:ticket_flow/features/auth/presentation/pages/admin_login_page.dart';
import 'package:ticket_flow/features/auth/presentation/pages/forget_pass_page.dart';
import 'package:ticket_flow/features/auth/presentation/pages/guest_login_page.dart';
import 'package:ticket_flow/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:ticket_flow/features/feedback/pages/closed_feedback_page.dart';
import 'package:ticket_flow/features/feedback/pages/feedback_page.dart';
import 'package:ticket_flow/features/guest/views/guest_page.dart';
import 'package:ticket_flow/features/home/presentation/pages/report_page.dart';
import 'package:ticket_flow/features/onboarding/onboarding_page.dart';
import 'package:ticket_flow/features/request/presentation/pages/add_request_page.dart';
import 'package:ticket_flow/features/request/presentation/pages/new_request_page.dart';
import 'package:ticket_flow/features/request/presentation/pages/view_request_page.dart';
import 'package:ticket_flow/features/splash/splash_page.dart';
import 'package:ticket_flow/features/work_order/pages/closed_work_order_page.dart';

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
  static const String user = '/user';
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
        builder: (context, state) => const ViewRequestPage(),
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
      GoRoute(path: user, builder: (context, state) => const AdminPage()),
      GoRoute(path: admin, builder: (context, state) => const AdminPage()),
      GoRoute(path: addUser, builder: (context, state) => const AddUserPage()),
      GoRoute(
        path: updateUser,
        builder: (context, state) => const UpdateUserPage(),
      ),
      GoRoute(
        path: addDepartment,
        builder: (context, state) => const AddDepartmentPage(),
      ),
      GoRoute(
        path: updateDepartment,
        builder: (context, state) => const UpdateDepPage(),
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
        builder: (context, state) => const UpdateTopic(),
      ),
      GoRoute(
        path: addWorker,
        builder: (context, state) => const AddWorkerPage(),
      ),
      GoRoute(
        path: updateWorker,
        builder: (context, state) => const UpdateWorkerPage(),
      ),
      GoRoute(
        path: addLocation,
        builder: (context, state) => const AddLocationPage(),
      ),
      GoRoute(
        path: updateLocation,
        builder: (context, state) => const UpdateLocationPage(),
      ),
      GoRoute(
        path: addMember,
        builder: (context, state) => const AddMemberPage(),
      ),
      GoRoute(
        path: updateMember,
        builder: (context, state) => const UpdateMemberPage(),
      ),
      GoRoute(
        path: addProblem,
        builder: (context, state) => const AddProblemPage(),
      ),
      GoRoute(
        path: updateProblem,
        builder: (context, state) => const UpdateProblemPage(),
      ),
      GoRoute(
        path: addRequestType,
        builder: (context, state) => const AddRequestTypePage(),
      ),
      GoRoute(
        path: updateRequestType,
        builder: (context, state) => const UpdateTypePage(),
      ),
    ],
  );
}
