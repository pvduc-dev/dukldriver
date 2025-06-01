//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Location {
  /// Returns a new [Location] instance.
  Location({

     this.type,

     this.coordinates,
  });

  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @JsonKey(
    
    name: r'coordinates',
    required: false,
    includeIfNull: false,
  )


  final List<num>? coordinates;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Location &&
      other.type == type &&
      other.coordinates == coordinates;

    @override
    int get hashCode =>
        type.hashCode +
        coordinates.hashCode;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

