import 'package:go_router/go_router.dart';
import 'package:ticket_flow/features/admin/pages/update_user_page.dart';
import 'package:ticket_flow/features/auth/presentation/pages/admin_login_page.dart';
import 'package:ticket_flow/features/auth/presentation/pages/forget_pass_page.dart';
import 'package:ticket_flow/features/auth/presentation/pages/guest_login_page.dart';
import 'package:ticket_flow/features/admin/pages/add_user_page.dart';
import 'package:ticket_flow/features/admin/pages/department_page.dart';
import 'package:ticket_flow/features/admin/pages/location_page.dart';
import 'package:ticket_flow/features/admin/pages/members_page.dart';
import 'package:ticket_flow/features/admin/pages/porblems_page.dart';
import 'package:ticket_flow/features/admin/pages/report_schedule_page.dart';
import 'package:ticket_flow/features/admin/pages/request_types_page.dart';
import 'package:ticket_flow/features/admin/pages/admin_page.dart';
import 'package:ticket_flow/features/admin/pages/topic_page.dart';
import 'package:ticket_flow/features/admin/pages/workers_page.dart';
import 'package:ticket_flow/features/feedback/pages/closed_feedback_page.dart';
import 'package:ticket_flow/features/feedback/pages/feedback_page.dart';
import 'package:ticket_flow/features/guest/views/guest_page.dart';
import 'package:ticket_flow/features/home/presentation/pages/report_page.dart';
import 'package:ticket_flow/features/work_order/pages/closed_work_order_page.dart';
import 'package:ticket_flow/features/request/presentation/pages/add_request_page.dart';
import 'package:ticket_flow/features/request/presentation/pages/new_request_page.dart';
import 'package:ticket_flow/features/request/presentation/pages/view_request_page.dart';
import 'package:ticket_flow/features/onboarding/onboarding_page.dart';
import 'package:ticket_flow/features/splash/splash_page.dart';

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
  static const String topic = '/topic';
  static const String department = '/department';
  static const String workers = '/workers';
  static const String location = '/location';
  static const String members = '/members';
  static const String requestTypes = '/requestTypes';
  static const String problems = '/problems';
  static const String reportSchedule = '/reportSchedule';
  static const String admin = '/admin';
  static const String addUser = '/addUser';
  static const String updateUser = '/updateUser';
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
      GoRoute(path: topic, builder: (context, state) => const TopicPage()),
      GoRoute(
        path: department,
        builder: (context, state) => const DepartmentPage(),
      ),
      GoRoute(path: workers, builder: (context, state) => const WorkersPage()),
      GoRoute(
        path: location,
        builder: (context, state) => const LocationPage(),
      ),
      GoRoute(path: members, builder: (context, state) => const MembersPage()),
      GoRoute(
        path: requestTypes,
        builder: (context, state) => const RequestTypesPage(),
      ),
      GoRoute(
        path: problems,
        builder: (context, state) => const ProblemsPage(),
      ),
      GoRoute(
        path: reportSchedule,
        builder: (context, state) => const ReportSchedulePage(),
      ),
      GoRoute(path: admin, builder: (context, state) => const AdminPage()),
      GoRoute(path: addUser, builder: (context, state) => const AddUserPage()),
      GoRoute(
        path: updateUser,
        builder: (context, state) => const UpdateUserPage(),
      ),
    ],
  );
}
