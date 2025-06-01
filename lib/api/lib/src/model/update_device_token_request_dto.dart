//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'update_device_token_request_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateDeviceTokenRequestDto {
  /// Returns a new [UpdateDeviceTokenRequestDto] instance.
  UpdateDeviceTokenRequestDto({

    required  this.token,
  });

      /// The device token
  @JsonKey(
    
    name: r'token',
    required: true,
    includeIfNull: false,
  )


  final String token;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateDeviceTokenRequestDto &&
      other.token == token;

    @override
    int get hashCode =>
        token.hashCode;

  factory UpdateDeviceTokenRequestDto.fromJson(Map<String, dynamic> json) => _$UpdateDeviceTokenRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateDeviceTokenRequestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

