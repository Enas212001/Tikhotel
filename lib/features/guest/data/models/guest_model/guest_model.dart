import 'package:equatable/equatable.dart';

class GuestModel extends Equatable {
  final int? id;
  final int? nameId;
  final String? title;
  final String? fname;
  final String? name;
  final int? room;
  final String? roomStatus;
  final String? beginDate;
  final String? endDate;
  final dynamic email;
  final dynamic vip;
  final dynamic password;
  final dynamic website;
  final dynamic clientSince;
  final dynamic countryId;
  final dynamic state;
  final dynamic city;
  final dynamic address;
  final dynamic phone;
  final dynamic cellPhone;
  final dynamic fax;
  final dynamic notes;
  final String? lastLogin;
  final String? status;
  final String? ts;
  final String? test;

  const GuestModel({
    this.id,
    this.nameId,
    this.title,
    this.fname,
    this.name,
    this.room,
    this.roomStatus,
    this.beginDate,
    this.endDate,
    this.email,
    this.vip,
    this.password,
    this.website,
    this.clientSince,
    this.countryId,
    this.state,
    this.city,
    this.address,
    this.phone,
    this.cellPhone,
    this.fax,
    this.notes,
    this.lastLogin,
    this.status,
    this.ts,
    this.test,
  });

  factory GuestModel.fromJson(Map<String, dynamic> json) => GuestModel(
    id: json['id'] as int?,
    nameId: json['NAME_ID'] as int?,
    title: json['TITLE'] as String?,
    fname: json['fname'] as String?,
    name: json['name'] as String?,
    room: json['room'] as int?,
    roomStatus: json['room_status'] as String?,
    beginDate: json['BEGIN_DATE'] as String?,
    endDate: json['END_DATE'] as String?,
    email: json['email'] as dynamic,
    vip: json['vip'] as dynamic,
    password: json['password'] as dynamic,
    website: json['website'] as dynamic,
    clientSince: json['client_since'] as dynamic,
    countryId: json['country_id'] as dynamic,
    state: json['state'] as dynamic,
    city: json['city'] as dynamic,
    address: json['address'] as dynamic,
    phone: json['phone'] as dynamic,
    cellPhone: json['cell_phone'] as dynamic,
    fax: json['fax'] as dynamic,
    notes: json['notes'] as dynamic,
    lastLogin: json['last_login'] as String?,
    status: json['status'] as String?,
    ts: json['ts'] as String?,
    test: json['test'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'NAME_ID': nameId,
    'TITLE': title,
    'fname': fname,
    'name': name,
    'room': room,
    'room_status': roomStatus,
    'BEGIN_DATE': beginDate,
    'END_DATE': endDate,
    'email': email,
    'vip': vip,
    'password': password,
    'website': website,
    'client_since': clientSince,
    'country_id': countryId,
    'state': state,
    'city': city,
    'address': address,
    'phone': phone,
    'cell_phone': cellPhone,
    'fax': fax,
    'notes': notes,
    'last_login': lastLogin,
    'status': status,
    'ts': ts,
    'test': test,
  };

  @override
  List<Object?> get props {
    return [
      id,
      nameId,
      title,
      fname,
      name,
      room,
      roomStatus,
      beginDate,
      endDate,
      email,
      vip,
      password,
      website,
      clientSince,
      countryId,
      state,
      city,
      address,
      phone,
      cellPhone,
      fax,
      notes,
      lastLogin,
      status,
      ts,
      test,
    ];
  }
}
