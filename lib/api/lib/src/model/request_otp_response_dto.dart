//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'request_otp_response_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RequestOtpResponseDto {
  /// Returns a new [RequestOtpResponseDto] instance.
  RequestOtpResponseDto({

    required  this.phone,
  });

  @JsonKey(
    
    name: r'phone',
    required: true,
    includeIfNull: false,
  )


  final String phone;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RequestOtpResponseDto &&
      other.phone == phone;

    @override
    int get hashCode =>
        phone.hashCode;

  factory RequestOtpResponseDto.fromJson(Map<String, dynamic> json) => _$RequestOtpResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RequestOtpResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

