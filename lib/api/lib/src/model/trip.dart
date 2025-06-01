//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/address.dart';
import 'package:openapi/src/model/path.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Trip {
  /// Returns a new [Trip] instance.
  Trip({

     this.customerId,

     this.driverId,

     this.fromAddress,

     this.toAddress,

     this.startedAt,

     this.completedAt,

     this.note,

     this.price,

     this.distance,

     this.path,
  });

  @JsonKey(
    
    name: r'customerId',
    required: false,
    includeIfNull: false,
  )


  final String? customerId;



  @JsonKey(
    
    name: r'driverId',
    required: false,
    includeIfNull: false,
  )


  final String? driverId;



  @JsonKey(
    
    name: r'fromAddress',
    required: false,
    includeIfNull: false,
  )


  final Address? fromAddress;



  @JsonKey(
    
    name: r'toAddress',
    required: false,
    includeIfNull: false,
  )


  final Address? toAddress;



  @JsonKey(
    
    name: r'startedAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? startedAt;



  @JsonKey(
    
    name: r'completedAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? completedAt;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;



  @JsonKey(
    
    name: r'price',
    required: false,
    includeIfNull: false,
  )


  final num? price;



  @JsonKey(
    
    name: r'distance',
    required: false,
    includeIfNull: false,
  )


  final num? distance;



  @JsonKey(
    
    name: r'path',
    required: false,
    includeIfNull: false,
  )


  final Path? path;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Trip &&
      other.customerId == customerId &&
      other.driverId == driverId &&
      other.fromAddress == fromAddress &&
      other.toAddress == toAddress &&
      other.startedAt == startedAt &&
      other.completedAt == completedAt &&
      other.note == note &&
      other.price == price &&
      other.distance == distance &&
      other.path == path;

    @override
    int get hashCode =>
        customerId.hashCode +
        driverId.hashCode +
        fromAddress.hashCode +
        toAddress.hashCode +
        startedAt.hashCode +
        completedAt.hashCode +
        note.hashCode +
        price.hashCode +
        distance.hashCode +
        path.hashCode;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

