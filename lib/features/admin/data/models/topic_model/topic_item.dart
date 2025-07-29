import 'package:equatable/equatable.dart';

class TopicItem extends Equatable {
  final int? id;
  final String? topic;
  final int? sla;
  final int? departmentId;
  final String? status;
  final String? ts;
  final String? departmentName;
  const TopicItem({
    this.id,
    this.topic,
    this.sla,
    this.departmentId,
    this.status,
    this.ts,
    this.departmentName,
  });

  factory TopicItem.fromJson(Map<String, dynamic> json) => TopicItem(
    id: json['id'] as int?,
    topic: json['topic'] as String?,
    sla: json['sla'] as int?,
    departmentId: json['department_id'] as int?,
    status: json['status'] as String?,
    ts: json['ts'] as String?,
    departmentName: json['department_name'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'topic': topic,
    'sla': sla,
    'department_id': departmentId,
    'status': status,
    'ts': ts,
    'department_name': departmentName,
  };

  @override
  List<Object?> get props => [
    id,
    topic,
    sla,
    departmentId,
    status,
    ts,
    departmentName,
  ];
}
