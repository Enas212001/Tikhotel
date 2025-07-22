import 'package:equatable/equatable.dart';

import 'user_model.dart';

class User extends Equatable {
  final bool? status;
  final String? message;
  final List<UserModel>? data;

  const User({this.status, this.message, this.data});

  factory User.fromJson(Map<String, dynamic> json) => User(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [status, message, data];
}
