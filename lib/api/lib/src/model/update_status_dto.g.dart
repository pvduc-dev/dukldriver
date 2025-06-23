// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateStatusDto _$UpdateStatusDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateStatusDto', json, ($checkedConvert) {
      final val = UpdateStatusDto(
        status: $checkedConvert(
          'status',
          (v) => $enumDecodeNullable(_$UpdateStatusDtoStatusEnumEnumMap, v),
        ),
        latestLocation: $checkedConvert(
          'latestLocation',
          (v) =>
              v == null ? null : Location.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UpdateStatusDtoToJson(UpdateStatusDto instance) =>
    <String, dynamic>{
      if (_$UpdateStatusDtoStatusEnumEnumMap[instance.status] case final value?)
        'status': value,
      if (instance.latestLocation?.toJson() case final value?)
        'latestLocation': value,
    };

const _$UpdateStatusDtoStatusEnumEnumMap = {
  UpdateStatusDtoStatusEnum.offline: 'offline',
  UpdateStatusDtoStatusEnum.online: 'online',
  UpdateStatusDtoStatusEnum.onTrip: 'on_trip',
};
