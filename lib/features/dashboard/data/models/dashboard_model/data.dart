import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final num? total;
  final int? newR;
  final int? active;
  final int? closed;
  final int? pending;

  const Data({this.total, this.newR, this.active, this.closed, this.pending});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json['total'] as int?,
    newR: json['new'] as int?,
    active: json['active'] as int?,
    closed: json['closed'] as int?,
    pending: json['pending'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'total': total,
    'new': newR,
    'active': active,
    'closed': closed,
    'pending': pending,
  };

  @override
  List<Object?> get props => [total, newR, active, closed, pending];
}
