class ApiKey {
  static const String email = 'email';
  static const String password = 'password';
  static const String roomNumber = 'room';
  static const String firstName = 'fname';
  static const String name = 'name';
  static const String roleId = 'role_id';
  static const String department = 'department';
  static const String status = 'status';
  static const String operational = 'operational';
  static const String requestType = 'RequestType';
  static const String topic = 'topic';
  static const String departmentId = 'department_id';
  static const String sla = 'sla';
  static const String page = 'page';
  static const String limit = 'limit';
  static const String id = 'id';
  static const String title = 'title';
  static const String location = 'location';
  static const String roomStatus = 'room_status';
  static const String message = 'message';
}

class EndPoints {
  static const String baseUrl =
      'https://hgs-tahrir.steigenberger.cloud/api_hgs';
  static const String adminLogin = '$baseUrl/users/login_user.php';
  static const String guestLogin = '$baseUrl/clients/guest_login.php';
  static const String dashboard = '$baseUrl/tickets/dashboard.php';
  static const String guests = '$baseUrl/clients/get_all_clients.php';
  static const String tickets = '$baseUrl/tickets/get_all_tickets.php';
  static const String users = '$baseUrl/users/get_users.php';
  static const String addUser = '$baseUrl/users/create_user.php';
  static const String roles = '$baseUrl/roles/get_roles.php';
  static String editUser(String id) => '$baseUrl/users/edit_user.php?id=$id';
  static String deleteUser(String id) =>
      '$baseUrl/users/delete_user.php?id=$id';
  static const String requestTypes = '$baseUrl/request_type/get_types.php';
  static const String addRequestType = '$baseUrl/request_type/add_type.php';
  static String deleteRequestType(String id) =>
      '$baseUrl/request_type/delete_type.php?id=$id';
  static String editRequestType(String id) =>
      '$baseUrl/request_type/edit_type.php?id=$id';
  static const String topics = '$baseUrl/topics/get_all_topics.php';
  static const String addTopic = '$baseUrl/topics/create_topic.php';
  static String editTopic(String id) =>
      '$baseUrl/topics/update_topic.php?id=$id';
  static String deleteTopic(String id) =>
      '$baseUrl/topics/delete_topic.php?id=$id';
  static const String members = '$baseUrl/members/get_all.php';
  static const String addMember = '$baseUrl/members/create_member.php';
  static String editMember(String id) =>
      '$baseUrl/members/update_member.php?id=$id';
  static String deleteMember(String id) =>
      '$baseUrl/members/delete_member.php?id=$id';
  static const String problems = '$baseUrl/problems/get_all_problems.php';
  static const String addProblem = '$baseUrl/problems/create_problem.php';
  static String editProblem(String id) =>
      '$baseUrl/problems/update_problem.php?id=$id';
  static String deleteProblem(String id) =>
      '$baseUrl/problems/delete_problem.php?id=$id';
  static const String addDepartment =
      '$baseUrl/departments/create_department.php';
  static const String departments =
      '$baseUrl/departments/get_all_departments.php';
  static String editDepartment(String id) =>
      '$baseUrl/departments/update_department.php?id=$id';
  static String deleteDepartment(String id) =>
      '$baseUrl/departments/delete_department.php?id=$id';
  static const String addLocation = '$baseUrl/locations/create_location.php';
  static const String locations = '$baseUrl/locations/get_all_locations.php';
  static String editLocation(String id) =>
      '$baseUrl/locations/update_location.php?id=$id';
  static String deleteLocation(String id) =>
      '$baseUrl/locations/delete_location.php?id=$id';
}

class CacheKey {
  static const String adminLoggedIn = 'admin_logged_in';
}
