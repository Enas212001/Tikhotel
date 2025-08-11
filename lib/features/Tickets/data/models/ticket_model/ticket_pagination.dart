import 'package:equatable/equatable.dart';

class TicketPagination extends Equatable {
  final int? page;
  final int? limit;
  final int? total;

  const TicketPagination({this.page, this.limit, this.total});

  factory TicketPagination.fromJson(Map<String, dynamic> json) =>
      TicketPagination(
        page: json['page'] ?? 1,
        limit: json['limit'] ?? 20,
        total: json['total'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
    'page': page,
    'limit': limit,
    'total': total,
  };


  @override
  List<Object?> get props => [page, limit, total];
}
