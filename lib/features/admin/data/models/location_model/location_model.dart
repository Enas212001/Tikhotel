import 'package:equatable/equatable.dart';

import 'location_item.dart';
import 'location_pagination.dart';

class LocationModel extends Equatable {
  final bool? status;
  final String? message;
  final List<LocationItem>? data;
  final LocationPagination? pagination;

  const LocationModel({this.status, this.message, this.data, this.pagination});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => LocationItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    pagination: json['pagination'] == null
        ? null
        : LocationPagination.fromJson(
            json['pagination'] as Map<String, dynamic>,
          ),
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
