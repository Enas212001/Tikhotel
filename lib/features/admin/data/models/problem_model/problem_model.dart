import 'package:equatable/equatable.dart';

import 'problem_item.dart';
import 'pagination.dart';

class ProblemModel extends Equatable {
  final bool? status;
  final String? message;
  final List<ProblemItem>? data;
  final Pagination? pagination;

  const ProblemModel({this.status, this.message, this.data, this.pagination});

  factory ProblemModel.fromJson(Map<String, dynamic> json) => ProblemModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => ProblemItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    pagination: json['pagination'] == null
        ? null
        : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
    'pagination': pagination?.toJson(),
  };

  @override
  List<Object?> get props => [status, message, data, pagination];
}
