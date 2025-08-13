import 'package:equatable/equatable.dart';

class TicketItem extends Equatable {
  final int? id;
  final String? ticketId;
  final dynamic clientId;
  final int? problemId;
  final String? problemTopic;
  final int? workerId;
  final dynamic workerFname;
  final int? locationId;
  final String? locationName;
  final int? departmentId;
  final String? departmentName;
  final dynamic message;
  final dynamic notes;
  final String? created;
  final dynamic closed;
  final String? status;
  final dynamic phone;
  final String? requestedBy;

  const TicketItem({
    this.id,
    this.ticketId,
    this.clientId,
    this.problemId,
    this.problemTopic,
    this.workerId,
    this.workerFname,
    this.locationId,
    this.locationName,
    this.departmentId,
    this.departmentName,
    this.message,
    this.notes,
    this.created,
    this.closed,
    this.status,
    this.phone,
    this.requestedBy,
  });

  factory TicketItem.fromJson(Map<String, dynamic> json) => TicketItem(
    id: json['id'] as int?,
    ticketId: json['ticket_id'] as String?,
    clientId: json['client_id'] as dynamic,
    problemId: json['problem_id'] as int?,
    problemTopic: json['problem_topic'] as String?,
    workerId: json['worker_id'] as int?,
    workerFname: json['worker_fname'] as dynamic,
    locationId: json['location_id'] as int?,
    locationName: json['location_name'] as String?,
    departmentId: json['department_id'] as int?,
    departmentName: json['department_name'] as String?,
    message: json['message'] as dynamic,
    notes: json['notes'] as dynamic,
    created: json['created'] as String?,
    closed: json['closed'] as dynamic,
    status: json['status'] as String?,
    phone: json['phone'] as dynamic,
    requestedBy: json['requested_by'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'ticket_id': ticketId,
    'client_id': clientId,
    'problem_id': problemId,
    'problem_topic': problemTopic,
    'worker_id': workerId,
    'worker_fname': workerFname,
    'location_id': locationId,
    'location_name': locationName,
    'department_id': departmentId,
    'department_name': departmentName,
    'message': message,
    'notes': notes,
    'created': created,
    'closed': closed,
    'status': status,
    'phone': phone,
    'requested_by': requestedBy,
  };

  @override
  List<Object?> get props {
    return [
      id,
      ticketId,
      clientId,
      problemId,
      problemTopic,
      workerId,
      workerFname,
      locationId,
      locationName,
      departmentId,
      departmentName,
      message,
      notes,
      created,
      closed,
      status,
      phone,
      requestedBy,
    ];
  }
}
