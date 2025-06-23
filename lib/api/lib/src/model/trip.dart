//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/address.dart';
import 'package:openapi/src/model/path.dart';
import 'package:openapi/src/model/driver.dart';
import 'package:openapi/src/model/customer.dart';
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

     this.id,

     this.customer,

     this.driver,

     this.pickup,

     this.dropoff,

     this.startedAt,

     this.completedAt,

     this.status,

     this.note,

     this.price,

     this.distance,

     this.path,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final String? id;



  @JsonKey(
    
    name: r'customer',
    required: false,
    includeIfNull: false,
  )


  final Customer? customer;



  @JsonKey(
    
    name: r'driver',
    required: false,
    includeIfNull: false,
  )


  final Driver? driver;



  @JsonKey(
    
    name: r'pickup',
    required: false,
    includeIfNull: false,
  )


  final Address? pickup;



  @JsonKey(
    
    name: r'dropoff',
    required: false,
    includeIfNull: false,
  )


  final Address? dropoff;



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
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final TripStatusEnum? status;



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
      other.id == id &&
      other.customer == customer &&
      other.driver == driver &&
      other.pickup == pickup &&
      other.dropoff == dropoff &&
      other.startedAt == startedAt &&
      other.completedAt == completedAt &&
      other.status == status &&
      other.note == note &&
      other.price == price &&
      other.distance == distance &&
      other.path == path;

    @override
    int get hashCode =>
        id.hashCode +
        customer.hashCode +
        driver.hashCode +
        pickup.hashCode +
        dropoff.hashCode +
        startedAt.hashCode +
        completedAt.hashCode +
        status.hashCode +
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


enum TripStatusEnum {
@JsonValue(r'PENDING')
PENDING(r'PENDING'),
@JsonValue(r'REQUESTED')
REQUESTED(r'REQUESTED'),
@JsonValue(r'ACCEPTED')
ACCEPTED(r'ACCEPTED'),
@JsonValue(r'ARRIVING')
ARRIVING(r'ARRIVING'),
@JsonValue(r'IN_PROGRESS')
IN_PROGRESS(r'IN_PROGRESS'),
@JsonValue(r'COMPLETED')
COMPLETED(r'COMPLETED'),
@JsonValue(r'CANCELLED_BY_CUSTOMER')
CANCELLED_BY_CUSTOMER(r'CANCELLED_BY_CUSTOMER'),
@JsonValue(r'CANCELLED_BY_DRIVER')
CANCELLED_BY_DRIVER(r'CANCELLED_BY_DRIVER'),
@JsonValue(r'CANCELLED_BY_SYSTEM')
CANCELLED_BY_SYSTEM(r'CANCELLED_BY_SYSTEM'),
@JsonValue(r'NO_SHOW')
NO_SHOW(r'NO_SHOW'),
@JsonValue(r'FAILED')
FAILED(r'FAILED');

const TripStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


