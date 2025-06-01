//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Address {
  /// Returns a new [Address] instance.
  Address({

     this.longName,

     this.shortName,

     this.location,
  });

  @JsonKey(
    
    name: r'longName',
    required: false,
    includeIfNull: false,
  )


  final String? longName;



  @JsonKey(
    
    name: r'shortName',
    required: false,
    includeIfNull: false,
  )


  final String? shortName;



  @JsonKey(
    
    name: r'location',
    required: false,
    includeIfNull: false,
  )


  final Location? location;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Address &&
      other.longName == longName &&
      other.shortName == shortName &&
      other.location == location;

    @override
    int get hashCode =>
        longName.hashCode +
        shortName.hashCode +
        location.hashCode;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

