import 'package:equatable/equatable.dart';

import 'user_model.dart';
import 'user_pagination.dart';

class User extends Equatable {
  final bool? status;
  final String? message;
  final List<UserModel>? data;
  final UserPagination? pagination;

  const User({this.status, this.message, this.data, this.pagination});

  factory User.fromJson(Map<String, dynamic> json) => User(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    pagination: json['pagination'] == null
        ? null
        : UserPagination.fromJson(json['pagination'] as Map<String, dynamic>),
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
