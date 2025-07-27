import 'package:equatable/equatable.dart';

class ProblemItem extends Equatable {
  final int? id;
  final String? topic;
  final int? sla;
  final int? departmentId;
  final String? status;
  final String? ts;

  const ProblemItem({
    this.id,
    this.topic,
    this.sla,
    this.departmentId,
    this.status,
    this.ts,
  });

  factory ProblemItem.fromJson(Map<String, dynamic> json) => ProblemItem(
    id: json['id'] as int?,
    topic: json['topic'] as String?,
    sla: json['sla'] as int?,
    departmentId: json['department_id'] as int?,
    status: json['status'] as String?,
    ts: json['ts'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'topic': topic,
    'sla': sla,
    'department_id': departmentId,
    'status': status,
    'ts': ts,
  };

  @override
  List<Object?> get props => [id, topic, sla, departmentId, status, ts];
}
