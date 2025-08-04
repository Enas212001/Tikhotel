import 'package:equatable/equatable.dart';

class ReportItem extends Equatable {
  final int? id;
  final String? ticketId;
  final dynamic message;
  final String? status;
  final int? departmentId;
  final String? created;
  final String? room;
  final String? createdAt;
  final String? depTimeAt;
  final String? fixedAt;
  final String? problem;
  final String? worker;
  final int? sla;
  final int? duration;
  final String? departmentName;

  const ReportItem({
    this.id,
    this.ticketId,
    this.message,
    this.status,
    this.departmentId,
    this.created,
    this.room,
    this.createdAt,
    this.depTimeAt,
    this.fixedAt,
    this.problem,
    this.worker,
    this.sla,
    this.duration,
    this.departmentName,
  });

  factory ReportItem.fromJson(Map<String, dynamic> json) => ReportItem(
    id: json['id'] as int?,
    ticketId: json['ticket_id'] as String?,
    message: json['message'] as dynamic,
    status: json['status'] as String?,
    departmentId: json['department_id'] as int?,
    created: json['created'] as String?,
    room: json['room'] as String?,
    createdAt: json['createdAt'] as String?,
    depTimeAt: json['depTimeAt'] as String?,
    fixedAt: json['fixedAt'] as String?,
    problem: json['problem'] as String?,
    worker: json['worker'] as String?,
    sla: json['sla'] as int?,
    duration: json['duration'] as int?,
    departmentName: json['department_name'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'ticket_id': ticketId,
    'message': message,
    'status': status,
    'department_id': departmentId,
    'created': created,
    'room': room,
    'createdAt': createdAt,
    'depTimeAt': depTimeAt,
    'fixedAt': fixedAt,
    'problem': problem,
    'worker': worker,
    'sla': sla,
    'duration': duration,
    'department_name': departmentName,
  };

  @override
  List<Object?> get props {
    return [
      id,
      ticketId,
      message,
      status,
      departmentId,
      created,
      room,
      createdAt,
      depTimeAt,
      fixedAt,
      problem,
      worker,
      sla,
      duration,
      departmentName,
    ];
  }
}
