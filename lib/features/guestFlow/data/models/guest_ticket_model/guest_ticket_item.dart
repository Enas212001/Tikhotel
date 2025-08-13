import 'package:equatable/equatable.dart';

class GuestTicketItem extends Equatable {
  final int? id;
  final String? ticketId;
  final int? clientId;
  final int? departmentId;
  final int? problemId;
  final int? qty;
  final int? workerId;
  final dynamic locationId;
  final dynamic userId;
  final dynamic vip;
  final int? duration;
  final String? message;
  final dynamic notes;
  final dynamic ip;
  final String? created;
  final String? accepted;
  final String? closed;
  final String? status;
  final String? ts;
  final int? requestId;
  final String? compensation;
  final int? amountEgp;
  final String? clientFeedback;
  final dynamic rating;
  final dynamic holdReason;
  final dynamic holdStart;
  final dynamic holdTime;
  final dynamic phone;
  final dynamic confirmationTokens;
  final String? mac;
  final String? ticketFeedback;
  final String? closedFeedbackTime;
  final dynamic acceptedAfterClosedTime;
  final String? requestedBy;
  final String? requestedUser;
  final String? testing;
  final dynamic response;

  const GuestTicketItem({
    this.id,
    this.ticketId,
    this.clientId,
    this.departmentId,
    this.problemId,
    this.qty,
    this.workerId,
    this.locationId,
    this.userId,
    this.vip,
    this.duration,
    this.message,
    this.notes,
    this.ip,
    this.created,
    this.accepted,
    this.closed,
    this.status,
    this.ts,
    this.requestId,
    this.compensation,
    this.amountEgp,
    this.clientFeedback,
    this.rating,
    this.holdReason,
    this.holdStart,
    this.holdTime,
    this.phone,
    this.confirmationTokens,
    this.mac,
    this.ticketFeedback,
    this.closedFeedbackTime,
    this.acceptedAfterClosedTime,
    this.requestedBy,
    this.requestedUser,
    this.testing,
    this.response,
  });

  factory GuestTicketItem.fromJson(Map<String, dynamic> json) =>
      GuestTicketItem(
        id: json['id'] as int?,
        ticketId: json['ticket_id'] as String?,
        clientId: json['client_id'] as int?,
        departmentId: json['department_id'] as int?,
        problemId: json['problem_id'] as int?,
        qty: json['qty'] as int?,
        workerId: json['worker_id'] as int?,
        locationId: json['location_id'] as dynamic,
        userId: json['user_id'] as dynamic,
        vip: json['vip'] as dynamic,
        duration: json['duration'] as int?,
        message: json['message'] as String?,
        notes: json['notes'] as dynamic,
        ip: json['ip'] as dynamic,
        created: json['created'] as String?,
        accepted: json['accepted'] as String?,
        closed: json['closed'] as String?,
        status: json['status'] as String?,
        ts: json['ts'] as String?,
        requestId: json['request_id'] as int?,
        compensation: json['compensation'] as String?,
        amountEgp: json['amount_EGP'] as int?,
        clientFeedback: json['client_feedback'] as String?,
        rating: json['rating'] as dynamic,
        holdReason: json['hold_reason'] as dynamic,
        holdStart: json['hold_start'] as dynamic,
        holdTime: json['hold_time'] as dynamic,
        phone: json['phone'] as dynamic,
        confirmationTokens: json['confirmation_tokens'] as dynamic,
        mac: json['mac'] as String?,
        ticketFeedback: json['ticket_feedback'] as String?,
        closedFeedbackTime: json['ClosedFeedback_time'] as String?,
        acceptedAfterClosedTime: json['AcceptedAfterClosed_Time'] as dynamic,
        requestedBy: json['requested_by'] as String?,
        requestedUser: json['requestedUser'] as String?,
        testing: json['testing'] as String?,
        response: json['response'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'ticket_id': ticketId,
    'client_id': clientId,
    'department_id': departmentId,
    'problem_id': problemId,
    'qty': qty,
    'worker_id': workerId,
    'location_id': locationId,
    'user_id': userId,
    'vip': vip,
    'duration': duration,
    'message': message,
    'notes': notes,
    'ip': ip,
    'created': created,
    'accepted': accepted,
    'closed': closed,
    'status': status,
    'ts': ts,
    'request_id': requestId,
    'compensation': compensation,
    'amount_EGP': amountEgp,
    'client_feedback': clientFeedback,
    'rating': rating,
    'hold_reason': holdReason,
    'hold_start': holdStart,
    'hold_time': holdTime,
    'phone': phone,
    'confirmation_tokens': confirmationTokens,
    'mac': mac,
    'ticket_feedback': ticketFeedback,
    'ClosedFeedback_time': closedFeedbackTime,
    'AcceptedAfterClosed_Time': acceptedAfterClosedTime,
    'requested_by': requestedBy,
    'requestedUser': requestedUser,
    'testing': testing,
    'response': response,
  };

  @override
  List<Object?> get props {
    return [
      id,
      ticketId,
      clientId,
      departmentId,
      problemId,
      qty,
      workerId,
      locationId,
      userId,
      vip,
      duration,
      message,
      notes,
      ip,
      created,
      accepted,
      closed,
      status,
      ts,
      requestId,
      compensation,
      amountEgp,
      clientFeedback,
      rating,
      holdReason,
      holdStart,
      holdTime,
      phone,
      confirmationTokens,
      mac,
      ticketFeedback,
      closedFeedbackTime,
      acceptedAfterClosedTime,
      requestedBy,
      requestedUser,
      testing,
      response,
    ];
  }
}
