import 'package:equatable/equatable.dart';

class DepartmentModel extends Equatable {
  final int? id;
  final String? status;
  final String? name;

  const DepartmentModel({this.id, this.status, this.name});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      DepartmentModel(
        id: json['id'] as int?,
        status: json['status'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {'id': id, 'status': status, 'name': name};

  @override
  List<Object?> get props => [id, status, name];
}
