import 'package:equatable/equatable.dart';
import 'package:ticket_flow/features/guest/data/models/guest_model/guest_model.dart';

class GuestLoginModel extends Equatable {
  final int? id;
  final String? fname;
  final String? name;
  final int? room;
  final String? roomStatus;
  final String? beginDate;
  final String? endDate;
  final dynamic email;
  final dynamic vip;
  final dynamic countryId;
  final dynamic phone;
  final String? status;

  const GuestLoginModel({
    this.id,
    this.fname,
    this.name,
    this.room,
    this.roomStatus,
    this.beginDate,
    this.endDate,
    this.email,
    this.vip,
    this.countryId,
    this.phone,
    this.status,
  });

  factory GuestLoginModel.fromJson(Map<String, dynamic> json) =>
      GuestLoginModel(
        id: json['id'] as int?,
        fname: json['fname'] as String?,
        name: json['name'] as String?,
        room: json['room'] as int?,
        roomStatus: json['room_status'] as String?,
        beginDate: json['BEGIN_DATE'] as String?,
        endDate: json['END_DATE'] as String?,
        email: json['email'] as dynamic,
        vip: json['vip'] as dynamic,
        countryId: json['country_id'] as dynamic,
        phone: json['phone'] as dynamic,
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'fname': fname,
    'name': name,
    'room': room,
    'room_status': roomStatus,
    'BEGIN_DATE': beginDate,
    'END_DATE': endDate,
    'email': email,
    'vip': vip,
    'country_id': countryId,
    'phone': phone,
    'status': status,
  };

  @override
  List<Object?> get props {
    return [
      id,
      fname,
      name,
      room,
      roomStatus,
      beginDate,
      endDate,
      email,
      vip,
      countryId,
      phone,
      status,
    ];
  }
}

extension GuestLoginMapper on GuestLoginModel {
  GuestModel toGuestModel() {
    return GuestModel(
      id: id,
      fname: fname,
      name: name,
      room: room,
      roomStatus: roomStatus,
      beginDate: beginDate,
      endDate: endDate,
      email: email,
      vip: vip,
      countryId: countryId,
      phone: phone,
      status: status,
      // Other fields not provided by GuestLoginModel remain null
    );
  }
}
