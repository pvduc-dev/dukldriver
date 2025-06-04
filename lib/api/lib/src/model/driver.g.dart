// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Driver',
      json,
      ($checkedConvert) {
        final val = Driver(
          id: $checkedConvert('id', (v) => v as String?),
          fullName: $checkedConvert('fullName', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          location: $checkedConvert(
              'location',
              (v) => v == null
                  ? null
                  : Location.fromJson(v as Map<String, dynamic>)),
          isAvailable: $checkedConvert('isAvailable', (v) => v as bool?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.fullName case final value?) 'fullName': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.location?.toJson() case final value?) 'location': value,
      if (instance.isAvailable case final value?) 'isAvailable': value,
    };
