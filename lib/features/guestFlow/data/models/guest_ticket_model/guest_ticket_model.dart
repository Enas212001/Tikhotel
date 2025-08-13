import 'package:equatable/equatable.dart';

import 'guest_ticket_item.dart';

class GuestTicketModel extends Equatable {
  final bool? status;
  final String? message;
  final int? page;
  final int? limit;
  final List<GuestTicketItem>? data;

  const GuestTicketModel({
    this.status,
    this.message,
    this.page,
    this.limit,
    this.data,
  });

  factory GuestTicketModel.fromJson(Map<String, dynamic> json) {
    return GuestTicketModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GuestTicketItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'page': page,
    'limit': limit,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [status, message, page, limit, data];
}
