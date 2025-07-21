import 'package:equatable/equatable.dart';

import 'user.dart';

class LoginModel extends Equatable {
  final bool? status;
  final String? message;
  final User? user;

  const LoginModel({this.status, this.message, this.user});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'user': user?.toJson(),
  };

  @override
  List<Object?> get props => [status, message, user];
}
