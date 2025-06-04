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

     this.fullName,

     this.phone,

     this.location,

     this.isAvailable,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final String? id;



  @JsonKey(
    
    name: r'fullName',
    required: false,
    includeIfNull: false,
  )


  final String? fullName;



  @JsonKey(
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;



  @JsonKey(
    
    name: r'location',
    required: false,
    includeIfNull: false,
  )


  final Location? location;



  @JsonKey(
    
    name: r'isAvailable',
    required: false,
    includeIfNull: false,
  )


  final bool? isAvailable;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Driver &&
      other.id == id &&
      other.fullName == fullName &&
      other.phone == phone &&
      other.location == location &&
      other.isAvailable == isAvailable;

    @override
    int get hashCode =>
        id.hashCode +
        fullName.hashCode +
        phone.hashCode +
        location.hashCode +
        isAvailable.hashCode;

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

