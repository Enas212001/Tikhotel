import 'package:equatable/equatable.dart';

import 'add_ticket_item.dart';

class AddTicketModel extends Equatable {
  final bool? status;
  final String? message;
  final AddTicketItem? data;

  const AddTicketModel({this.status, this.message, this.data});

  factory AddTicketModel.fromJson(Map<String, dynamic> json) {
    return AddTicketModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AddTicketItem.fromJson(json['data'] as Map<String, dynamic>),
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
