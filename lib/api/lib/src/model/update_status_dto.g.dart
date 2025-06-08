// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateStatusDto _$UpdateStatusDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateStatusDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['isAvailable']);
      final val = UpdateStatusDto(
        isAvailable: $checkedConvert('isAvailable', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$UpdateStatusDtoToJson(UpdateStatusDto instance) =>
    <String, dynamic>{'isAvailable': instance.isAvailable};
