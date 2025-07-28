import 'package:equatable/equatable.dart';

import 'problem_item.dart';

class ProblemModel extends Equatable {
  final bool? status;
  final int? total;
  final int? page;
  final int? rowCount;
  final List<ProblemItem>? data;

  const ProblemModel({
    this.status,
    this.total,
    this.page,
    this.rowCount,
    this.data,
  });

  factory ProblemModel.fromJson(Map<String, dynamic> json) => ProblemModel(
    status: json['status'] as bool?,
    total: json['total'] as int?,
    page: json['page'] as int?,
    rowCount: json['rowCount'] as int?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => ProblemItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'total': total,
    'page': page,
    'rowCount': rowCount,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [status, total, page, rowCount, data];
}
