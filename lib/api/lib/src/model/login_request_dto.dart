//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginRequestDto {
  /// Returns a new [LoginRequestDto] instance.
  LoginRequestDto({

    required  this.phone,

    required  this.otpCode,
  });

  @JsonKey(
    
    name: r'phone',
    required: true,
    includeIfNull: false,
  )


  final String phone;



  @JsonKey(
    
    name: r'otpCode',
    required: true,
    includeIfNull: false,
  )


  final String otpCode;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LoginRequestDto &&
      other.phone == phone &&
      other.otpCode == otpCode;

    @override
    int get hashCode =>
        phone.hashCode +
        otpCode.hashCode;

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) => _$LoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

