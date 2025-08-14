import 'package:equatable/equatable.dart';

class DepartmentItem extends Equatable {
  final int? id;
  final String? status;
  final String? name;

  const DepartmentItem({this.id, this.status, this.name});

  factory DepartmentItem.fromJson(Map<String, dynamic> json) => DepartmentItem(
    id: json['id'] as int?,
    status: json['status'] as String?,
    name: json['name'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'status': status, 'name': name};

  @override
  List<Object?> get props => [id, status, name];
}
