import 'package:equatable/equatable.dart';

class MemberItem extends Equatable {
  final int? id;
  final String? title;
  final String? name;
  final String? email;
  final String? status;
  final String? ts;

  const MemberItem({
    this.id,
    this.title,
    this.name,
    this.email,
    this.status,
    this.ts,
  });

  factory MemberItem.fromJson(Map<String, dynamic> json) => MemberItem(
    id: json['id'] as int?,
    title: json['title'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    status: json['status'] as String?,
    ts: json['ts'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'name': name,
    'email': email,
    'status': status,
    'ts': ts,
  };

  @override
  List<Object?> get props => [id, title, name, email, status, ts];
}
