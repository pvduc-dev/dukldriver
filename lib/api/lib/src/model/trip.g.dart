// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Trip', json, ($checkedConvert) {
      final val = Trip(
        customerId: $checkedConvert('customerId', (v) => v as String?),
        driverId: $checkedConvert('driverId', (v) => v as String?),
        fromAddress: $checkedConvert(
          'fromAddress',
          (v) => v == null ? null : Address.fromJson(v as Map<String, dynamic>),
        ),
        toAddress: $checkedConvert(
          'toAddress',
          (v) => v == null ? null : Address.fromJson(v as Map<String, dynamic>),
        ),
        startedAt: $checkedConvert(
          'startedAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        completedAt: $checkedConvert(
          'completedAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        note: $checkedConvert('note', (v) => v as String?),
        price: $checkedConvert('price', (v) => v as num?),
        distance: $checkedConvert('distance', (v) => v as num?),
        path: $checkedConvert(
          'path',
          (v) => v == null ? null : Path.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
  if (instance.customerId case final value?) 'customerId': value,
  if (instance.driverId case final value?) 'driverId': value,
  if (instance.fromAddress?.toJson() case final value?) 'fromAddress': value,
  if (instance.toAddress?.toJson() case final value?) 'toAddress': value,
  if (instance.startedAt?.toIso8601String() case final value?)
    'startedAt': value,
  if (instance.completedAt?.toIso8601String() case final value?)
    'completedAt': value,
  if (instance.note case final value?) 'note': value,
  if (instance.price case final value?) 'price': value,
  if (instance.distance case final value?) 'distance': value,
  if (instance.path?.toJson() case final value?) 'path': value,
};
