// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Driver', json, ($checkedConvert) {
      final val = Driver(
        id: $checkedConvert('id', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String?),
        status: $checkedConvert(
          'status',
          (v) => $enumDecodeNullable(_$DriverStatusEnumEnumMap, v),
        ),
        latestLocation: $checkedConvert(
          'latestLocation',
          (v) =>
              v == null ? null : Location.fromJson(v as Map<String, dynamic>),
        ),
        latestUpdate: $checkedConvert(
          'latestUpdate',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.name case final value?) 'name': value,
  if (instance.phone case final value?) 'phone': value,
  if (_$DriverStatusEnumEnumMap[instance.status] case final value?)
    'status': value,
  if (instance.latestLocation?.toJson() case final value?)
    'latestLocation': value,
  if (instance.latestUpdate?.toIso8601String() case final value?)
    'latestUpdate': value,
};

const _$DriverStatusEnumEnumMap = {
  DriverStatusEnum.offline: 'offline',
  DriverStatusEnum.online: 'online',
  DriverStatusEnum.onTrip: 'on_trip',
};
