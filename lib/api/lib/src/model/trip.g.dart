// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Trip', json, ($checkedConvert) {
      final val = Trip(
        id: $checkedConvert('id', (v) => v as String?),
        customer: $checkedConvert(
          'customer',
          (v) =>
              v == null ? null : Customer.fromJson(v as Map<String, dynamic>),
        ),
        driver: $checkedConvert(
          'driver',
          (v) => v == null ? null : Driver.fromJson(v as Map<String, dynamic>),
        ),
        pickup: $checkedConvert(
          'pickup',
          (v) => v == null ? null : Address.fromJson(v as Map<String, dynamic>),
        ),
        dropoff: $checkedConvert(
          'dropoff',
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
        status: $checkedConvert(
          'status',
          (v) => $enumDecodeNullable(_$TripStatusEnumEnumMap, v),
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
  if (instance.id case final value?) 'id': value,
  if (instance.customer?.toJson() case final value?) 'customer': value,
  if (instance.driver?.toJson() case final value?) 'driver': value,
  if (instance.pickup?.toJson() case final value?) 'pickup': value,
  if (instance.dropoff?.toJson() case final value?) 'dropoff': value,
  if (instance.startedAt?.toIso8601String() case final value?)
    'startedAt': value,
  if (instance.completedAt?.toIso8601String() case final value?)
    'completedAt': value,
  if (_$TripStatusEnumEnumMap[instance.status] case final value?)
    'status': value,
  if (instance.note case final value?) 'note': value,
  if (instance.price case final value?) 'price': value,
  if (instance.distance case final value?) 'distance': value,
  if (instance.path?.toJson() case final value?) 'path': value,
};

const _$TripStatusEnumEnumMap = {
  TripStatusEnum.PENDING: 'PENDING',
  TripStatusEnum.REQUESTED: 'REQUESTED',
  TripStatusEnum.ACCEPTED: 'ACCEPTED',
  TripStatusEnum.ARRIVING: 'ARRIVING',
  TripStatusEnum.IN_PROGRESS: 'IN_PROGRESS',
  TripStatusEnum.COMPLETED: 'COMPLETED',
  TripStatusEnum.CANCELLED_BY_CUSTOMER: 'CANCELLED_BY_CUSTOMER',
  TripStatusEnum.CANCELLED_BY_DRIVER: 'CANCELLED_BY_DRIVER',
  TripStatusEnum.CANCELLED_BY_SYSTEM: 'CANCELLED_BY_SYSTEM',
  TripStatusEnum.NO_SHOW: 'NO_SHOW',
  TripStatusEnum.FAILED: 'FAILED',
};
