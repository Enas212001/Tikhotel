import 'package:equatable/equatable.dart';

class LocationItem extends Equatable {
  final int? id;
  final String? location;
  final String? roomStatus;
  final String? status;
  final String? ts;

  const LocationItem({
    this.id,
    this.location,
    this.roomStatus,
    this.status,
    this.ts,
  });

  factory LocationItem.fromJson(Map<String, dynamic> json) => LocationItem(
    id: json['id'] as int?,
    location: json['location'] as String?,
    roomStatus: json['room_status'] as String?,
    status: json['status'] as String?,
    ts: json['ts'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'location': location,
    'room_status': roomStatus,
    'status': status,
    'ts': ts,
  };

  @override
  List<Object?> get props => [id, location, roomStatus, status, ts];
}
