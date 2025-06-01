// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Address', json, ($checkedConvert) {
      final val = Address(
        longName: $checkedConvert('longName', (v) => v as String?),
        shortName: $checkedConvert('shortName', (v) => v as String?),
        location: $checkedConvert(
          'location',
          (v) =>
              v == null ? null : Location.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  if (instance.longName case final value?) 'longName': value,
  if (instance.shortName case final value?) 'shortName': value,
  if (instance.location?.toJson() case final value?) 'location': value,
};
