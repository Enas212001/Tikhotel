import 'package:equatable/equatable.dart';

class DepartmentPagination extends Equatable {
  final int? page;
  final int? limit;
  final int? total;

  const DepartmentPagination({this.page, this.limit, this.total});

  factory DepartmentPagination.fromJson(Map<String, dynamic> json) =>
      DepartmentPagination(
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
