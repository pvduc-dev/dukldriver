//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
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

    required  this.isAvailable,
  });

  @JsonKey(
    
    name: r'isAvailable',
    required: true,
    includeIfNull: false,
  )


  final bool isAvailable;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateStatusDto &&
      other.isAvailable == isAvailable;

    @override
    int get hashCode =>
        isAvailable.hashCode;

  factory UpdateStatusDto.fromJson(Map<String, dynamic> json) => _$UpdateStatusDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateStatusDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

