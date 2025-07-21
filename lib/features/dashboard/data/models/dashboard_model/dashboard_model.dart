import 'package:equatable/equatable.dart';

import 'data.dart';

class DashboardModel extends Equatable {
  final bool? status;
  final String? message;
  final Data? data;

  const DashboardModel({this.status, this.message, this.data});

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };

  @override
  List<Object?> get props => [status, message, data];
}
