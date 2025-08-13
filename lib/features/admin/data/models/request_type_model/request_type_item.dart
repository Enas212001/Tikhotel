import 'package:equatable/equatable.dart';

class RequestTypeItem extends Equatable {
  final int? newReqId;
  final String? requestType;

  const RequestTypeItem({this.newReqId, this.requestType});

  factory RequestTypeItem.fromJson(Map<String, dynamic> json) =>
      RequestTypeItem(
        newReqId: json['NewReq_id'] as int?,
        requestType: json['RequestType'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'NewReq_id': newReqId,
    'RequestType': requestType,
  };

  @override
  List<Object?> get props => [newReqId, requestType];
}
