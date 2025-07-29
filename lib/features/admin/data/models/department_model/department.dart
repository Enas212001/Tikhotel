import 'package:equatable/equatable.dart';

import 'department_model.dart';

class Department extends Equatable {
  final bool? status;
  final String? message;
  final DepartmentModel? data;

  const Department({this.status, this.message, this.data});

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : DepartmentModel.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };

  @override
  List<Object?> get props => [status, message, data];
}
