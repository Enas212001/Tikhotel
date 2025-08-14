import 'package:equatable/equatable.dart';

import 'request_pagination.dart';
import 'request_type_item.dart';

class RequestTypeModel extends Equatable {
  final bool? status;
  final String? message;
  final List<RequestTypeItem>? data;
  final RequestTypePagination? pagination;
  const RequestTypeModel({
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  factory RequestTypeModel.fromJson(Map<String, dynamic> json) {
    return RequestTypeModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RequestTypeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : RequestTypePagination.fromJson(
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
