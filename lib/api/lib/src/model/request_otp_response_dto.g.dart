// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_otp_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestOtpResponseDto _$RequestOtpResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RequestOtpResponseDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['phone']);
  final val = RequestOtpResponseDto(
    phone: $checkedConvert('phone', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$RequestOtpResponseDtoToJson(
  RequestOtpResponseDto instance,
) => <String, dynamic>{'phone': instance.phone};
