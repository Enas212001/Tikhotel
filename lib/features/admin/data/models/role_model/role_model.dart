import 'package:equatable/equatable.dart';

class RoleModel extends Equatable {
  final int? id;
  final String? role;
  final String? status;

  const RoleModel({this.id, this.role, this.status});

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
    id: json['id'] as int?,
    role: json['role'] as String?,
    status: json['status'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'role': role, 'status': status};

  @override
  List<Object?> get props => [id, role, status];
}
