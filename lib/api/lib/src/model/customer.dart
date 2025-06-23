//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Customer {
  /// Returns a new [Customer] instance.
  Customer({

     this.id,

     this.fullName,

     this.phone,

     this.addresses,
  });

      /// The ID of the customer
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



      /// The addresses of the customer
  @JsonKey(
    
    name: r'addresses',
    required: false,
    includeIfNull: false,
  )


  final List<Address>? addresses;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Customer &&
      other.id == id &&
      other.fullName == fullName &&
      other.phone == phone &&
      other.addresses == addresses;

    @override
    int get hashCode =>
        id.hashCode +
        fullName.hashCode +
        phone.hashCode +
        addresses.hashCode;

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

