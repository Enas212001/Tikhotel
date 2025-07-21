import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final int? roleId;
  final dynamic phone;
  final String? created;
  final String? lastLogin;
  final String? status;
  final String? isActive;

  const User({
    this.id,
    this.name,
    this.email,
    this.roleId,
    this.phone,
    this.created,
    this.lastLogin,
    this.status,
    this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    roleId: json['role_id'] as int?,
    phone: json['phone'] as dynamic,
    created: json['created'] as String?,
    lastLogin: json['last_login'] as String?,
    status: json['status'] as String?,
    isActive: json['is_active'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'role_id': roleId,
    'phone': phone,
    'created': created,
    'last_login': lastLogin,
    'status': status,
    'is_active': isActive,
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      roleId,
      phone,
      created,
      lastLogin,
      status,
      isActive,
    ];
  }
}
