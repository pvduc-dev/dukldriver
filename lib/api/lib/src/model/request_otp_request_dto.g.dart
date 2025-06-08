// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_otp_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestOtpRequestDto _$RequestOtpRequestDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RequestOtpRequestDto', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['phone']);
  final val = RequestOtpRequestDto(
    phone: $checkedConvert('phone', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$RequestOtpRequestDtoToJson(
  RequestOtpRequestDto instance,
) => <String, dynamic>{'phone': instance.phone};
