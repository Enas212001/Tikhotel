import 'package:equatable/equatable.dart';

class ProblemPagination extends Equatable {
  final int? page;
  final int? limit;
  final int? total;

  const ProblemPagination({this.page, this.limit, this.total});

  factory ProblemPagination.fromJson(Map<String, dynamic> json) =>
      ProblemPagination(
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
