import 'package:equatable/equatable.dart';

class ProblemItem extends Equatable {
  final int? id;
  final String? topic;
  final int? departmentId;
  final int? sla;

  const ProblemItem({this.id, this.topic, this.departmentId, this.sla});

  factory ProblemItem.fromJson(Map<String, dynamic> json) => ProblemItem(
    id: json['id'] as int?,
    topic: json['topic'] as String?,
    departmentId: json['department_id'] as int?,
    sla: json['sla'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'topic': topic,
    'department_id': departmentId,
    'sla': sla,
  };

  @override
  List<Object?> get props => [id, topic, departmentId, sla];
}
