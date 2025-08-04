import 'package:ticket_flow/features/Tickets/data/models/ticket_model/pagination.dart';

class PaginationModel<T> {
  final List<T> data;
  final Pagination pagination;

  const PaginationModel({
    required this.data,
    required this.pagination,
  });

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginationModel<T>(
      data: (json['data'] as List)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );
  }

  bool get hasMoreData {
    final currentPage = pagination.page ?? 1;
    final limit = pagination.limit ?? 20;
    final total = pagination.total ?? 0;
    return (currentPage * limit) < total;
  }

  int get nextPage => (pagination.page ?? 1) + 1;
}
