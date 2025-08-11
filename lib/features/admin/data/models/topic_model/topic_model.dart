import 'package:equatable/equatable.dart';

import 'topic_item.dart';
import 'topic_pagination.dart';

class TopicModel extends Equatable {
  final bool? status;
  final String? message;
  final List<TopicItem>? data;
  final TopicPagination? pagination;

  const TopicModel({this.status, this.message, this.data, this.pagination});

  factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => TopicItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    pagination: json['pagination'] == null
        ? null
        : TopicPagination.fromJson(json['pagination'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
    'pagination': pagination?.toJson(),
  };

  @override
  List<Object?> get props => [status, message, data, pagination];
}
