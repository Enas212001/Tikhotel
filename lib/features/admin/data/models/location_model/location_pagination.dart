import 'package:equatable/equatable.dart';

class LocationPagination extends Equatable {
  final int? page;
  final int? limit;
  final int? total;

  const LocationPagination({this.page, this.limit, this.total});

  factory LocationPagination.fromJson(Map<String, dynamic> json) =>
      LocationPagination(
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
