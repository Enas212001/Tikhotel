import 'package:equatable/equatable.dart';

import 'request_type_item.dart';

class RequestTypeModel extends Equatable {
  final bool? status;
  final String? message;
  final List<RequestTypeItem>? data;

  const RequestTypeModel({this.status, this.message, this.data});

  factory RequestTypeModel.fromJson(Map<String, dynamic> json) {
    return RequestTypeModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RequestTypeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [status, message, data];
}
