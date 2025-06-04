// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestDto _$LoginRequestDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LoginRequestDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['phone', 'otpCode'],
        );
        final val = LoginRequestDto(
          phone: $checkedConvert('phone', (v) => v as String),
          otpCode: $checkedConvert('otpCode', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$LoginRequestDtoToJson(LoginRequestDto instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'otpCode': instance.otpCode,
    };
