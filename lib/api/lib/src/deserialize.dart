import 'package:openapi/src/model/address.dart';
import 'package:openapi/src/model/driver.dart';
import 'package:openapi/src/model/location.dart';
import 'package:openapi/src/model/login_request_dto.dart';
import 'package:openapi/src/model/login_response_dto.dart';
import 'package:openapi/src/model/path.dart';
import 'package:openapi/src/model/request_otp_request_dto.dart';
import 'package:openapi/src/model/request_otp_response_dto.dart';
import 'package:openapi/src/model/trip.dart';
import 'package:openapi/src/model/update_device_token_request_dto.dart';
import 'package:openapi/src/model/update_status_dto.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

  ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType, {bool growable= true}) {
      switch (targetType) {
        case 'String':
          return '$value' as ReturnType;
        case 'int':
          return (value is int ? value : int.parse('$value')) as ReturnType;
        case 'bool':
          if (value is bool) {
            return value as ReturnType;
          }
          final valueString = '$value'.toLowerCase();
          return (valueString == 'true' || valueString == '1') as ReturnType;
        case 'double':
          return (value is double ? value : double.parse('$value')) as ReturnType;
        case 'Address':
          return Address.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Driver':
          return Driver.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Location':
          return Location.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'LoginRequestDto':
          return LoginRequestDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'LoginResponseDto':
          return LoginResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Path':
          return Path.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RequestOtpRequestDto':
          return RequestOtpRequestDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RequestOtpResponseDto':
          return RequestOtpResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Trip':
          return Trip.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpdateDeviceTokenRequestDto':
          return UpdateDeviceTokenRequestDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpdateStatusDto':
          return UpdateStatusDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        default:
          RegExpMatch? match;

          if (value is List && (match = _regList.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toList(growable: growable) as ReturnType;
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toSet() as ReturnType;
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
            targetType = match![1]!.trim(); // ignore: parameter_assignments
            return Map<String, BaseType>.fromIterables(
              value.keys as Iterable<String>,
              value.values.map((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable)),
            ) as ReturnType;
          }
          break;
    }
    throw Exception('Cannot deserialize');
  }