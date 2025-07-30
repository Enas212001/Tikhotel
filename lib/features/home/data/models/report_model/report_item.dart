import 'package:equatable/equatable.dart';

class ReportItem extends Equatable {
  final int? id;
  final String? ticketId;
  final dynamic message;
  final String? status;
  final int? departmentId;
  final String? created;

  const ReportItem({
    this.id,
    this.ticketId,
    this.message,
    this.status,
    this.departmentId,
    this.created,
  });

  factory ReportItem.fromJson(Map<String, dynamic> json) => ReportItem(
    id: json['id'] as int?,
    ticketId: json['ticket_id'] as String?,
    message: json['message'] as dynamic,
    status: json['status'] as String?,
    departmentId: json['department_id'] as int?,
    created: json['created'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'ticket_id': ticketId,
    'message': message,
    'status': status,
    'department_id': departmentId,
    'created': created,
  };

  @override
  List<Object?> get props {
    return [id, ticketId, message, status, departmentId, created];
  }
}
