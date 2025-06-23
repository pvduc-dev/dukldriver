//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'driver.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Driver {
  /// Returns a new [Driver] instance.
  Driver({

     this.id,

     this.name,

     this.phone,

     this.status,

     this.latestLocation,

     this.latestUpdate,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final String? id;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final DriverStatusEnum? status;



  @JsonKey(
    
    name: r'latestLocation',
    required: false,
    includeIfNull: false,
  )


  final Location? latestLocation;



  @JsonKey(
    
    name: r'latestUpdate',
    required: false,
    includeIfNull: false,
  )


  final DateTime? latestUpdate;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Driver &&
      other.id == id &&
      other.name == name &&
      other.phone == phone &&
      other.status == status &&
      other.latestLocation == latestLocation &&
      other.latestUpdate == latestUpdate;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        phone.hashCode +
        status.hashCode +
        latestLocation.hashCode +
        latestUpdate.hashCode;

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum DriverStatusEnum {
@JsonValue(r'offline')
offline(r'offline'),
@JsonValue(r'online')
online(r'online'),
@JsonValue(r'on_trip')
onTrip(r'on_trip');

const DriverStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


