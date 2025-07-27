import 'package:equatable/equatable.dart';

class RequestTypeModel extends Equatable {
  final int? newReqId;
  final String? requestType;

  const RequestTypeModel({this.newReqId, this.requestType});

  factory RequestTypeModel.fromJson(Map<String, dynamic> json) {
    return RequestTypeModel(
      newReqId: json['NewReq_id'] as int?,
      requestType: json['RequestType'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'NewReq_id': newReqId,
    'RequestType': requestType,
  };

  @override
  List<Object?> get props => [newReqId, requestType];
}
