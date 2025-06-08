// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Address', json, ($checkedConvert) {
      final val = Address(
        description: $checkedConvert('description', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        location: $checkedConvert(
          'location',
          (v) =>
              v == null ? null : Location.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  if (instance.description case final value?) 'description': value,
  if (instance.name case final value?) 'name': value,
  if (instance.location?.toJson() case final value?) 'location': value,
};
