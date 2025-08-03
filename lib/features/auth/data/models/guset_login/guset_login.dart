import 'package:equatable/equatable.dart';

import 'guest_login_model.dart';

class GuestLogin extends Equatable {
  final bool? status;
  final String? message;
  final GuestLoginModel? data;

  const GuestLogin({this.status, this.message, this.data});

  factory GuestLogin.fromJson(Map<String, dynamic> json) => GuestLogin(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : GuestLoginModel.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };

  @override
  List<Object?> get props => [status, message, data];
}
