import 'package:equatable/equatable.dart';

class Pagination extends Equatable {
  final int? page;
  final int? limit;
  final int? total;

  const Pagination({this.page, this.limit, this.total});

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    page: json['page'] as int?,
    limit: json['limit'] as int?,
    total: json['total'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'page': page,
    'limit': limit,
    'total': total,
  };

  @override
  List<Object?> get props => [page, limit, total];
}
