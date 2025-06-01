//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'path.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Path {
  /// Returns a new [Path] instance.
  Path({

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
    bool operator ==(Object other) => identical(this, other) || other is Path &&
      other.type == type &&
      other.coordinates == coordinates;

    @override
    int get hashCode =>
        type.hashCode +
        coordinates.hashCode;

  factory Path.fromJson(Map<String, dynamic> json) => _$PathFromJson(json);

  Map<String, dynamic> toJson() => _$PathToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

