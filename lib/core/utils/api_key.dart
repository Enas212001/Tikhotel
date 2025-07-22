class ApiKey {
  static const String email = 'email';
  static const String password = 'password';
  static const String roomNumber = 'room';
  static const String firstName = 'fname';
  static const String name = 'name';
  static const String role = 'role';
  static const String roleId = 'role_id';
  static const String department = 'department';
  static const String status = 'status';
  static const String operational = 'operational';
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
}

class CacheKey {
  static const String adminLoggedIn = 'admin_logged_in';
}
