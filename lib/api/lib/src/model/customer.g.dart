// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Customer', json, ($checkedConvert) {
      final val = Customer(
        id: $checkedConvert('id', (v) => v as String?),
        fullName: $checkedConvert('fullName', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String?),
        addresses: $checkedConvert(
          'addresses',
          (v) => (v as List<dynamic>?)
              ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.fullName case final value?) 'fullName': value,
  if (instance.phone case final value?) 'phone': value,
  if (instance.addresses?.map((e) => e.toJson()).toList() case final value?)
    'addresses': value,
};
