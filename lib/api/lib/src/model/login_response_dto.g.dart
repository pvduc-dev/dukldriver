// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LoginResponseDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['token', 'user']);
      final val = LoginResponseDto(
        token: $checkedConvert('token', (v) => v as String),
        user: $checkedConvert(
          'user',
          (v) => Driver.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LoginResponseDtoToJson(LoginResponseDto instance) =>
    <String, dynamic>{'token': instance.token, 'user': instance.user.toJson()};
