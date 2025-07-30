import 'package:equatable/equatable.dart';

class WorkerItem extends Equatable {
  final int? id;
  final String? fname;
  final dynamic lname;
  final dynamic specialist;
  final int? phone;
  final int? departmentId;
  final String? status;
  final String? ts;
  final String? token;
  final int? stWhatsapp;
  final String? departmentName;

  const WorkerItem({
    this.id,
    this.fname,
    this.lname,
    this.specialist,
    this.phone,
    this.departmentId,
    this.status,
    this.ts,
    this.token,
    this.stWhatsapp,
    this.departmentName,
  });

  factory WorkerItem.fromJson(Map<String, dynamic> json) => WorkerItem(
    id: json['id'] as int?,
    fname: json['fname'] as String?,
    lname: json['lname'] as dynamic,
    specialist: json['specialist'] as dynamic,
    phone: json['phone'] as int?,
    departmentId: json['department_id'] as int?,
    status: json['status']?.toString(),
    ts: json['ts'] as String?,
    token: json['token'] as String?,
    stWhatsapp: json['st_whatsapp'] as int?,
    departmentName: json['department_name'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'fname': fname,
    'lname': lname,
    'specialist': specialist,
    'phone': phone,
    'department_id': departmentId,
    'status': status,
    'ts': ts,
    'token': token,
    'st_whatsapp': stWhatsapp,
    'department_name': departmentName,
  };

  @override
  List<Object?> get props {
    return [
      id,
      fname,
      lname,
      specialist,
      phone,
      departmentId,
      status,
      ts,
      token,
      stWhatsapp,
      departmentName,
    ];
  }
}
