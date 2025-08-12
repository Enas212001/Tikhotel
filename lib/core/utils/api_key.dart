class ApiKey {
  static const String email = 'email';
  static const String password = 'password';
  static const String roomNumber = 'room';
  static const String firstName = 'fname';
  static const String name = 'name';
  static const String roleId = 'role_id';
  static const String department = 'department';
  static const String status = 'status';
  static const String isActive = 'is_active';
  static const String operational = 'operational';
  static const String requestType = 'RequestType';
  static const String topic = 'topic';
  static const String departmentId = 'department_id';
  static const String sla = 'sla';
  static const String page = 'page';
  static const String limit = 'limit';
  static const String rowCount = 'rowCount';
  static const String id = 'id';
  static const String title = 'title';
  static const String location = 'location';
  static const String roomStatus = 'room_status';
  static const String message = 'message';
  static const String phone = 'phone';
  static const String cellPhone = 'cell_phone';
  static const String statusWhatsapp = 'st_whatsapp';
  static const String dateFrom = 'date_from';
  static const String dateTo = 'date_to';
  static const String locationId = 'location_id';
  static const String userId = 'user_id';
  static const String problemId = 'problem_id';
  static const String compensation = 'compensation';
  static const String requestedBy = 'requested_by';
  static const String requestedUser = 'requestedUser';
  static const String amountEgp = 'amount_EGP';
  static const String workerId = 'worker_id';
  static const String quantity = 'qty';
  static const String replay = 'reply_text';
  static const String rating = 'rating';
  static const String clientFeedback = 'client_feedback';
}

class EndPoints {
  static const String baseUrl =
      'https://hgs-tahrir.steigenberger.cloud/api_hgs';
  static const String adminLogin = '$baseUrl/users/login_user.php';
  static const String guestLogin = '$baseUrl/clients/guest_login.php';
  static const String dashboard = '$baseUrl/tickets/dashboard.php';
  static const String guests = '$baseUrl/clients/get_all_clients.php';
  static String updateGuest(String id) =>
      '$baseUrl/clients/update_client.php?id=$id';
  static const String tickets = '$baseUrl/tickets/get_all_tickets.php';
  static const String addTicket = '$baseUrl/tickets/create_ticket.php';
  static String editTicket(String id) =>
      '$baseUrl/tickets/update_ticket.php?id=$id';
  static String deleteTicket(String id) =>
      '$baseUrl/tickets/delete_ticket.php?id=$id';
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
  static const String addWorker = '$baseUrl/workers/create_worker.php';
  static const String workers = '$baseUrl/workers/get_all_workers.php';
  static String editWorker(String id) =>
      '$baseUrl/workers/update_worker.php?id=$id';
  static String deleteWorker(String id) =>
      '$baseUrl/workers/delete_worker.php?id=$id';
  static const String reportByDate = '$baseUrl/report/report_by_date.php';
  static const String reportByRoom = '$baseUrl/report/report_by_room.php';
  static String replyMessage(String id) =>
      '$baseUrl/replies/create_reply.php?ticket_id=$id';
  static String addGuestTicket(String id) =>
      '$baseUrl/clients/create_guest_ticket.php?client_id=$id';
  static String addGuestReply(String id) =>
      '$baseUrl/clients/add_replay.php?ticket_id=$id';
  static String getGuestTicketsData(String id) =>
      '$baseUrl/clients/get_guest_tickets.php?client_id=$id';
}

class CacheKey {
  static const String adminLoggedIn = 'admin_logged_in';
  static const String guestLoggedIn = 'guest_logged_in';
  static const String requestedBy = 'requested_by';
  static const String guestData = 'guestData';
}
