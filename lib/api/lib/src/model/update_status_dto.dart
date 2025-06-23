//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_status_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateStatusDto {
  /// Returns a new [UpdateStatusDto] instance.
  UpdateStatusDto({

     this.status,

     this.latestLocation,
  });

  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final UpdateStatusDtoStatusEnum? status;



  @JsonKey(
    
    name: r'latestLocation',
    required: false,
    includeIfNull: false,
  )


  final Location? latestLocation;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateStatusDto &&
      other.status == status &&
      other.latestLocation == latestLocation;

    @override
    int get hashCode =>
        status.hashCode +
        latestLocation.hashCode;

  factory UpdateStatusDto.fromJson(Map<String, dynamic> json) => _$UpdateStatusDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateStatusDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum UpdateStatusDtoStatusEnum {
@JsonValue(r'offline')
offline(r'offline'),
@JsonValue(r'online')
online(r'online'),
@JsonValue(r'on_trip')
onTrip(r'on_trip');

const UpdateStatusDtoStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


