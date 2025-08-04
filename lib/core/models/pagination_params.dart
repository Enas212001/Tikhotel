class PaginationParams {
  final int page;
  final int limit;
  final String? search;

  const PaginationParams({
    this.page = 1,
    this.limit = 20,
    this.search,
  });

  Map<String, dynamic> toQueryParams() {
    final params = <String, dynamic>{
      'page': page,
      'limit': limit,
    };
    
    if (search != null && search!.isNotEmpty) {
      params['search'] = search;
    }
    
    return params;
  }

  PaginationParams copyWith({
    int? page,
    int? limit,
    String? search,
  }) {
    return PaginationParams(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      search: search ?? this.search,
    );
  }
}
