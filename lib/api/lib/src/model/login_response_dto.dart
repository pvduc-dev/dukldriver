//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/driver.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginResponseDto {
  /// Returns a new [LoginResponseDto] instance.
  LoginResponseDto({

    required  this.token,

    required  this.user,
  });

  @JsonKey(
    
    name: r'token',
    required: true,
    includeIfNull: false,
  )


  final String token;



  @JsonKey(
    
    name: r'user',
    required: true,
    includeIfNull: false,
  )


  final Driver user;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LoginResponseDto &&
      other.token == token &&
      other.user == user;

    @override
    int get hashCode =>
        token.hashCode +
        user.hashCode;

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) => _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

