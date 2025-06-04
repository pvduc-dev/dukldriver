// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_device_token_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDeviceTokenRequestDto _$UpdateDeviceTokenRequestDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'UpdateDeviceTokenRequestDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['token'],
        );
        final val = UpdateDeviceTokenRequestDto(
          token: $checkedConvert('token', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$UpdateDeviceTokenRequestDtoToJson(
        UpdateDeviceTokenRequestDto instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
