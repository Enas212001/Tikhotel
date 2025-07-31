import 'package:equatable/equatable.dart';

class ReplyItem extends Equatable {
  final int? id;
  final int? ticketId;
  final String? replyText;
  final int? userId;
  final dynamic clientId;
  final dynamic rate;
  final dynamic rateDt;
  final String? created;
  final String? status;

  const ReplyItem({
    this.id,
    this.ticketId,
    this.replyText,
    this.userId,
    this.clientId,
    this.rate,
    this.rateDt,
    this.created,
    this.status,
  });

  factory ReplyItem.fromJson(Map<String, dynamic> json) => ReplyItem(
    id: json['id'] as int?,
    ticketId: json['ticket_id'] as int?,
    replyText: json['reply_text'] as String?,
    userId: json['user_id'] as int?,
    clientId: json['client_id'] as dynamic,
    rate: json['rate'] as dynamic,
    rateDt: json['rate_dt'] as dynamic,
    created: json['created'] as String?,
    status: json['status'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'ticket_id': ticketId,
    'reply_text': replyText,
    'user_id': userId,
    'client_id': clientId,
    'rate': rate,
    'rate_dt': rateDt,
    'created': created,
    'status': status,
  };

  @override
  List<Object?> get props {
    return [
      id,
      ticketId,
      replyText,
      userId,
      clientId,
      rate,
      rateDt,
      created,
      status,
    ];
  }
}
