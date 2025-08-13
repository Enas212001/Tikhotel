import 'package:equatable/equatable.dart';

import 'add_guest_ticket_item.dart';

class AddGuestTicketModel extends Equatable {
  final bool? status;
  final String? message;
  final AddGuestTicketItem? data;

  const AddGuestTicketModel({this.status, this.message, this.data});

  factory AddGuestTicketModel.fromJson(Map<String, dynamic> json) {
    return AddGuestTicketModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AddGuestTicketItem.fromJson(json['data'] as Map<String, dynamic>),
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
