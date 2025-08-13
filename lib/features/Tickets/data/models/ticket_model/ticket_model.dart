import 'package:equatable/equatable.dart';

import 'ticket_item.dart';
import 'ticket_pagination.dart';

class TicketModel extends Equatable {
  final bool? status;
  final String? message;
  final List<TicketItem>? data;
  final TicketPagination? pagination;

  const TicketModel({this.status, this.message, this.data, this.pagination});

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => TicketItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    pagination: json['pagination'] == null
        ? null
        : TicketPagination.fromJson(json['pagination'] as Map<String, dynamic>),
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
