import 'package:equatable/equatable.dart';

import 'department_item.dart';
import 'department_pagination.dart';

class DepartmentModel extends Equatable {
  final bool? status;
  final String? message;
  final List<DepartmentItem>? data;
  final DepartmentPagination? pagination;

  const DepartmentModel({
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DepartmentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : DepartmentPagination.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
    'pagination': pagination?.toJson(),
  };

  @override
  List<Object?> get props => [status, message, data, pagination];
}
