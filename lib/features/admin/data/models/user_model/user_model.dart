import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? email;
  final String? name;
  final dynamic phone;
  final String? created;
  final String? lastLogin;
  final String? status;
  final String? isActive;
  final String? ip;
  final String? role;
  final String? password;
  final String? departments;

  const UserModel({
    this.id,
    this.email,
    this.name,
    this.phone,
    this.created,
    this.lastLogin,
    this.status,
    this.isActive,
    this.ip,
    this.role,
    this.password,
    this.departments,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as int?,
    email: json['email'] as String?,
    name: json['name'] as String?,
    phone: json['phone'] as dynamic,
    created: json['created'] as String?,
    lastLogin: json['last_login'] as String?,
    status: json['status']?.toString(),
    isActive: json['is_active'] as String?,
    ip: json['ip'] as String?,
    role: json['role'] as String?,
    password: json['password'] ?? '********',
    departments: json['departments'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'phone': phone,
    'created': created,
    'last_login': lastLogin,
    'status': status,
    'is_active': isActive,
    'ip': ip,
    'role': role,
    'password': password,
    'departments': departments,
  };

  @override
  List<Object?> get props {
    return [
      id,
      email,
      name,
      phone,
      created,
      lastLogin,
      status,
      isActive,
      ip,
      role,
      password,
      departments,
    ];
  }
}
