class ApiKey {
  static const String email = 'email';
  static const String password = 'password';
  static const String roomNumber = 'room';
  static const String firstName = 'fname';
}

class EndPoints {
  static const String baseUrl =
      'https://hgs-tahrir.steigenberger.cloud/api_hgs';
  static const String login = '$baseUrl/users/login_user.php';
  static const String guestLogin = '$baseUrl/clients/guest_login.php';
  static const String dashboard = '$baseUrl/tickets/dashboard.php';
}

class CacheKey {
  static const String adminLoggedIn = 'admin_logged_in';
}
