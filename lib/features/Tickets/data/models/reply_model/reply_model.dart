import 'package:equatable/equatable.dart';

import 'replay_item.dart';

class ReplyModel extends Equatable {
  final bool? status;
  final String? message;
  final ReplyItem? data;

  const ReplyModel({this.status, this.message, this.data});

  factory ReplyModel.fromJson(Map<String, dynamic> json) => ReplyModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : ReplyItem.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };

  @override
  List<Object?> get props => [status, message, data];
}
