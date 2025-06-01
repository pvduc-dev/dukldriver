//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'request_otp_request_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RequestOtpRequestDto {
  /// Returns a new [RequestOtpRequestDto] instance.
  RequestOtpRequestDto({

    required  this.phone,
  });

  @JsonKey(
    
    name: r'phone',
    required: true,
    includeIfNull: false,
  )


  final String phone;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RequestOtpRequestDto &&
      other.phone == phone;

    @override
    int get hashCode =>
        phone.hashCode;

  factory RequestOtpRequestDto.fromJson(Map<String, dynamic> json) => _$RequestOtpRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RequestOtpRequestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

