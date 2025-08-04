import 'package:equatable/equatable.dart';

import 'report_item.dart';

class ReportModel extends Equatable {
  final bool? status;
  final String? message;
  final List<ReportItem>? data;

  const ReportModel({this.status, this.message, this.data});

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => ReportItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [status, message, data];
}
